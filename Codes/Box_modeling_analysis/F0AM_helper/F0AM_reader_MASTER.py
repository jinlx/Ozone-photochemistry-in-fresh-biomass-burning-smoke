# F0AM_reader_MASTER.py
import requests

# ==============
# Import modules
# ==============
#import warningsprd_map
import numpy as np
import pandas as pd
import scipy.io
import os

#warnings.filterwarnings('ignore')
from ConstantVal import *

# ======================================================================================
# Usage: returning F0AM mat structure data to dataframe
# The function simply reads the F0AM output for specific compound, 
# for either background values or smoke concentration or dilution correted concentration.
# The index of the dataframe is 
# ======================================================================================
def getF0AM_mat_conc(F0AM_model_file, variable_name, get_conc):
    """
    read a struct-ified table variable (and column names) from a MAT-file
    and return pandas.DataFrame object.
    """
    # 1) choosing smk conc or dilution-corrected one you want to use
    if 'dil' in F0AM_model_file: 
        data_struc = 'Sd'
    elif 'norm' in F0AM_model_file:
        data_struc = 'Sconorm'
    else:
        data_struc = 'S'
    # 2) load file
    mod_struc = scipy.io.loadmat(F0AM_model_file)
    # 3) get concentration from model
    data_string = 'Conc' if get_conc else 'BkgdConc'
    mod_conc = (mod_struc[data_struc][data_string]).item().item() 
    # 4) get cnames
    mod_cnames = mod_struc[data_struc]['Cnames'].item()
    # 5) get the mdoel time (in sec)
    mod_time = mod_struc[data_struc]['Time'].item()
    # 6) convert tuple into array
    mod_conc = np.array(mod_conc)
    # 7) convert 3D into 2D
    mod_conc = mod_conc[:,:,0]
    # 8) make the data frame
    mod_df = pd.DataFrame(np.hstack((mod_conc, mod_cnames)))
    # 9) save last column of dataframe as a series
    last_column = mod_df.iloc[: , -1]
    # 10) delete the last column
    mod_df = mod_df.iloc[:, :-1]
    # 11) get names from the model
    mod_cnames = []
    for data in last_column:
        data = data.item()
        mod_cnames.append(data)
    # 12) rename index of the python dataframe
    mod_df.index = mod_cnames
    # 13) rename the column names as time
    mod_time = mod_time[:,0]
    if get_conc:
        mod_df.columns = mod_time/60.0 # change second to minutes
    else:
        tmp = [mod_df]*len(mod_time)
        mod_df = pd.concat(tmp,axis = 1)
        mod_df.columns = mod_time/60.0 # change second to minutes
    return mod_df.loc[variable_name,:]

# ===========================================================
# This function is used get the lifetime from the F0AM output
# ============================================================
def getF0AM_lifetimes(F0AM_model_file):
    """
    Extracts lifetime data from a F0AM model output file.

    Parameters:
    F0AM_model_file (str): Path to the F0AM output MAT-file.

    Returns:
    pandas.DataFrame: DataFrame containing lifetime data for various compounds.
    """

    # Step 1: Define the data structure name for lifetime data
    data_struc = 'Lifetime'

    # Step 2: Load the MAT-file containing F0AM model output
    mod_struc = scipy.io.loadmat(F0AM_model_file)

    # Extract the Lifetime data from the loaded structure
    mod_data = mod_struc['Lifetime'][0]

    # Step 3: Determine the number of compounds and time steps in the data
    num_compounds = len(mod_struc['Lifetime'][0])
    num_timestep = len(mod_struc['Lifetime'][0][0][2])

    # Step 4: Extract and process lifetime data
    # Initialize lists to store compound names and lifetimes
    names = []
    lifetimes = []

    # Loop through each compound to extract its name and lifetime
    for ind in range(num_compounds):
        # Extract compound name
        name = mod_struc['Lifetime'][0][ind][0][0]
        names.append(name)

        # Extract lifetime data
        tmp = mod_struc['Lifetime'][0][ind][1]
        lifetimes.append(tmp)

    # Reshape the lifetime data into a 2D array for DataFrame creation
    lifetimes_2d = np.reshape(lifetimes, (num_compounds, num_timestep))

    # Create a DataFrame from the 2D array of lifetimes
    df = pd.DataFrame(data=lifetimes_2d).transpose()
    df.columns = names

    # Convert index (time) from seconds to minutes
    Time = mod_struc['Lifetime'][0][0][2].flatten()
    df.index = Time / 60  # Note: Initial smoke age is not considered here

    # Step 5: Clean up the DataFrame
    # Drop columns that contain only NaN, inf, or -inf values
    df = df.loc[:, ~(df.isin([np.nan, np.inf, -np.inf])).all(axis=0)]

    return df
# ===========================================================
# This function is used to get the time from the F0AM output
# ===========================================================
def getF0AM_time(F0AM_model_file):
    # 1) choosing smk conc or dilution-corrected one you want to use
    if 'dil' in F0AM_model_file: 
        data_struc = 'Sd'
    elif 'norm' in F0AM_model_file:
        data_struc = 'Sconorm'
    else:
        data_struc = 'S'
    # 2) load file
    mod_struc = scipy.io.loadmat(F0AM_model_file)
    # 3) get the mdoel time (in sec)
    mod_time = mod_struc[data_struc]['Time'].item()
    return np.hstack(mod_time)


