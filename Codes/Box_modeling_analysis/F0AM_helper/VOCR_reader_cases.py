# ==============
# Import modules
# ==============
import warnings
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scipy.io
import os
import seaborn as sns
from matplotlib.colors import ListedColormap

# Changing the CWD
os.chdir('/glade/work/lixujin/PYTHON/SciProj/Box_modeling_analysis/F0AM_helper')
from F0AM_reader_MASTER import *
from Flight_transect_csv_reader import *
warnings.filterwarnings('ignore')

def VOCR_reader_cases(Flight_ID, get_smk_conc, get_smk_dil):
    # Read koh
    file_prefix  = '/glade/work/lixujin/PYTHON/SciProj/Box_modeling_analysis/VOC_OH_exposure/OHR/Koh_obs.csv'
    df_koh = pd.read_csv(file_prefix, index_col=0, sep='\t')
    ##################
    ## WECAN flights
    ##################
    if 'RF' in Flight_ID:
        # Read VOC conc
        file_prefix  = f'/glade/work/lixujin/PYTHON/SciProj/Box_modeling_analysis/F0AM_analysis_TS/WE-CAN/Model_inputs_prepared/output_data/{Flight_ID}_smk_conc.csv'
        df_conc = pd.read_csv(file_prefix, index_col=0)
        file_prefix  = f'/glade/work/lixujin/PYTHON/SciProj/Box_modeling_analysis/F0AM_analysis_TS/WE-CAN/Model_inputs_prepared/output_data/{Flight_ID}_bkg_conc.csv'
        df_bkg = pd.read_csv(file_prefix, index_col=0)

        # clean aerosols and others
        df_conc = df_conc.drop(['smk_Methane_PICARRO',
                                 'smk_OA_AMS', 'smk_HCN_UWCIMS', 'smk_HCN_TOGA', 'smk_HCN_PTR', 
                                 'smk_NO', 'smk_PAN', 'smk_PPN', 'smk_SO2_UWCIMS',
                                 'smk_HONO_UWCIMS', 'smk_HONO_HNO2_PTR', 'smk_O3', 
                                 'smk_HCl_UWCIMS', 'smk_HNO3_UWCIMS', 'smk_H_C_AMS', 'smk_NO3_AMS', 'smk_O_C_AMS', 'smk_OM_OC_AMS',
                                 'smk_CO2_PICARRO_ppb', 'smk_NO2'], axis=1)

        df_bkg = df_bkg.drop(['bkg_Methane_PICARRO',
                              'bkg_OA_AMS', 'bkg_HCN_UWCIMS', 'bkg_HCN_TOGA', 'bkg_HCN_PTR', 
                              'bkg_NO', 'bkg_PAN', 'bkg_PPN', 'bkg_SO2_UWCIMS',
                              'bkg_HONO_UWCIMS', 'bkg_HONO_HNO2_PTR', 'bkg_O3', 
                              'bkg_HCl_UWCIMS', 'bkg_HNO3_UWCIMS', 'bkg_H_C_AMS', 'bkg_NO3_AMS', 'bkg_O_C_AMS', 'bkg_OM_OC_AMS',
                              'bkg_CO2_PICARRO_ppb', 'bkg_NO2'], axis=1)


        # clean AWAS measurement as it is all 0
        columns_AWAS_conc = []
        columns_AWAS_bkg = []
        for col in df_conc.columns:
            if 'AWAS' in col:
                columns_AWAS_conc.append(col)
        df_conc = df_conc.drop(columns_AWAS_conc, axis=1)

        for col in df_bkg.columns:
            if 'AWAS' in col:
                columns_AWAS_bkg.append(col)
        df_bkg = df_bkg.drop(columns_AWAS_bkg, axis=1)

        # clean TOGA measurement due to the meaningless sampling method in the short interval
        columns_TOGA_conc = []
        columns_TOGA_bkg = []
        for col in df_conc.columns:
            if 'TOGA' in col:
                columns_TOGA_conc.append(col)
        df_conc = df_conc.drop(columns_TOGA_conc, axis=1)
        for col in df_bkg.columns:
            if 'TOGA' in col:
                columns_TOGA_bkg.append(col)
        df_bkg = df_bkg.drop(columns_TOGA_bkg, axis=1)

        # fix C2H4 in PTR
        df_conc['smk_ethene_C2H4_PTR'] = df_conc['smk_CO_QCL']*15.83*0.001 

        # get VOCR
        time = df_conc.index
        VOCR_conc = []
        VOCR_bkg = []
        names = []
        for col in df_conc.columns:
            col_rem = col.replace('smk_', '')
            if col_rem in df_koh.index:
                VOCR_conc.append((df_koh.loc[col_rem].values * df_conc[col]).values*2.46e10)
                names.append(col_rem)

        for col in df_bkg.columns:
            col_rem = col.replace('bkg_', '')
            if col_rem in df_koh.index:
                VOCR_bkg.append((df_koh.loc[col_rem].values * df_bkg[col]).values*2.46e10)
        VOCR_conc_sum = sum(VOCR_conc)
        VOCR_bkg_sum  = sum(VOCR_bkg)
        # Make VOCR_conc_sum as panda series...
        VOCR_conc_sum = pd.Series(VOCR_conc_sum, index=time)

        # create the dataframe for VOCR
        df_VOCR = pd.DataFrame(VOCR_conc, index=names, columns=time).T
        df_VOCR = df_VOCR.reindex(df_VOCR.mean().sort_values(ascending=False).index, axis=1)

        # calcualte dilution normalized mixing ratio for observations
        delta_CO = df_conc['smk_CO_QCL'] - df_bkg['bkg_CO_QCL'].values[0]
        fCO = delta_CO.iloc[0] / delta_CO
        b = VOCR_bkg_sum[0]
        delta_X = VOCR_conc_sum - b
        VOCR_smk_dil = delta_X*fCO


    ##################
    ## FIREX-AQ
    ##################
    # FIREX-AQ fires: this might be slighly more complex than reading csv files
    if 'FN' in Flight_ID:
        file =  f'/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/output_data/FIREXAQ_dilution_correctedMCMv331_base{Flight_ID}.mat'

        df_obs_bkg = get_df_specs(file_name=file, spec_list = ['CO'], 
                            GC_setting=False, MCM_setting=True, get_conc=False) 

        # reading in chem input data
        if Flight_ID == 'FN19': F0AM_model_file_chem =  '/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/FN19_Blackwater_20190830/ChemInput_avg_FN19Blackwater_20200513.mat' 
        if Flight_ID == 'FN06': F0AM_model_file_chem =  '/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/FN6_WilliamsFlat_20190803/ChemInput_avg_FN06WF_20200515.mat' 
        mod_struc_chem = scipy.io.loadmat(F0AM_model_file_chem)
        data_dummy = []
        names = []
        for key in list(mod_struc_chem.keys()):
            if len(mod_struc_chem[key])==4 or len(mod_struc_chem[key])==14: 
                data_dummy.append(mod_struc_chem[key])
                names.append(key)

        # mapping names in to the standard form   
        names_FIREXAQ2std = {'AceticAcid': 'Acetic acid',
                             'Acrylicacid': 'Acrylic acid',
                             'BenzeneDiol': 'Benzene Diol',
                             'FormicAcid': 'Formic acid', 
                             'MaleicAnhydride': 'Maleic Anhydride',
                             'acetylene': 'Acetylene',
                             'butenes': 'Butenes',
                             'ethene': 'C2H4',
                             'hydroxyacetone': 'Hydroxyacetone',
                             'methylacetate': 'Methylacetate',
                             'MethylFuran': 'Methylfuran',
                             'MethylFurfural': 'Methylfurfural'}
        names = [names_FIREXAQ2std.get(key, key) for key in names]

        df_obs_smk = pd.DataFrame(np.hstack(data_dummy), columns = names)

        # set up index for the dataframe
        time = df_obs_smk['TimeDownwind_s']
        df_obs_smk = df_obs_smk.drop('TimeDownwind_s', axis = 1)
        df_obs_smk.index = (time+580)/60 # convert second to min
        
        # adding values for lumping compounds
        df_obs_smk.loc[:, 'NOx'] = df_obs_smk.loc[:, 'NO'] +  df_obs_smk.loc[:, 'NO2']    
        df_obs_smk.loc[:, 'Lumped C>=3 alkenes'] = df_obs_smk.loc[:, 'Propene'] +  df_obs_smk.loc[:, 'Butenes'] +  df_obs_smk.loc[:, 'Pentene_methylbutene']

        # Create dataframe based on what Permar had
        file_prefix  = '/glade/work/lixujin/PYTHON/SciProj/Box_modeling_analysis/VOC_OH_exposure/OHR/ER_Permar.csv'
        df_ER_permar = pd.read_csv(file_prefix, index_col=0, sep='\t').T
        names = df_ER_permar.columns
        df_dummy = pd.DataFrame(columns=names) # Note that there is no row data inserted.
        for col in names:
            df_dummy[col] = df_obs_smk['CO']*df_ER_permar[col].values/1000.0

        # delete old and update new data
        df_dummy['ACETALDEHYDE_C2H4O_PTR'] = df_obs_smk['Acetaldehyde']
        df_dummy['acetic_acid_C2H4O2_PTR'] = df_obs_smk['Acetic acid']
        df_dummy['ACETONE_C3H6O_PTR'] = df_obs_smk['Acetone']
        df_dummy['ACETONITRILE_C2H3N_PTR'] = df_obs_smk['Acetonitrile']
        df_dummy['acrolein_C3H4O_PTR'] = df_obs_smk['Acrolein']
        df_dummy['benzaldehyde_C7H6O_PTR'] = df_obs_smk['Benzaldehyde']
        df_dummy['2_3_butanedione_C4H6O2_PTR'] = df_obs_smk['Butanedione']
        df_dummy['o_cresol_C7H8O_PTR'] = df_obs_smk['Cresol']
        df_dummy['2_5_dimethyl_furan_C6H8O'] = df_obs_smk['Dimethylfuran']
        df_dummy['ETHANOL_C2H6O_PTR'] = df_obs_smk['Ethanol']
        df_dummy['o_cresol_C7H8O_PTR'] = df_obs_smk['Cresol']
        df_dummy['formaldehyde_CH2O_PTR'] = df_obs_smk['Formaldehyde']
        df_dummy['formic_acid_CH2O2_PTR'] = df_obs_smk['Formic acid']
        df_dummy['FURAN_C4H4O_PTR'] = df_obs_smk['Furan']
        df_dummy['2_3H_furanone_C4H4O2_PTR'] = df_obs_smk['Furanone']
        df_dummy['2_FURALDEHYDE_C5H4O2_PTR'] = df_obs_smk['Furfural']
        df_dummy['glyoxal_C2H2O2_PTR'] = df_obs_smk['Glyoxal']
        df_dummy['guaiacol_C7H8O2_PTR'] = df_obs_smk['Guaiacol']
        df_dummy['ISOPRENE_C5H8_PTR'] = df_obs_smk['Isoprene']
        df_dummy['MACR_MVK_C4H6O_PTR'] = df_obs_smk['MVK'] + df_obs_smk['MACR']
        df_dummy['MEK_C4H8O_PTR'] = df_obs_smk['MEK']
        df_dummy['maleic_anhydride_C4H2O3_PTR'] = df_obs_smk['Maleic Anhydride']
        df_dummy['METHANOL_CH3OH_PTR'] = df_obs_smk['Methanol']
        df_dummy['2_METHYLFURAN_C5H6O_PTR'] = df_obs_smk['Methylfuran']
        df_dummy['5_METHYLFURFURAL_C6H6O2_PTR'] = df_obs_smk['Methylfurfural']
        df_dummy['methyl_glyoxal_C3H4O2_PTR'] = df_obs_smk['Methylglyoxal']
        df_dummy['MONOTERPENES_C10H16_PTR'] = df_obs_smk['Monoterpenes']
        df_dummy['pentene_C5H10_PTR'] = df_obs_smk['Pentene_methylbutene']
        df_dummy['phenol_C6H6O_PTR'] = df_obs_smk['Phenol']
        df_dummy['propene_C3H6_PTR'] = df_obs_smk['Propene']
        df_dummy['styrene_C8H8_PTR'] = df_obs_smk['Styrene']
        df_dummy['TOLUENE_C7H8_PTR'] = df_obs_smk['Toluene']
        df_dummy['1_BUTENE_PTR'] = df_obs_smk['Butenes']
        df_dummy['ethene_C2H4_PTR'] = df_obs_smk['C2H4']
        df_dummy['hydroxyacetone_C3H6O2_PTR'] = df_obs_smk['Hydroxyacetone']

        # calcluate VOCR
        # get VOCR
        time = df_dummy.index
        VOCR_conc = []
        names = []
        for col in df_dummy.columns:
            VOCR_conc.append((df_koh.loc[col].values * df_dummy[col]).values*2.46e10)
            names.append(col)

        # create the dataframe for VOCR
        df_VOCR = pd.DataFrame(VOCR_conc, index=names, columns=time).T
        df_VOCR = df_VOCR.reindex(df_VOCR.mean().sort_values(ascending=False).index, axis=1)
        df_VOCR.replace(np.nan,0)

        # sum the dataframe
        VOCR_conc_sum = df_VOCR.sum(axis = 1)

        # ============================================================
        # calcualte dilution normalized mixing ratio for observations
        # ============================================================
        delta_CO = df_obs_smk['CO'] - df_obs_bkg['CO'].values[0]
        fCO = delta_CO.iloc[0] / delta_CO
        b = 0
        delta_X = VOCR_conc_sum - b
        VOCR_smk_dil = delta_X*fCO

    ##################
    ## DISCOVER-AQ
    ##################
    if Flight_ID == 'P-3B':
        F0AM_model_file = '/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/P-3B/LagrangianPlumeData_Extrapolated.mat'
        mod_struc = scipy.io.loadmat(F0AM_model_file)
        # ==============
        # Variable names
        # ==============
        var_names = []
        # varaible in the data
        dtype_names = [('P', 'O'), ('T', 'O'), ('TIME', 'O'), ('RH', 'O'), ('SZA', 'O'), ('CH4', 'O'), ('NO', 'O'), ('NO2', 'O'), ('O3', 'O'), ('CO2', 'O'), ('CO', 'O'), ('HCHO', 'O'), ('HONO', 'O'), ('CH3CHO', 'O'), ('C3H6', 'O'), ('BENZENE', 'O'), ('FURAN', 'O'), ('C5H8', 'O'), ('CH3COCH3', 'O'), ('HCOOH', 'O'), ('CH3CO2H', 'O'), ('BIACET', 'O'), ('MVK', 'O'), ('MGLYOX', 'O'), ('FURFURAL', 'O'), ('ACETOL', 'O'), ('JNO2', 'O'), ('CH3OH', 'O'), ('DIL1', 'O'), ('jcorr', 'O'), ('Sol', 'O'), ('MEFURAN', 'O'), ('MALANHY', 'O'), ('C4H4O3', 'O'), ('FURANONE', 'O'), ('PHENOL', 'O'), ('CATECHOL', 'O'), ('STYRENE', 'O'), ('CRESOL', 'O'), ('TIME_EXT', 'O'), ('CO_EXT', 'O'), ('H2O', 'O')]
        for dname, tmp in dtype_names:
            var_names.append(dname)
        # remove the inconsistent data
        var_names.remove(var_names[30])

        # ==============
        # Variable data
        # ==============
        # retrieve the irregular information first
        loc_date = mod_struc['DAQ'].item()[30]
        lat, lon, alt = loc_date.item()[0][0][0], loc_date.item()[1][0][0], loc_date.item()[2][0][0]
        startTime, updateTime =  loc_date.item()[3][0][0], loc_date.item()[4][0][0]
        # other data
        var_data = []
        ct = 0
        for ele in mod_struc['DAQ'].item():
            if ct != 30: 
                ele = [item for sublist in ele for item in sublist]
                var_data.append(ele)
            # increment the pointer
            ct += 1 
        # ================================================
        # Prepare met data
        # Only for model input but not for data analysis 
        # ================================================
        # Met data: get ind where len of element is 65
        ind_65dp = [len(num_dp) == 65 for num_dp in var_data]
        met_data  = np.array(var_data)[ind_65dp] 
        met_names = np.array(var_names)[ind_65dp] 
        df_met = pd.DataFrame(list(met_data), index = met_names).transpose()
        met_time = df_met['TIME_EXT']
        df_met.index = met_time/60 # sec to min
        df_met = df_met.drop('TIME_EXT', axis = 1)

        # smk data: get ind where len of element is 15
        ind_15dp = [len(num_dp) == 15 for num_dp in var_data]
        smk_data  = np.array(var_data)[ind_15dp] 
        smk_names = np.array(var_names)[ind_15dp] 
        df_obs_smk = pd.DataFrame(list(smk_data), index = smk_names).transpose()
        smk_time = df_obs_smk['TIME']
        df_obs_smk.index = smk_time/60 # sec to min

        # rename the column names
        df_obs_smk = df_obs_smk.rename(columns={"HCHO":"Formaldehyde", "CH3CHO": "Acetaldehyde", "BENZENE":"Benzene", 
                                                "FURAN":"Furan", "C5H8": "Isoprene", 
                                                "HCOOH": "Formic acid", "CH3CO2H": "Acetic acid", "BIACET": "2,3-butanedione",
                                                "MGLYOX": "Methylglyoxal", "FURFURAL": "Furfural", "ACETOL": "Hydroxyacetone", 
                                                "CH3OH": "Methanol", "MEFURAN": "Methylfuran", "MALANHY": "Maleic Anhydride", 
                                                "C4H4O3": "5-hydroxy-2(5H)-furanone", "FURANONE": "Furanone", "PHENOL": "Phenol", 
                                                "CATECHOL": "Catechol", "STYRENE": "Styrene", "CRESOL": "Cresol"})

        # Using the ratio to scale up ethene, propanal, MACR, MVK, acetone, dimethylfuran, methylfurfural, Phenol, Catechol, Cresol
        df_obs_smk['Ethene']                = df_obs_smk['C3H6']
        df_obs_smk['propanal'] = df_obs_smk['CH3COCH3'] * 0.22
        df_obs_smk['Methacrolein']          = df_obs_smk['MVK'] * 0.5
        df_obs_smk['MVK']   = df_obs_smk['MVK'] * 0.5
        df_obs_smk['Acetone']               = df_obs_smk['CH3COCH3'] * 0.78
        #df_obs_smk['Dimethylfuran']         = df_obs_smk['Methylfuran'] * 0.5
        df_obs_smk['Methylfurfural']        = df_obs_smk['Catechol'] * 0.5
        df_obs_smk['Phenol']                = df_obs_smk['Phenol'] * 1.05
        df_obs_smk['Catechol']              = df_obs_smk['Catechol'] * 0.5
        df_obs_smk['Cresol']                = df_obs_smk['Cresol'] * 1.5
        df_obs_smk['NOx'] = df_obs_smk['NO'] + df_obs_smk['NO2']

        # drop some columns that are no needed.
        df_obs_smk = df_obs_smk.drop(['TIME', 'DIL1'], axis = 1)
        df_obs_smk = df_obs_smk.drop(['CH4', 'CO2', 'C3H6', 'Benzene', 'Methanol', 'Ethene', 'CH3COCH3',
                                      '5-hydroxy-2(5H)-furanone'], axis = 1)
        df_obs_smk = df_obs_smk.drop(['NO', 'NO2', 'O3', 'NOx', 'HONO'], axis=1)

        # Create dataframe based on what Permar had
        file_prefix  = '/glade/work/lixujin/PYTHON/SciProj/Box_modeling_analysis/VOC_OH_exposure/OHR/ER_Permar.csv'
        df_ER_permar = pd.read_csv(file_prefix, index_col=0, sep='\t').T
        names = df_ER_permar.columns
        df_dummy = pd.DataFrame(columns=names) # Note that there is no row data inserted.
        for col in names:
            df_dummy[col] = df_obs_smk['CO']*df_ER_permar[col].values/1000.0
        # delete old and update new data
        df_dummy['formaldehyde_CH2O_PTR'] = df_obs_smk['Formaldehyde']
        df_dummy['ACETALDEHYDE_C2H4O_PTR'] = df_obs_smk['Acetaldehyde']
        df_dummy['FURAN_C4H4O_PTR'] = df_obs_smk['Furan']
        df_dummy['ISOPRENE_C5H8_PTR'] = df_obs_smk['Isoprene']
        df_dummy['CH2O2_UWCIMS'] = df_obs_smk['Formic acid']
        df_dummy['acetic_acid_C2H4O2_PTR'] = df_obs_smk['Acetic acid']
        df_dummy['2_3_butanedione_C4H6O2_PTR'] = df_obs_smk['2,3-butanedione']
        df_dummy['MACR_MVK_C4H6O_PTR'] = df_obs_smk['MVK'] + df_obs_smk['Methacrolein']
        df_dummy['methyl_glyoxal_C3H4O2_PTR'] = df_obs_smk['Methylglyoxal']
        df_dummy['2_FURALDEHYDE_C5H4O2_PTR'] = df_obs_smk['Furfural']
        df_dummy['hydroxyacetone_C3H6O2_PTR'] = df_obs_smk['Hydroxyacetone']
        df_dummy['2_METHYLFURAN_C5H6O_PTR'] = df_obs_smk['Methylfuran']
        df_dummy['maleic_anhydride_C4H2O3_PTR'] = df_obs_smk['Maleic Anhydride']
        df_dummy['2_3H_furanone_C4H4O2_PTR'] = df_obs_smk['Furanone']
        df_dummy['phenol_C6H6O_PTR'] = df_obs_smk['Phenol']
        df_dummy['5_METHYLFURFURAL_C6H6O2_PTR'] = df_obs_smk['Catechol'] + df_obs_smk['Methylfurfural']
        df_dummy['styrene_C8H8_PTR'] = df_obs_smk['Styrene']
        df_dummy['o_cresol_C7H8O_PTR'] = df_obs_smk['Cresol']
        df_dummy['ACETONE_C3H6O_PTR'] = df_obs_smk['Acetone']

        # get background value
        file =  '/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/output_data/FIREXAQ_dilution_correctedMCMv331_noFURFN19.mat' 
        spec_total = df_obs_smk.columns
        df_obs_bkg = get_df_specs(file_name=file, spec_list = spec_total, 
                            GC_setting=False, MCM_setting=True, get_conc=False) 
        df_dummy_bkg = pd.DataFrame(columns=names) # Note that there is no row data inserted.
        # delete old and update new data
        df_dummy_bkg['formaldehyde_CH2O_PTR'] = df_obs_bkg['Formaldehyde'].iloc[0:1]
        df_dummy_bkg['ACETALDEHYDE_C2H4O_PTR'] = df_obs_bkg['Acetaldehyde'].iloc[0:1]
        df_dummy_bkg['FURAN_C4H4O_PTR'] = df_obs_bkg['Furan'].iloc[0:1]
        df_dummy_bkg['ISOPRENE_C5H8_PTR'] = df_obs_bkg['Isoprene'].iloc[0:1]
        df_dummy_bkg['CH2O2_UWCIMS'] = df_obs_bkg['Formic acid'].iloc[0:1]
        df_dummy_bkg['acetic_acid_C2H4O2_PTR'] = df_obs_bkg['Acetic acid'].iloc[0:1]
        df_dummy_bkg['2_3_butanedione_C4H6O2_PTR'] = df_obs_bkg['2,3-butanedione'].iloc[0:1]
        df_dummy_bkg['MACR_MVK_C4H6O_PTR'] = df_obs_bkg['MVK'][0:1]+ df_obs_bkg['Methacrolein'].iloc[0:1]
        df_dummy_bkg['methyl_glyoxal_C3H4O2_PTR'] = df_obs_bkg['Methylglyoxal'].iloc[0:1]
        df_dummy_bkg['2_FURALDEHYDE_C5H4O2_PTR'] = df_obs_bkg['Furfural'].iloc[0:1]
        df_dummy_bkg['hydroxyacetone_C3H6O2_PTR'] = df_obs_bkg['Hydroxyacetone'].iloc[0:1]
        df_dummy_bkg['2_METHYLFURAN_C5H6O_PTR'] = df_obs_bkg['Methylfuran'].iloc[0:1]
        df_dummy_bkg['maleic_anhydride_C4H2O3_PTR'] = df_obs_bkg['Maleic Anhydride'].iloc[0:1]
        df_dummy_bkg['2_3H_furanone_C4H4O2_PTR'] = df_obs_bkg['Furanone'].iloc[0:1]
        df_dummy_bkg['phenol_C6H6O_PTR'] = df_obs_bkg['Phenol'].iloc[0:1]
        df_dummy_bkg['5_METHYLFURFURAL_C6H6O2_PTR'] = df_obs_bkg['Catechol'].iloc[0:1]
        df_dummy_bkg['styrene_C8H8_PTR'] = df_obs_bkg['Styrene'].iloc[0:1]
        df_dummy_bkg['o_cresol_C7H8O_PTR'] = df_obs_bkg['Cresol'].iloc[0:1]
        df_dummy_bkg['ACETONE_C3H6O_PTR'] = df_obs_bkg['Acetone'].iloc[0:1]

        # calcluate VOCR
        # get VOCR
        time = df_dummy.index
        VOCR_conc = []
        VOCR_bkg  = []
        names = []
        for col in df_dummy.columns:
            VOCR_conc.append((df_koh.loc[col].values * df_dummy[col]).values*2.46e10)
            VOCR_bkg.append((df_koh.loc[col].values * df_dummy_bkg[col]).values*2.46e10)
            names.append(col)

        # create the dataframe for VOCR
        df_VOCR = pd.DataFrame(VOCR_conc, index=names, columns=time).T
        df_VOCR = df_VOCR.reindex(df_VOCR.mean().sort_values(ascending=False).index, axis=1)
        df_VOCR.replace(np.nan,0)


        df_VOCR_bkg = pd.DataFrame(VOCR_bkg, index=names).T
        df_VOCR_bkg = df_VOCR_bkg.reindex(df_VOCR_bkg.mean().sort_values(ascending=False).index, axis=1)
        df_VOCR_bkg.replace(np.nan,0)


        # sum the dataframe
        VOCR_conc_sum = df_VOCR.sum(axis = 1)
        VOCR_bkg_sum = df_VOCR_bkg.sum(axis = 1)
        # ============================================================
        # calcualte dilution normalized mixing ratio for observations
        # ============================================================
        delta_CO = df_obs_smk['CO'] - df_obs_bkg['CO'].values[0]
        fCO = delta_CO.iloc[0] / delta_CO
        b = VOCR_bkg_sum[0]
        delta_X = VOCR_conc_sum - b
        VOCR_smk_dil = delta_X*fCO
    # compile data
    df_VOCR_smk_conc = pd.DataFrame(VOCR_conc_sum).rename(columns={0: 'Observation'})
    df_VOCR_smk_dil = pd.DataFrame(VOCR_smk_dil).rename(columns={0: 'Observation'})
    
    # standardrize the observation index
    df_VOCR_smk_conc.index = pd.Series(df_VOCR_smk_conc.index).round(2)
    df_VOCR_smk_dil.index = pd.Series(df_VOCR_smk_dil.index).round(2)

    if get_smk_conc: return df_VOCR_smk_conc
    if get_smk_dil:  return df_VOCR_smk_dil