# =====================================================================
# This function is used for extracted F0AM data
# =====================================================================
# This function is used to extract data like PNs, ANs, otherNOy, HOx, RO2, and compounds initialized in the model, and VOCR
# This function also automatically remove the funciton 
def read_extract_F0AM(F0AM_model_file, variable_name):
    # choosing smk conc or dilution-corrected one you want to use
    if 'dil' in F0AM_model_file: 
        data_struc = 'Extract_dil'
    elif 'norm' in F0AM_model_file:
        data_struc = 'Extract_conorm'
    else:
        data_struc = 'Extract'
    
    # load file
    mod_struc = scipy.io.loadmat(F0AM_model_file)
    
    # names and time
    # not sure why the structure of names is bizzar but we try to work around it.
    dummy_len1 = len(mod_struc[data_struc][variable_name+'_names'].item()[0])
    if dummy_len1 > 1:
        mod_names_tuple = mod_struc[data_struc][variable_name+'_names'].item()[0]
    else:
        mod_names_tuple = mod_struc[data_struc][variable_name+'_names'].item()
    mod_time_tuple  = mod_struc[data_struc]['Time'].item()
    
    # convert tuple to list or list comprehension 
    mod_names = [item for t in mod_names_tuple for item in t]

    # special setting
    if len(mod_names) == len([item for t in mod_names for item in t]):
        mod_names = [item for t in mod_names for item in t]

    mod_time  = [item for t in mod_time_tuple for item in t]
    
    # concentration
    mod_conc = mod_struc[data_struc][variable_name].item().item() if variable_name not in ['VOCR'] else mod_struc[data_struc][variable_name].item().transpose()
    # convert tuple into array
    mod_conc = np.array(mod_conc)
    # convert 3D into 2D
    if variable_name not in ['VOCR']: mod_conc = mod_conc[:,:,0] 
    # create dataframe
    df_mod   = pd.DataFrame(mod_conc, index= mod_names).transpose()
    df_mod.index=np.array(mod_time)/60 # convert sec to min
    # remove dummy columns
    dummy_columns = []
    compounds = df_mod.columns.values
    for comp in compounds:
        if 'dummy' in comp: dummy_columns.append(comp)
    df_mod = df_mod.drop(dummy_columns, axis=1)

    return df_mod

def get_df_specs_reduced(df_Initcompounds, spec_list, GC_setting, MCM_setting):
    mod_time = df_Initcompounds.index
    data_dummy = [0]*len(mod_time)
    df_dummy = pd.DataFrame(data_dummy, index = mod_time, columns = ['Dummy'])
    for ind, spec in enumerate(spec_list):   
        if GC_setting: spec = names_std_GC.get(spec, spec)
        if MCM_setting: spec = names_std_MCM.get(spec, spec)
        # lumped species
        # NOx
        if spec == 'NOx':
            try:
                spec_conc = df_Initcompounds['NO'] + df_Initcompounds['NO2']
            except:
                spec_conc = [0]*len(mod_time)
                print('NO ' + spec + ' EXIST!')
        # NO/NO2 ratio, the ratio is closely related to radical turnover and O3 produciton. See eqn5 in Wolfe et al., 2022
        elif spec == 'NONO2Ratio':
            try:
                spec_conc = df_Initcompounds['NO']/df_Initcompounds['NO2']
            except:
                spec_conc = [0]*len(mod_time)
                print('NO ' + spec + ' EXIST!')
    
        # Xylenes
        elif spec == 'Xylenes':
            if MCM_setting:
                spec_conc = df_Initcompounds['PXYL'] + df_Initcompounds['OXYL'] + df_Initcompounds['EBENZ']
            elif GC_setting:
                spec_conc = df_Initcompounds['XYLE']
        # MVK + MACR
        elif spec == 'MVK + MACR':
            if MCM_setting:
                spec_conc = df_Initcompounds['MVK'] + df_Initcompounds['MACR']
            elif GC_setting:
                spec_conc = df_Initcompounds['MVK'] + df_Initcompounds['MACR']
                
        # Lumped C>=3 alkenes or PRPE
        elif spec == 'Lumped C>=3 alkenes':
            if MCM_setting:
                spec_conc = df_Initcompounds['C3H6'] + df_Initcompounds['BUT1ENE'] + df_Initcompounds['TBUT2ENE'] + \
                            df_Initcompounds['CBUT2ENE'] + df_Initcompounds['PENT1ENE'] + df_Initcompounds['HEX1ENE'] 
            elif GC_setting:
                spec_conc = df_Initcompounds['PRPE']
        # Lumped C>=4 alkanes or ALK4
        elif spec == 'Lumped C>=4 alkanes':
            if MCM_setting:
                spec_conc = df_Initcompounds['NC4H10'] + df_Initcompounds['IC4H10'] + df_Initcompounds['NC5H12'] + \
                            df_Initcompounds['IC5H12'] + df_Initcompounds['NC6H14'] + df_Initcompounds['M3PE'] + \
                            df_Initcompounds['M22C4'] + df_Initcompounds['NC7H16'] + df_Initcompounds['NC8H18'] + \
                            df_Initcompounds['NC9H20']
            elif GC_setting:
                spec_conc = df_Initcompounds['ALK4']
        ## Lumped C>=3 aldehydes or RCHO
        elif spec == 'Lumped C>=3 aldehydes':
            if MCM_setting:
                spec_conc = df_Initcompounds['C2H5CHO'] + df_Initcompounds['C3H7CHO'] + df_Initcompounds['IPRCHO'] + \
                            df_Initcompounds['BUT2CHO'] + df_Initcompounds['C5H11CHO'] + df_Initcompounds['C6H13CHO']
            elif GC_setting:
                spec_conc = df_Initcompounds['RCHO']

        ## Monoterpenes
        elif spec == 'Monoterpenes':
            if MCM_setting:
                spec_conc = df_Initcompounds['APINENE'] + df_Initcompounds['BPINENE']
            elif GC_setting:
                spec_conc = df_Initcompounds['MTPA']
        
        # Furans
        elif spec == 'Furans':
            if MCM_setting:
                try:
                    spec_conc = df_Initcompounds['FURAN'] + df_Initcompounds['M2FURAN'] + df_Initcompounds['M3F'] + df_Initcompounds['DIMEFURAN']
                except:
                    spec_conc = [0]*len(mod_time)
                    print('NO ' + spec + ' EXIST!')
            elif GC_setting:
                try:
                    spec_conc = df_Initcompounds['Furans']
                except:
                    spec_conc = [0]*len(mod_time)
                    print('NO ' + spec + ' EXIST!')

        # Methylfurans
        elif spec == 'Methylfuran':
            if MCM_setting:
                try:
                    spec_conc = df_Initcompounds['M2FURAN'] + df_Initcompounds['M3F']
                except:
                    spec_conc = [0]*len(mod_time)
                    print('NO ' + spec + ' EXIST!')
            elif GC_setting:
                try:
                    spec_conc = df_Initcompounds['Methylfuran']
                except:
                    spec_conc = [0]*len(mod_time)
                    print('NO ' + spec + ' EXIST!')
                    
        
        # Furfurals
        elif spec == 'Furfurals':
            if MCM_setting:
                try:
                    spec_conc = df_Initcompounds['FURFURAL'] + df_Initcompounds['MEFURFURAL']
                except:
                    spec_conc = [0]*len(mod_time)
                    print('NO ' + spec + ' EXIST!')
            
            elif GC_setting:
                try:
                    spec_conc = df_Initcompounds['Furfurals']
                except:
                    spec_conc = [0]*len(mod_time)
                    print('NO ' + spec + ' EXIST!')
                
        # Other compounds that are not included in the GEOS-Chem and MCM
        else:
            try:
                spec_conc = df_Initcompounds[spec]
            except:
                spec_conc = [0]*len(mod_time)
                print('NO ' + spec + ' EXIST!')
        df_conc = pd.DataFrame(np.array(spec_conc), index = mod_time, columns = [spec_list[ind]])
        df_dummy = pd.concat([df_dummy, df_conc], axis=1)
    # drop the dummy 
    df_dummy = df_dummy.drop('Dummy', axis=1) # this might not be necessary 
    # return data
    return df_dummy
    
# this function is used to process addtional compounds despite we do not have it in the raw data and spec_total
def F0AM_cleaner_reduced(file_name, spec_list, GC_setting, MCM_setting, init_time):
    # Read required compounds from Initcompounds
    ## select compounds we are interested in, e.g., CO, NO, NO2, PAN, and VOCs
    df_Initcompounds = read_extract_F0AM(file_name, 'Initcompounds')
    df_reduced = get_df_specs_reduced(df_Initcompounds, spec_list, GC_setting, MCM_setting)
    # Read OH and HO2, total RO2, total PNs, total ANs, total other NOy, total VOCR, total NOy, and total NOz
    #MO2 and MCO3

    df_MO2  = read_extract_F0AM(file_name, 'MO2')  # is this universable for MCM?
    df_MCO3 = read_extract_F0AM(file_name, 'MCO3') # is this universable for MCM?
    
    ## HOx
    df_HOx = read_extract_F0AM(file_name, 'HOx')
    df_HOx['HOx'] = df_HOx['OH'] + df_HOx['HO2']

    ## Total RO2
    df_RO2 = read_extract_F0AM(file_name, 'RO2')
    df_TRO2 = pd.DataFrame(df_RO2.sum(axis=1))
    df_TRO2.columns = ['TRO2']

    ## Total PNs
    df_PNs = read_extract_F0AM(file_name, 'PNs')
    df_TPNs = pd.DataFrame(df_PNs.sum(axis=1))
    df_TPNs.columns = ['TPNs']

    ## Total ANs
    df_ANs = read_extract_F0AM(file_name, 'ANs')
    df_TANs = pd.DataFrame(df_ANs.sum(axis=1))
    df_TANs.columns = ['TANs']

    # Total NOy
    df_TNOy = read_extract_F0AM(file_name, 'NOy')
    df_TNOy = pd.DataFrame(df_TNOy.sum(axis=1))
    df_TNOy.columns = ['TNOy']
    
    #Total NOz
    df_TNOz = read_extract_F0AM(file_name, 'NOz')
    df_TNOz = pd.DataFrame(df_TNOz.sum(axis=1))
    df_TNOz.columns = ['TNOz']
        

    
    ## Total VOCR
    df_VOCR = read_extract_F0AM(file_name, 'VOCR')
    df_TVOCR = pd.DataFrame(df_VOCR.sum(axis=1))
    df_TVOCR.columns = ['TVOCR']
    

    
    # Merge above data together
    # This is where we need to add data
    df_merged = pd.concat([df_MO2, df_MCO3, df_HOx, df_TRO2, df_TPNs, df_TANs, df_TVOCR, df_TNOy, df_TNOz, df_reduced], axis=1)
    
    # standarized the time
    # step 1: clean up duplicate index for F0AM model out put
    df_merged = df_merged.loc[~df_merged.index.duplicated(), :] 
    
    # step 2: remove dummy column
    #df_mod = df_mod.drop('Dummy', inplace=False, axis=1)
    
    # step 3: correct model simulation time with initial plume age time and get requries species
    df_merged.index = init_time + df_merged.index    
    #rename columns in DataFrame using dictionary
    if GC_setting:  df_merged.rename(columns=names_GC_std, inplace=True)    
    if MCM_setting: df_merged.rename(columns=names_MCM_std, inplace=True)    
    return df_merged

# =====================================================================
# This function calls getF0AM_mat_conc
# Beyond the getF0AM_mat_conc, this function can read multiple species.
# Creating a dictionary to make names from mechanisms consitent
# You can also lumping compounds here.
# This is obsolete after the reduced version data
# =====================================================================
def get_df_specs(file_name, spec_list, GC_setting, MCM_setting, get_conc):
    # 0) make it always true
    #get_conc = True
    # 1) create a dummy dataframe
    spec_conc = getF0AM_mat_conc(file_name, 'CO', get_conc)
    time = spec_conc.index
    data_dummy = [0]*len(time)
    df_dummy = pd.DataFrame(data_dummy, index = time, columns = ['Dummy'])
    # 2) species that we need to do some simple calculation
    for ind, spec in enumerate(spec_list):
        # 2.1) GEOS-Chem name mapping
        if GC_setting: spec = names_std_GC.get(spec, spec)
        # 2.2) MCM name mapping
        if MCM_setting: spec = names_std_MCM.get(spec, spec)
        # 2.3) Playing with lumped species in the GEOS-Chem, MCM, and unmodeled compounds
        # lumped species
        # NOx
        if spec == 'NOx':
            print(spec)
            try:
                spec_conc = getF0AM_mat_conc(file_name, 'NO', get_conc) + getF0AM_mat_conc(file_name, 'NO2', get_conc)
            except:
                spec_conc = [0]*len(time)
                print('NO ' + spec + ' EXIST!')
        # NO/NO2 ratio, the ratio is closely related to radical turnover and O3 produciton. See eqn5 in Wolfe et al., 2022
        elif spec == 'NONO2Ratio':
            try:
                spec_conc = getF0AM_mat_conc(file_name, 'NO', get_conc)/getF0AM_mat_conc(file_name, 'NO2', get_conc)
            except:
                spec_conc = [0]*len(time)
                print('NO ' + spec + ' EXIST!')
        # HOx
        elif spec == 'HOx':
            try:
                spec_conc = getF0AM_mat_conc(file_name, 'OH', get_conc) + getF0AM_mat_conc(file_name, 'HO2', get_conc)
            except:
                spec_conc = [0]*len(time) 
                print('NO ' + spec + ' EXIST!')
                
        # Xylenes
        elif spec == 'Xylenes':
            if MCM_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'PXYL', get_conc) + getF0AM_mat_conc(file_name, 'OXYL', get_conc) + \
                                getF0AM_mat_conc(file_name, 'EBENZ', get_conc)
            elif GC_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'XYLE', get_conc)
        # Lumped C>=3 alkenes or PRPE
        elif spec == 'Lumped C>=3 alkenes':
            if MCM_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'C3H6', get_conc) + getF0AM_mat_conc(file_name, 'BUT1ENE', get_conc) + \
                                getF0AM_mat_conc(file_name, 'TBUT2ENE', get_conc) + getF0AM_mat_conc(file_name, 'CBUT2ENE', get_conc) + \
                                getF0AM_mat_conc(file_name, 'PENT1ENE', get_conc) + getF0AM_mat_conc(file_name, 'HEX1ENE', get_conc) 
                
                
            elif GC_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'PRPE', get_conc)
                
        # Lumped C>=3 alkanes or PRPE
        elif spec == 'Lumped C>=4 alkanes':
            if MCM_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'NC4H10', get_conc) + getF0AM_mat_conc(file_name, 'IC4H10', get_conc) + \
                                getF0AM_mat_conc(file_name, 'NC5H12', get_conc) + getF0AM_mat_conc(file_name, 'IC5H12', get_conc) + \
                                getF0AM_mat_conc(file_name, 'NC6H14', get_conc) + getF0AM_mat_conc(file_name, 'M3PE', get_conc) + \
                                getF0AM_mat_conc(file_name, 'M22C4', get_conc) + getF0AM_mat_conc(file_name, 'NC7H16', get_conc) + \
                                getF0AM_mat_conc(file_name, 'NC8H18', get_conc) + getF0AM_mat_conc(file_name, 'NC9H20', get_conc)
            elif GC_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'ALK4', get_conc)

        # Lumped C>=3 aldehydes or RCHO
        elif spec == 'Lumped C>=3 aldehydes':
            if MCM_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'C2H5CHO', get_conc) + getF0AM_mat_conc(file_name, 'C3H7CHO', get_conc) + \
                                getF0AM_mat_conc(file_name, 'IPRCHO', get_conc) + getF0AM_mat_conc(file_name, 'BUT2CHO', get_conc) + \
                                getF0AM_mat_conc(file_name, 'C5H11CHO', get_conc) + getF0AM_mat_conc(file_name, 'C6H13CHO', get_conc)

            elif GC_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'RCHO', get_conc)
        # Xylenes
        elif spec == 'Xylenes':
            if MCM_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'PXYL', get_conc) + getF0AM_mat_conc(file_name, 'OXYL', get_conc) + \
                                getF0AM_mat_conc(file_name, 'EBENZ', get_conc)
            elif GC_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'XYLE', get_conc)
                
        # Monoterpenes
        elif spec == 'Monoterpenes':
            if MCM_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'APINENE', get_conc) + getF0AM_mat_conc(file_name, 'BPINENE', get_conc)
            elif GC_setting:
                spec_conc = getF0AM_mat_conc(file_name, 'MTPA', get_conc)
        # Furans
        elif spec == 'Furans':
            if MCM_setting:
                try:
                    spec_conc = df_Initcompounds['FURAN'] + df_Initcompounds['M2FURAN'] + df_Initcompounds['DIMEFURAN']
                except:
                    spec_conc = [0]*len(time)
                    print('NO ' + spec + ' EXIST!')
            elif GC_setting:
                try:
                    spec_conc = df_Initcompounds['Furans']
                except:
                    spec_conc = [0]*len(time)
                    print('NO ' + spec + ' EXIST!')
                    
        # Methylfurans
        elif spec == 'Methylfuran':
            if MCM_setting:
                try:
                    spec_conc = df_Initcompounds['M2FURAN'] + df_Initcompounds['M3F']
                except:
                    spec_conc = [0]*len(mod_time)
                    print('NO ' + spec + ' EXIST!')
            elif GC_setting:
                try:
                    spec_conc = df_Initcompounds['Methylfuran']
                except:
                    spec_conc = [0]*len(mod_time)
                    print('NO ' + spec + ' EXIST!')
                    
        # Furfurals
        elif spec == 'Furfurals':
            if MCM_setting:
                try:
                    spec_conc = df_Initcompounds['FURFURAL'] + df_Initcompounds['MEFURFURAL']
                except:
                    spec_conc = [0]*len(time)
                    print('NO ' + spec + ' EXIST!')
            
            elif GC_setting:
                try:
                    spec_conc = df_Initcompounds['Furfurals']
                except:
                    spec_conc = [0]*len(time)
                    print('NO ' + spec + ' EXIST!')
                
        # Other compounds that are not included in the GEOS-Chem and MCM
        else:
            try:
                spec_conc = getF0AM_mat_conc(file_name, spec, get_conc)
            except:
                spec_conc = [0]*len(time)
                print('NO ' + spec + ' EXIST!')
        df_conc = pd.DataFrame(np.array(spec_conc), index = time, columns = [spec_list[ind]])
        df_dummy = pd.concat([df_dummy, df_conc], axis=1)
        
    # drop the dummy 
    df_dummy = df_dummy.drop('Dummy', axis=1) # this might not be necessary 
    return df_dummy

'''
# ===========================================================================================================================
# This function calls get_df_specs.
# This function is used to process the F0AM data output, named as F0AM_processor.
# Here we are able to clean up duplicate data index, correct oxidation time, and interpolate data basded on observation time.
# ===========================================================================================================================
def F0AM_cleaner(file_name, spec_list, GC_setting, MCM_setting, init_time):
    # step 1: read data and clean up duplicate index for F0AM model out put
    df_mod = get_df_specs(file_name=file_name, spec_list = spec_list, 
                          GC_setting=GC_setting, MCM_setting=MCM_setting, get_conc=True)
    df_mod = df_mod.loc[~df_mod.index.duplicated(), :] 
    
    # step 2: remove dummy column
    #df_mod = df_mod.drop('Dummy', inplace=False, axis=1)
    
    # step 3: correct model simulation time with initial plume age time and get requries species
    df_mod.index = init_time + df_mod.index
    # return the data
    return df_mod
'''
# ========================================================
# Functions to process production rates from F0AM outputs
# ========================================================
def flatten_rate_names(name):
    # convert 2D into 1D
    name_processed = np.reshape(name, len(name))
    # flatten the data
    name_processed = [item for sublist in name_processed for item in sublist]
    # transpose the list
    name_processed = np.transpose(name_processed)
    return name_processed

def read_F0AM_rates(file_name, topX):
    # 1)define the F0AM data stuc nam
    data_struc = 'SpRates'
    # 2) load file
    mod_struc = scipy.io.loadmat(file_name)
    # 3) get data from model
    Time_raw = mod_struc['Time']
    Pnames = mod_struc['Pnames']
    Prod  = mod_struc['Prod']
    Lnames = mod_struc['Lnames']
    Loss  = mod_struc['Loss']
    # 4) flatten the data, i.e., names
    Time = np.array([x[0] for x in Time_raw])/60.0 #/60.0 # the time is in unit of hour
    Pnames = flatten_rate_names(Pnames)
    if 'Dilution' in Lnames: 
        Lnames = flatten_rate_names(Lnames)[:-1] # ignore dilution as this is not considered    
    else:
        Lnames = flatten_rate_names(Lnames) 
    # Work around 
    if len(Loss[0]) - len(Lnames) == 1: 
        Loss = [row[1:] for row in Loss]
    # 5) create dataframe
    df_prod_raw = pd.DataFrame(Prod, columns = Pnames)
    df_loss_raw = pd.DataFrame(Loss, columns = Lnames)
    # 5.5) select the top X
    df_prod = get_mean_topX_df(df_prod_raw, topX, ascending=False)
    df_loss = get_mean_topX_df(df_loss_raw, topX, ascending=True)
    # 6) make the dindex as time
    df_prod.index = Time
    df_loss.index = Time
    # 7) get the data structure and return it
    
    print(df_loss.iloc[1:])
    sdfa
    df_strc = {'Prod': df_prod.iloc[1:],
               'Loss': df_loss.iloc[1:]}
    
    return df_strc


def get_mean_topX_df(df, topX, ascending):
    """
    Selects the top 'X' compounds from a DataFrame based on their mean values,
    combines the rest into an 'Others' column, and includes any existing 'Others' column in this aggregation.
    Drops any columns where all values are 0.

    Parameters:
    df (DataFrame): The input DataFrame with various compounds as columns.
    topX (int): Number of top compounds to select based on their mean values.
    ascending (bool): Determines the sorting order of the mean values (True for ascending, False for descending).

    Returns:
    DataFrame: A modified DataFrame with top 'X' compounds and an 'Others' column for the rest and any original 'Others'.
    """
    # Check if 'Others' column exists and store its values
    if 'Others' in df.columns:
        others_original = df['Others']
        df = df.drop('Others', axis=1)
    else:
        others_original = None

    # Reorder the columns of df based on the mean values in ascending or descending order
    df = df.reindex(df.mean().sort_values(ascending=ascending).index, axis=1)

    # Retrieve the column names of the reordered DataFrame
    names = df.columns.values

    # Split the column names into two groups: top 'X' compounds and the remaining ones
    names_topX, names_others = names[:topX], names[topX:]

    # Create a new DataFrame containing only the columns for the top 'X' compounds
    df_processed = df[names_topX]

    # Add a new column 'Others' which is the sum of all columns not in the top 'X'
    df_processed['Others'] = df.loc[:, names_others].sum(axis=1)

    # Include the original 'Others' values if it existed
    if others_original is not None:
        df_processed['Others'] += others_original

    # Drop columns where all values are zero
    df_processed = df_processed.loc[:, (df_processed != 0).any(axis=0)]

    # Return the processed DataFrame
    return df_processed


# This is funciton is used to lump reaction/radicals for production rates
def prd_map_process(df_prod_raw):
    # Define a mapping dictionary
    lump_categories = {
        'Ethene': ['ETO', 'C2H4', 'HOCH2CH2O', 'HOCH2CO3', 'HOCH2CH2O2', 'HYETHO2H'],
        'Propene': ['PRPE', 'PO2', 'PP', 'C3H6', 'HYPROPO', 'IPROPOLO', 'TBUT2ENE', 'BUT2OLAO', 'CBUT2ENE',
                                'HYPROPO2H', 'HYPROPO2', 'C6OH5O2', 'BUT2OLO2', 'NBUTOLAO2', 'PE1ENEAO2', 'C6OH5O', 'BUT2OLO', 
                                'NBUTOLAO', 'PE1ENEAO', 'C4CHOBO2', 'HEX1ENE', 'BUT1ENE'],
        'Propane': ['B3O2', 'A3O2', 'IC3H7O2', 'NC3H7O2', 'IC3H7O', 'NC3H7O', 'C3H8'],
        'Lumped C≥4 alkanes': ['R4O2', 'OCTO2', 'HEPTO2', 'SC4H9O2', 'HEXCO2', 'TC4H9O', 'IPECO', 'SC4H9O', 'M3PECO', 'ALK4'],
        '1,3-Butadiene': ['BUTDBO2', 'BUTDAO2', 'BUTDCO2', 'BUTDBO', 'BUTDAO', 'C4H6', 'BUTDCO'],
        'Acrolein': ['ACO3', 'CHOCOHCO', 'OCCOHCO', 'ACRO2', 'ACRPAN', 'ACR'],
        '2-Butenal': ['C4ALDB', 'C4OCCOHCO'],
        'Glyoxal': ['GLYX', 'GLYOX'],
        'Glycolaldehyde': ['GLYC', 'HOCH2CHO'],
        'Methylglyoxal': ['MGLY', 'MGLYOX'],
        'Formaldehyde': ['CH2O', 'HCHO'],
        'Acetaldehyde': ['ALD2', 'CH3CHO'],
        'Lumped C≥3 aldehydes': ['RCHO','BUT2CO3', 'C5H11CO3', 'C4H9CO3', 'C3H7CO3', 'C2H5CO3', 'IPRCO3', 'M2PROPAL2O', 'PIPN', 'C4H9CHO', 'C2H5CHO', 'C5H11CHO'],
        'Methanol': ['MOH', 'CH3OH'],
        'Ethanol': ['EOH', 'C2H5OH'],
        'Benzenoid': [ 'XYLE', 'AROMP4', 'AROMP5', 'OXYBIPERO', 'PXYBIPERO', 'TLBIPERO', 'OXYLOL', 'TLBIPERO2', 'OXYBIPERO2', 'PXYBIPERO2',
                      'BZBIPERO2', 'EBZBIPERO2', 'BZCO3', 'C6H5CO3', 'EBZBIPERO', 'BZBIPERO', 'BENZ', 'BENZENE', 
                      'TOLU', 'TOLUENE', 'C6H5CH2O', 'C6H5CH2OOH', 'TLOBIPEROH', 
                      'CRESO', 'PHENO', 'NPHENO', 'PHEN', 'PHENOL',
                      'TM135BPRO', 'TM135OBPOH', 'TM123MUCO'],
        'Furanoid': ['MALDIALCO3', 'FURFURAL', 'FURAN', 'M2FURAN', 'DIMEFURAN', 'MEFURFURAL', 'BZFUONE', 'HYDFURFURALO2', 'BZFUO', 'MALDIALCO2', 
                     'MALDIALO', 'MALDIALPAN', 'C4DBDIKET', 'C5DICARBO', 'C5CO14O2', 'C5COO2NO2', 'DMKOHO', 'C5CO14CO2', 'HCOCH2O', 'HYDMEFURFURALO2', 'CARBFURANO2', 'C6DCARBBO'],
        'Catechol': ['NCATECHOL', 'CATEC1O'],
        'Dimethylphenol': ['OXYOLO'],
        'Styrene': ['STYRENO', 'STYRENE', 'NSTYRENEO', 'PHCHOO'],
        'Isoprene': ['ISOP', 'IHOO4', 'IHOO1', 'IDHNDOO1', 'IDHNDOO2', 'ISOPNOO1', 'ISOPBO2', 'ISOPDO2', 'ISOPNOO2', 'CISOPAO2', 'INO2B', 'INO2D', 'C537O'],
        'Monoterpenes': ['PIO2', 'MTPA', 'BPINCO', 'C108O', 'APINCO', 'C98O', 'C106O', 'C919O', 'C917O', 'APINCNO3', 'BPINCNO3', 'C916O', 'C922O', 'C813O', 
                         'C810O', 'C89PAN', 'APINENE', 'BPINENE', 'APINAO2', 'APINAO', 'APINBO2', 'APINBO', 'BPINAO2', 'BPINBO2', 'APINCO2', 'BPINCO2', 'BPINAO', 'BPINBO',
                         'C720O2', 'C717O2', 'NOPINAO2', 'C106O2', 'C614O2', 'C89CO3', 'C96CO3', 'C811CO3'],
        'MVK': ['MVK', 'MVKOHOO', 'HMVKAO2', 'HMVKAO', 'HMVKBO2', 'HMVKBO'],
        'C>3 Ketones': ['KO2'],
        'Hydroxyacetone': ['HAC', 'ACETOL'],
        'CH$_{3}$O$_{2}$': ['MO2', 'CH3O'],
        '2,3-Butanedione': ['BIACET'],
        
    }

    # Iterate over each compound in the DataFrame
    for col_name in df_prod_raw.columns:
        prod_compound = col_name.split(' + ') if ' + ' in col_name else [col_name]
        
        # Check each category
        for category, compounds in lump_categories.items():
            if any(comp in prod_compound for comp in compounds):
                if category not in df_prod_raw:
                    df_prod_raw.loc[:, category] = 0
                df_prod_raw.loc[:, category] += df_prod_raw[col_name]
                df_prod_raw = df_prod_raw.drop(col_name, axis=1)
                break

    # Calculate the mean of each column
    mean_values = df_prod_raw.mean()

    # Sort the means in descending order (use ascending=True for ascending order)
    sorted_columns = mean_values.sort_values(ascending=False).index

    # Reorder the columns of df_prod_raw based on the sorted mean values
    df_prod_sorted = df_prod_raw[sorted_columns]
                
    return df_prod_sorted


# ===========================================
# Functions to study photochemical indicators
# ===========================================
# This function is used to combine RO2, RCO3, and RPAN together.
def O3_PL_budget_processor(df):
    rxts = df.columns
    RO2_NO_rxt  = []
    RPAN_OH_rxt = []
    RO2_NO2_rxt = []
    RO_NO2_rxt  = []
    for rxt in rxts:
        try:
            R1, R2 = rxt.split(' + ')
            # RO2 + NO or NO + RO2
            if ((('O2' == R1[-2::] and R2 == 'NO') or ('O2' == R2[-2::] and R1 == 'NO')) or \
            (('OO' == R1[-2::] and R2 == 'NO') or ('OO' == R2[-2::] and R1 == 'NO')) or \
            (('OO1' == R1[-3::] and R2 == 'NO') or ('OO1' == R2[-3::] and R1 == 'NO')) or \
            (('OO2' == R1[-3::] and R2 == 'NO') or ('OO2' == R2[-3::] and R1 == 'NO')) or \
            (('OO3' == R1[-3::] and R2 == 'NO') or ('OO3' == R2[-3::] and R1 == 'NO')) or \
            (('OO4' == R1[-3::] and R2 == 'NO') or ('OO4' == R2[-3::] and R1 == 'NO')) or \
            (('CO3' == R1[-3::] and R2 == 'NO') or ('CO3' == R2[-3::] and R1 == 'NO'))) and (R1 != 'HO2' and R2 != 'HO2'):
                RO2_NO_rxt.append(rxt)
            # RPAN + OH or OH + RPAN
            if ('PAN' == R1[-3::] and R2 == 'OH') or ('PAN' == R2[-3::] and R1 == 'OH'):
                RPAN_OH_rxt.append(rxt)
                
            # RO2 + NO2
            if ((('O2' == R1[-2::] and R2 == 'NO2') or ('O2' == R2[-2::] and R1 == 'NO2')) or \
            (('OO' == R1[-2::] and R2 == 'NO2') or ('OO' == R2[-2::] and R1 == 'NO2')) or \
            (('OO1' == R1[-3::] and R2 == 'NO2') or ('OO1' == R2[-3::] and R1 == 'NO2')) or \
            (('OO2' == R1[-3::] and R2 == 'NO2') or ('OO2' == R2[-3::] and R1 == 'NO2')) or \
            (('OO3' == R1[-3::] and R2 == 'NO2') or ('OO3' == R2[-3::] and R1 == 'NO2')) or \
            (('OO4' == R1[-3::] and R2 == 'NO2') or ('OO4' == R2[-3::] and R1 == 'NO2')) or \
            (('CO3' == R1[-3::] and R2 == 'NO2') or ('CO3' == R2[-3::] and R1 == 'NO2'))) and (R1 != 'HO2' and R2 != 'HO2'):
                RO2_NO2_rxt.append(rxt)
                
            # RO + NO2
            if (('O' == R1[-1::] and R2 == 'NO2') or ('O' == R2[-1::] and R1 == 'NO2')) and (R1 != 'O' and R2 != 'O'):
                RO_NO2_rxt.append(rxt)
                
        except:
            pass
        
    # sum the data
    RO2_NO_data  = df[RO2_NO_rxt].sum(axis = 1)
    RPAN_OH_data = df[RPAN_OH_rxt].sum(axis = 1)
    RO2_NO2_data = df[RO2_NO2_rxt].sum(axis = 1)
    RO_NO2_data  = df[RO_NO2_rxt].sum(axis = 1)
    
    # drop the data
    df = df.drop(RO2_NO_rxt, axis = 1, errors='ignore')
    df = df.drop(RPAN_OH_rxt, axis = 1, errors='ignore')
    df = df.drop(RO2_NO2_rxt, axis = 1, errors='ignore')
    df = df.drop(RO_NO2_rxt, axis = 1, errors='ignore')
    # add the data
    df['RO2 + NO']  = RO2_NO_data
    df['RPAN + NO'] = RPAN_OH_data
    # Not added as ANs and PNs are part of Ox
    df['RO2 + NO2'] = RO2_NO2_data
    df['RO + NO2']  = RO_NO2_data
    df = df.reindex(df.mean().sort_values(ascending = True).index, axis=1)
    return df

# ==========================================
# Funciton for getting ROx self removals
# ==========================================
def get_ROx_self_removals(df_loss_raw):
    """
    Filters out specific types of reactions from the DataFrame.

    :param df_loss_raw: DataFrame with reaction names as columns.
    :return: DataFrame filtered to exclude specific reactions.
    """
    ROx_removals = []
    for col_name in df_loss_raw.columns:
        col_name_dummy = col_name.replace(' {+M}', '')
        if ' + ' in col_name: 
            compounds = col_name_dummy.split(' + ')
        else:
            compounds = [col_name_dummy]
        # Filter out reactions having NO and NO2
        if 'NO2' in compounds or 'NO' in compounds:
            continue
        # Filter out OH + VOCs (excluding reactions where OH reacts only with HO2 or itself)
        if 'OH' in compounds and not (len(set(compounds)) == 1 or 'HO2' in compounds):
            continue
        # Filter out NO3
        if 'NO3' in compounds:
            continue
        # Filter out Cl and ClO + HO2
        if 'Cl' in compounds or 'ClO' in compounds:
            continue
            
        # Filter out CH3SOO2 and CH3SO2O2
        if 'CH3SOO2' in compounds or 'CH3SO2O2' in compounds:
            continue
        
        # Combine the data
        ROx_removals.append(col_name)
    return df_loss_raw[ROx_removals]
# =========================================
def NOx_loss_processor(df_loss_raw):
    PAN_form_rxt, otherPNs_form_rxt, ANs_form_rxt, RO2NO_form_rxt = [], [], [], []
    # Define the list
    excluded = ['O3', 'ClO', 'NO3', 'OH', 'HO2', 'MCO3', 'CH3CO3', 'O']  # Modify as needed
    RO2_suffixes = ['O2', 'OO', 'OO1', 'OO2', 'OO3', 'OO4', 'CO3']  # Modify as needed
    RO_suffixes = ['O', '1O']  # Modify as needed

    
    for col_name in df_loss_raw.columns:
        col_name_dummy = col_name.replace(' {+M}', '')
        if ' + ' in col_name: 
            R1, R2 = col_name_dummy.split(' + ')
        else:
            continue

        # Check for RO2 + NO2 = RO2NO2/PNs
        is_RO2_NO2_reaction = ((any(R1.endswith(suffix) for suffix in RO2_suffixes) and R2 == 'NO2') or 
                               (any(R2.endswith(suffix) for suffix in RO2_suffixes) and R1 == 'NO2'))
        is_excluded = any(R in excluded for R in [R1, R2])
        if is_RO2_NO2_reaction and not is_excluded:
            otherPNs_form_rxt.append(col_name)

        # Check for PAN formation reactions (CH3CO3 + NO2 or MCO3 + NO2)
        if 'NO2' in [R1, R2] and any(R in ['CH3CO3', 'MCO3'] for R in [R1, R2]):
            PAN_form_rxt.append(col_name)
        
        # Check for RO + NO2 = RONO2/ANs
        is_RO_NO2_reaction = ((any(R1.endswith(suffix) for suffix in RO_suffixes) and R2 == 'NO2') or 
                              (any(R2.endswith(suffix) for suffix in RO_suffixes) and R1 == 'NO2'))
        if is_RO_NO2_reaction and (not is_excluded) and (not is_RO2_NO2_reaction):
            ANs_form_rxt.append(col_name)

        # Check for RO2 + NO = RO2NO
        is_RO2_NO_reaction  = ((any(R1.endswith(suffix) for suffix in RO2_suffixes) and R2 == 'NO') or 
                              (any(R2.endswith(suffix) for suffix in RO2_suffixes) and R1 == 'NO'))
        if is_RO2_NO_reaction and (not is_excluded):
            RO2NO_form_rxt.append(col_name)
            
    
    # Sum the data
    PAN_form_data      = df_loss_raw[PAN_form_rxt].sum(axis = 1)
    otherPNs_form_data = df_loss_raw[otherPNs_form_rxt].sum(axis = 1)
    ANs_form_data      = df_loss_raw[ANs_form_rxt].sum(axis = 1)
    RO2NO_form_data    = df_loss_raw[RO2NO_form_rxt].sum(axis = 1)

    # Drop the data
    df_loss_raw = df_loss_raw.drop(PAN_form_rxt, axis = 1)
    df_loss_raw = df_loss_raw.drop(otherPNs_form_rxt, axis = 1)
    df_loss_raw = df_loss_raw.drop(ANs_form_rxt, axis = 1)
    df_loss_raw = df_loss_raw.drop(RO2NO_form_rxt, axis = 1)

    # Add the data
    df_loss_raw['CH3CO3 + NO2']    = PAN_form_data
    df_loss_raw['otherRO2 + NO2'] = otherPNs_form_data
    df_loss_raw['RO + NO2']       = ANs_form_data
    df_loss_raw['RO2 + NO']       = RO2NO_form_data
    df_loss_raw = df_loss_raw.reindex(df_loss_raw.mean().sort_values(ascending = False).index, axis=1)
    
    return df_loss_raw