import requests

# ==============
# Import modules
# ==============
import warnings
import numpy as np
import pandas as pd
import scipy.io
import os
from ConstantVal import *

# ===========================================================================================
# Function to read observation data for listed species 
# This function is only for dataset we have csv dataset for observations (i.e., WE-CAN data)
# get_bkg is getting retired as we want to use bkg from F0AM output
# There are things we can make the code more decent
# ===========================================================================================
def get_obs_df(Flight_ID, spec_list, get_smk, get_bkg):
    # ----------------------------------
    # 1) decide which data we will read
    # ----------------------------------
    if get_smk: setting = 'smk'
    if get_bkg:  setting = 'bkg'
    # ------------------------
    # 2) read observation data
    # ------------------------
    if 'RF' in Flight_ID:
        # may need archive it a data directory in the future
        df_obs = pd.read_csv('/glade/work/lixujin/PYTHON/SciProj/Box_modeling_analysis/F0AM_analysis_TS/WE-CAN/Model_inputs_prepared/output_data/' + Flight_ID + '_' + setting + '_conc.csv')
    
    df_obs = df_obs.set_index('Age_physical_avg_min')

    # --------------------------------------
    # 3) Apply ratio for some species
    # This is only applicable to smk and bkg
    # --------------------------------------
    # Pay attention on the first character: Acetone, Acetic acid, mek, Methylfurfural, Hydroxyacetone, and Heptanal are processed name 
    # Branching values are set up here
    # Aldehydes
    df_obs[setting + '_Propanal_C3H6O_PTR']                     = df_obs[setting + '_ACETONE_C3H6O_PTR']*0.17
    df_obs[setting + '_Butanal_C4H8O_PTR']                      = df_obs[setting + '_MEK_C4H8O_PTR']*0.01
    df_obs[setting + '_2_Methylpropanal_C4H8O_PTR']             = df_obs[setting + '_MEK_C4H8O_PTR']*0.14
    df_obs[setting + '_2_Methylbutanal_PTR']                    = df_obs[setting + '_3_methyl_2_butanone_C5H10O_PTR']*0.04
    # Aromatics
    df_obs[setting + '_Ethyl_benzene_C8H10_PTR']                = df_obs[setting + '_C8_AROMATICS_C8H10_PTR']*0.36
    df_obs[setting + '_mpXylenes_C8H10_PTR']                    = df_obs[setting + '_C8_AROMATICS_C8H10_PTR']*0.46
    df_obs[setting + '_oXylene_C8H10_PTR']                      = df_obs[setting + '_C8_AROMATICS_C8H10_PTR']*0.18
    # Acid
    df_obs[setting + '_Acetic_acid_C2H4O2_PTR']                 = df_obs[setting + '_acetic_acid_C2H4O2_PTR']*0.67
    # Biogenic VOCs
    df_obs[setting + '_apinene_C10H16_PTR']                     = df_obs[setting + '_MONOTERPENES_C10H16_PTR']*0.33
    df_obs[setting + '_bpinene_C10H16_PTR']                     = df_obs[setting + '_MONOTERPENES_C10H16_PTR']*0.21
    df_obs[setting + '_MVK_C4H6O_PTR']                          = df_obs[setting + '_MACR_MVK_C4H6O_PTR']*0.60
    df_obs[setting + '_MACR_C4H6O_PTR']                         = df_obs[setting + '_MACR_MVK_C4H6O_PTR']*0.28
    # Ketones
    df_obs[setting + '_Acetone_C3H6O_PTR']                      = df_obs[setting + '_ACETONE_C3H6O_PTR']*0.83
    df_obs[setting + '_mek_C4H8O_PTR']                          = df_obs[setting + '_MEK_C4H8O_PTR']*0.85
    # Furans
    df_obs[setting + '_2_Methylfuran_C5H6O_PTR']                = df_obs[setting + '_2_METHYLFURAN_C5H6O_PTR']*0.84
    df_obs[setting + '_3_Methylfuran_C5H6O_PTR']                = df_obs[setting + '_2_METHYLFURAN_C5H6O_PTR']*0.16
    df_obs[setting + '_5_Methylfurfural_C6H6O2_PTR']            = df_obs[setting + '_5_METHYLFURFURAL_C6H6O2_PTR']*0.5
    # Others
    df_obs[setting + '_glycolaldehyde_C2H4O2_PTR']              = df_obs[setting + '_acetic_acid_C2H4O2_PTR']*0.33
    df_obs[setting + '_Hydroxyacetone_C3H6O2_PTR']              = df_obs[setting + '_hydroxyacetone_C3H6O2_PTR']*0.51
    df_obs[setting + '_Methyl_acetate_C3H6O2_PTR']              = df_obs[setting + '_hydroxyacetone_C3H6O2_PTR']*0.35
    df_obs[setting + '_Ethyl_formate_C3H6O2_PTR']               = df_obs[setting + '_hydroxyacetone_C3H6O2_PTR']*0.14
    df_obs[setting + '_2_Butenal_C4H6O_PTR']                    = df_obs[setting + '_MACR_MVK_C4H6O_PTR']*0.13
    df_obs[setting + '_iBuONO2_TOGA']                           = df_obs[setting + '_iBuONO2and2BuONO2_TOGA']*0.5
    df_obs[setting + '_nBuONO2_TOGA']                           = df_obs[setting + '_iBuONO2and2BuONO2_TOGA']*0.5
    df_obs[setting + '_MBO_C5H10O_PTR']                         = df_obs[setting + '_3_methyl_2_butanone_C5H10O_PTR']*0.43
    df_obs[setting + '_2_Pentanone_C5H10O_PTR']                 = df_obs[setting + '_3_methyl_2_butanone_C5H10O_PTR']*0.23
    df_obs[setting + '_3_Pentanone_C5H10O_PTR']                 = df_obs[setting + '_3_methyl_2_butanone_C5H10O_PTR']*0.21
    df_obs[setting + '_Catechol_C6H6O2_PTR']                    = df_obs[setting + '_5_METHYLFURFURAL_C6H6O2_PTR']*0.5
    df_obs[setting + '_Hexanones_C6H12O_PTR']                   = df_obs[setting + '_3_HEXANONE_C6H12O_PTR']*0.53
    df_obs[setting + '_Hexanal_C6H12O_PTR']                     = df_obs[setting + '_3_HEXANONE_C6H12O_PTR']*0.47
    df_obs[setting + '_Heptanal_C7H14O_PTR']                    = df_obs[setting + '_heptanal_C7H14O_PTR']*0.63
    df_obs[setting + '_heptanone_C7H14O_PTR']                   = df_obs[setting + '_heptanal_C7H14O_PTR']*0.37
    # mapping to retrieve observation data (customized)
    spec_obs = []
    # adding species if they are not the list
    for spec in spec_list:
        # CxHy
        if spec == 'Ethyne':                       spec_obs.append(setting + '_C2H2')
        if spec == 'Ethene':                       spec_obs.append(setting + '_C2H4')
        if spec == 'Ethane':                       spec_obs.append(setting + '_C2H6')
        if spec == 'Propane':                      spec_obs.append(setting + '_C3H8')
        if spec == 'Lumped C>=4 alkanes':          spec_obs.append(setting + '_ALK4')
        if spec == 'Lumped C>=3 alkenes':          spec_obs.append(setting + '_PRPE')
        
        # Aldehydes
        if spec == 'Formaldehyde':                 spec_obs.append(setting + '_formaldehyde_CH2O_PTR')
        if spec == 'Acetaldehyde':                 spec_obs.append(setting + '_ACETALDEHYDE_C2H4O_PTR')
        if spec == 'Lumped C>=3 aldehydes':        spec_obs.append(setting + '_RCHO')                          # (lumped noted)
        if spec == 'Glyoxal':                      spec_obs.append(setting + '_glyoxal_C2H2O2_PTR')
        if spec == 'Methylglyoxal':                spec_obs.append(setting + '_methyl_glyoxal_C3H4O2_PTR')
        if spec == 'Glycoaldehyde':                spec_obs.append(setting + '_glycolaldehyde_C2H4O2_PTR')
       
        # Alcohols
        if spec == 'Methanol':                     spec_obs.append(setting + '_METHANOL_CH3OH_PTR')
        if spec == 'Ethanol':                      spec_obs.append(setting + '_ETHANOL_C2H6O_PTR')
        # Organic acids
        if spec == 'Formic acid':                  spec_obs.append(setting + '_CH2O2_UWCIMS')
        if spec == 'Acetic acid':                  spec_obs.append(setting + '_Acetic_acid_C2H4O2_PTR')        # isomer noted
        # Ketones
        if spec == 'Acetone':                      spec_obs.append(setting + '_Acetone_C3H6O_PTR')             # isomer noted
        if spec == 'MEK':                          spec_obs.append(setting + '_mek_C4H8O_PTR')                 # isomer noted
        if spec == 'Hydroxyacetone':               spec_obs.append(setting + '_Hydroxyacetone_C3H6O2_PTR')  
        # Biogenic related compounds
        if spec == 'Isoprene':                     spec_obs.append(setting + '_ISOPRENE_C5H8_PTR') 
        if spec == 'Monoterpenes':                 spec_obs.append(setting + '_MTPA')                          # (lumped noted)
        if spec == 'Methacrolein':                 spec_obs.append(setting + '_MACR_C4H6O_PTR')                # isomer noted
        if spec == 'MVK':                          spec_obs.append(setting + '_MVK_C4H6O_PTR')                 # isomer noted
        
        # Aromatics
        if spec == 'Benzene':                      spec_obs.append(setting + '_BENZENE_C6H6_PTR')
        if spec == 'Toluene':                      spec_obs.append(setting + '_TOLUENE_C7H8_PTR')        
        if spec == 'Xylenes':                      spec_obs.append(setting + '_XYLE')
        if spec == 'Benzaldehyde':                 spec_obs.append(setting + '_benzaldehyde_C7H6O_PTR')
        #if spec == 'Phenol':                       spec_obs.append(setting + '_phenol_C6H6O_PTR')
        if spec == 'Phenol':                       spec_obs.append(setting + '_C6H6O_UWCIMS')
        if spec == 'Cresol':                       spec_obs.append(setting + '_o_cresol_C7H8O_PTR')
        
        # Furans
        if spec == 'Furan':                        spec_obs.append(setting + '_FURAN_C4H4O_PTR')
        if spec == '2-Methylfuran':                spec_obs.append(setting + '_2_Methylfuran_C5H6O_PTR')
        if spec == '3-Methylfuran':                spec_obs.append(setting + '_3_Methylfuran_C5H6O_PTR')
        if spec == 'Dimethylfuran':                spec_obs.append(setting + '_2_5_dimethyl_furan_C6H8O')
        if spec == 'Furfural':                     spec_obs.append(setting + '_2_FURALDEHYDE_C5H4O2_PTR')
        if spec == 'Methylfurfural':               spec_obs.append(setting + '_5_Methylfurfural_C6H6O2_PTR')
        if spec == 'Maleic anhydride':             spec_obs.append(setting + '_maleic_anhydride_C4H2O3_PTR')
        if spec == 'Furans':                       spec_obs.append(setting + '_Furans')
        if spec == 'Methylfuran':                   spec_obs.append(setting + '_Methylfuran')
        if spec == 'Furfurals':                    spec_obs.append(setting + '_Furfurals')
        if spec == 'Furanone':                     spec_obs.append(setting + '_2_3H_furanone_C4H4O2_PTR')
    
        # Others
        if spec == 'DMS':                          spec_obs.append(setting + '_DMS_PTR')
        if spec == 'Acrolein':                     spec_obs.append(setting + '_acrolein_C3H4O_PTR')
        if spec == 'Butadiene':                    spec_obs.append(setting + '_butadiene_C4H6_PTR')
        if spec == 'Butenal':                      spec_obs.append(setting + '_2_Butenal_C4H6O_PTR')
        if spec == 'Butanedione':                  spec_obs.append(setting + '_2_3_butanedione_C4H6O2_PTR')
        if spec == 'Pentan2one':                   spec_obs.append(setting + '_2_Pentanone_C5H10O_PTR')
        if spec == 'Pentan3one':                   spec_obs.append(setting + '_3_Pentanone_C5H10O_PTR')
        if spec == 'Catechol':                     spec_obs.append(setting + '_Catechol_C6H6O2_PTR')
        if spec == 'Hexanones':                    spec_obs.append(setting + '_Hexanones_C6H12O_PTR')
        if spec == 'Guaiacol':                     spec_obs.append(setting + '_guaiacol_C7H8O2_PTR')
        if spec == 'Heptanone':                    spec_obs.append(setting + '_heptanone_C7H14O_PTR')
        if spec == 'Styrene':                      spec_obs.append(setting + '_styrene_C8H8_PTR')
        if spec == 'Tolualdehyde':                 spec_obs.append(setting + '_tolualdehyde_C8H8O_PTR')
        if spec == 'Creosol':                      spec_obs.append(setting + '_creosol_C8H10O2_PTR')
        if spec == 'Syringol':                     spec_obs.append(setting + '_syringol_C8H10O3_PTR')

        if spec == 'Trimethyl123benzene':          spec_obs.append(setting + '_Trimethyl123benzene')
        if spec == 'Isopropylbenzene':             spec_obs.append(setting + '_Isopropylbenzene')
        if spec == 'Propylbenzene':                spec_obs.append(setting + '_Propylbenzene')
        if spec == 'Methyltoluene':                spec_obs.append(setting + '_Methyltoluene')
        if spec == 'Pethyltoluene':                spec_obs.append(setting + '_Pethyltoluene')
        if spec == 'Trimethyl135benzene':          spec_obs.append(setting + '_Trimethyl135benzene')
        if spec == 'Oethyltoluene':                spec_obs.append(setting + '_Oethyltoluene')
        
        # Acids
        if spec == 'Pinic acid':                  spec_obs.append(setting + '_C9H14O4_UWCIMS')
        if spec == 'Pinonic acid':                spec_obs.append(setting + '_C10H16O3_UWCIMS')
        if spec == 'Sesquiterpenes':              spec_obs.append(setting + '_sesquiterpenes_C15H24_PTR')
        if spec == 'Acrylic acid':                spec_obs.append(setting + '_acrylic_acid')
        if spec == 'Oxylenol':                    spec_obs.append(setting + '_Oxylenol')
        if spec == 'Pbenzoquinone':               spec_obs.append(setting + '_Pbenzoquinone')
        
        # Unknown 
        # Non-OVOC species
        if spec == 'CO':                           spec_obs.append(setting + '_CO_QCL')
        if spec == 'O3':                           spec_obs.append(setting + '_O3')
        if spec == 'NO':                           spec_obs.append(setting + '_NO')
        if spec == 'NO2':                          spec_obs.append(setting + '_NO2')
        if spec == 'NOx':                          spec_obs.append(setting + '_NOx')

        if spec == 'NONO2Ratio':                   spec_obs.append(setting + '_NONO2Ratio')
        if spec == 'PAN':                          spec_obs.append(setting + '_PAN')
        if spec == 'PPN':                          spec_obs.append(setting + '_PPN')
        if spec == 'HONO':                         spec_obs.append(setting + '_HONO_UWCIMS')
        if spec == 'HNO3':                         spec_obs.append(setting + '_HNO3_UWCIMS')
        if spec == 'HNO4':                         spec_obs.append(setting + '_HNO4')
        if spec == 'H2O2':                         spec_obs.append(setting + '_H2O2')
        if spec == 'pNO3':                         spec_obs.append(setting + '_NO3_AMS')
        if spec == 'TNOy':                         spec_obs.append(setting + '_TNOy')
        if spec == 'TNOz':                         spec_obs.append(setting + '_TNOz')
        if spec == 'MPN':                          spec_obs.append(setting + '_MPN')
        if spec == 'TPNs':                         spec_obs.append(setting + '_TPNs')
        if spec == 'TANs':                         spec_obs.append(setting + '_TANs')

        if spec == 'TVOCR':                         spec_obs.append(setting + '_TVOCR') # This is not the right way to calculate observation WE-CAN, put it zero for now.

        # Radicals
        if spec == 'OH':                           spec_obs.append(setting + '_OH')
        if spec == 'HO2':                          spec_obs.append(setting + '_HO2')
        if spec == 'HOx':                          spec_obs.append(setting + '_HOx')
        if spec == 'CH3O2':                        spec_obs.append(setting + '_CH3O2')
        if spec == 'MO2':                          spec_obs.append(setting + '_MO2')
        if spec == 'MCO3':                         spec_obs.append(setting + '_MCO3')
        if spec == 'TRO2':                          spec_obs.append(setting + '_TRO2')
        if spec == 'MALDIALO':                     spec_obs.append(setting + '_MALDIALO')
        if spec == 'MALDIALO2':                    spec_obs.append(setting + '_MALDIALO2')
        if spec == 'MALDIALCO2':                   spec_obs.append(setting + '_MALDIALCO2')
        if spec == 'NO3':                          spec_obs.append(setting + '_NO3')


    # 5) lumped compounds (customized)
    df_obs[setting + '_NOx'] = (df_obs[setting + '_NO'] + df_obs[setting + '_NO2']).values
    df_obs[setting + '_TNOy'] = (df_obs[setting + '_NO'] + df_obs[setting + '_NO2'] + df_obs[setting + '_HNO3_UWCIMS'] + \
                                 df_obs[setting + '_HONO_UWCIMS'] + df_obs[setting + '_NO3_AMS'] + df_obs[setting + '_PAN'] + df_obs[setting + '_PPN']).values
    
    df_obs[setting + '_TNOz'] = (df_obs[setting + '_HNO3_UWCIMS'] + df_obs[setting + '_HONO_UWCIMS'] + df_obs[setting + '_NO3_AMS'] + df_obs[setting + '_PAN'] + df_obs[setting + '_PPN']).values 

    
    df_obs[setting + '_NONO2Ratio'] = (df_obs[setting + '_NO']/df_obs[setting + '_NO2']).values
    
    df_obs[setting + '_RCHO'] = (df_obs[setting + '_Propanal_C3H6O_PTR'] + df_obs[setting + '_Butanal_C4H8O_PTR'] + 
                                 df_obs[setting + '_2_Methylpropanal_C4H8O_PTR'] + df_obs[setting + '_2_Methylbutanal_PTR'] + 
                                 df_obs[setting + '_Hexanal_C6H12O_PTR'] + df_obs[setting + '_Heptanal_C7H14O_PTR']).values
    df_obs[setting + '_Furans'] = (df_obs[setting + '_FURAN_C4H4O_PTR'] + 
                                   df_obs[setting + '_2_Methylfuran_C5H6O_PTR'] + df_obs[setting + '_3_Methylfuran_C5H6O_PTR'] +
                                   df_obs[setting + '_2_5_dimethyl_furan_C6H8O']).values
    df_obs[setting + '_Furfurals'] = df_obs[setting + '_2_FURALDEHYDE_C5H4O2_PTR'] + df_obs[setting + '_5_Methylfurfural_C6H6O2_PTR']
    df_obs[setting + '_XYLE'] = df_obs[setting + '_mpXylenes_C8H10_PTR'] + df_obs[setting + '_oXylene_C8H10_PTR'] + df_obs[setting + '_Ethyl_benzene_C8H10_PTR']
    df_obs[setting + '_MTPA'] = (df_obs[setting + '_apinene_C10H16_PTR'] + df_obs[setting + '_bpinene_C10H16_PTR']).values
    df_obs[setting + '_TPNs'] = (df_obs[setting + '_PAN'] + df_obs[setting + '_PPN']).values
    df_obs[setting + '_TANs']  = [0]*len(df_obs)

    
    
    # 4) add radicals and lumped compounds (customized)
    # radicals    
    df_obs[setting + '_OH']  = [0]*len(df_obs)
    df_obs[setting + '_HO2'] = [0]*len(df_obs)
    df_obs[setting + '_HOx'] = [0]*len(df_obs)
    df_obs[setting + '_CH3O2'] = [0]*len(df_obs)
    df_obs[setting + '_MO2'] = [0]*len(df_obs)
    df_obs[setting + '_MCO3'] = [0]*len(df_obs)
    df_obs[setting + '_TRO2']   = [0]*len(df_obs)
    df_obs[setting + '_MALDIALO'] = [0]*len(df_obs)
    df_obs[setting + '_MALDIALO2'] = [0]*len(df_obs)
    df_obs[setting + '_MALDIALCO2'] = [0]*len(df_obs)
    df_obs[setting + '_NO3'] = [0]*len(df_obs)
    
    # AWAS measurements or NA
    df_obs[setting + '_C2H6'] = [0]*len(df_obs)
    df_obs[setting + '_C3H8'] = [0]*len(df_obs)
    df_obs[setting + '_ALK4'] = [0]*len(df_obs)
    df_obs[setting + '_C2H4'] = [0]*len(df_obs)
    df_obs[setting + '_C2H2'] = [0]*len(df_obs)
    df_obs[setting + '_PRPE'] = [0]*len(df_obs)
    
    df_obs[setting + '_Trimethyl123benzene'] = [0]*len(df_obs)
    df_obs[setting + '_Isopropylbenzene'] = [0]*len(df_obs)
    df_obs[setting + '_Propylbenzene'] = [0]*len(df_obs)
    df_obs[setting + '_Methyltoluene'] = [0]*len(df_obs)
    df_obs[setting + '_Pethyltoluene'] = [0]*len(df_obs)
    df_obs[setting + '_Trimethyl135benzene'] = [0]*len(df_obs)
    df_obs[setting + '_Oethyltoluene'] = [0]*len(df_obs)
    df_obs[setting + '_acrylic_acid'] = [0]*len(df_obs)
    df_obs[setting + '_Oxylenol'] = [0]*len(df_obs)
    df_obs[setting + '_Pbenzoquinone'] = [0]*len(df_obs)

    df_obs[setting + '_H2O2'] = [0]*len(df_obs)
    df_obs[setting + '_HNO4'] = [0]*len(df_obs)
    df_obs[setting + '_H2O2'] = [0]*len(df_obs)
    df_obs[setting + '_MPN']  = [0]*len(df_obs)
    df_obs[setting + '_TVOCR']  = [0]*len(df_obs)

    # 6) get reduced name
    name_obs2std = {}
    print('Checking if the name is matched. Adding mapping in Flight_transect_csv_reader if its not!!!')
    for ind, name_obs in enumerate(spec_obs):
        name_obs2std[spec_obs[ind]] = spec_list[ind]
        print(spec_obs[ind], spec_list[ind])
    df_obs_reduced = df_obs[spec_obs].rename(columns=name_obs2std)

    # 7) plume age in minute
    df_obs_reduced.index = df_obs_reduced.index
    
    return df_obs_reduced



# ===========================================================================================
# Function to read observation data for listed species 
# This function is only for dataset we have csv dataset for observations (i.e., WE-CAN data)
# get_bkg is getting retired as we want to use bkg from F0AM output
# There are things we can make the code more decent
# ===========================================================================================
def get_obs_met_df(Flight_ID, spec_list):
    # ------------------------
    # 1) read observation data
    # ------------------------
    if 'RF' in Flight_ID: df_obs = pd.read_csv(f'/glade/work/lixujin/PYTHON/SciProj/Box_modeling_analysis/F0AM_analysis_TS/WE-CAN/Model_inputs_prepared/output_data/{Flight_ID}_met_conc.csv')
    df_obs = df_obs.set_index('Age_physical_avg_min')
    
    # ------------------------------------------------------
    # 2) Mapping to retrieve observation data (customized)
    # ----------------------------------------------------
    spec_obs = []
    # adding species if they are not the list
    for spec in spec_list:
        
        # Physical parameters
        if spec == 'PRESSURE':                          spec_obs.append('PRESSURE')
        if spec == 'TEMPERATURE':                       spec_obs.append('TEMPERATURE')
        if spec == 'RHUM':                              spec_obs.append('RHUM')
        if spec == 'SZA':                               spec_obs.append('SZA')

        # commonly used photolysis
        if spec == 'JO3_O2_O1D':                        spec_obs.append('JO3_O2_O1D')
        if spec == 'JNO2_NO_O3P':                       spec_obs.append('JNO2_NO_O3P')
        if spec == 'JH2O2_2OH':                         spec_obs.append('JH2O2_2OH')
        if spec == 'JNO3_NO_O2':                        spec_obs.append('JNO3_NO_O2')
        if spec == 'JNO3_NO2_O3P':                      spec_obs.append('JNO3_NO2_O3P')
        if spec == 'JN2O5_NO3_NO2':                     spec_obs.append('JN2O5_NO3_NO2')
        if spec == 'JHNO2_OH_NO':                       spec_obs.append('JHNO2_OH_NO')
        if spec == 'JHNO3_OH_NO2':                      spec_obs.append('JHNO3_OH_NO2')
        if spec == 'JHNO4_HO2_NO2UV_VISonly':           spec_obs.append('JHNO4_HO2_NO2UV_VISonly')
        if spec == 'JCH2O_H_HCO':                       spec_obs.append('JCH2O_H_HCO')
        if spec == 'JCH2O_H2_CO':                       spec_obs.append('JCH2O_H2_CO')
        if spec == 'JCH3CHO_CH3_HCO':                   spec_obs.append('JCH3CHO_CH3_HCO')
        if spec == 'JPropanal_C2H5_HCO':                spec_obs.append('JPropanal_C2H5_HCO')
        if spec == 'JCH3OOH_CH3O_OH':                   spec_obs.append('JCH3OOH_CH3O_OH')
        if spec == 'JMeONO2_CH3O_NO2':                  spec_obs.append('JMeONO2_CH3O_NO2')
        
        
        if spec == 'JEthONO2_CH3CH2O_NO2':              spec_obs.append('JEthONO2_CH3CH2O_NO2')
        if spec == 'JCH3COOONO2_CH3COOO_NO2':           spec_obs.append('JCH3COOONO2_CH3COOO_NO2')
        if spec == 'JCH3COOONO2_CH3COO_NO3':            spec_obs.append('JCH3COOONO2_CH3COO_NO3')
        if spec == 'JMAC_Products':                     spec_obs.append('JMAC_Products')
        if spec == 'JMVK_Products':                     spec_obs.append('JMVK_Products')
        if spec == 'JAcetone_CH3CO_CH3':                spec_obs.append('JAcetone_CH3CO_CH3')
        if spec == 'JMEK_CH3CO_CH2CH3':                 spec_obs.append('JMEK_CH3CO_CH2CH3')
        if spec == 'JHydroxyacetone_CH3COO_CH3':        spec_obs.append('JHydroxyacetone_CH3COO_CH3')
        if spec == 'JHydroxyacetone_CH3CO_CH3O':        spec_obs.append('JHydroxyacetone_CH3CO_CH3O')
        if spec == 'JCHOCHO_HCO_HCO':                   spec_obs.append('JCHOCHO_HCO_HCO')
        if spec == 'JCHOCHO_H2_2CO':                    spec_obs.append('JCHOCHO_H2_2CO')
        if spec == 'JCHOCHO_CH2O_CO':                   spec_obs.append('JCHOCHO_CH2O_CO')
        if spec == 'JCH3COCHO_CH3CO_HCO':               spec_obs.append('JCH3COCHO_CH3CO_HCO')
        if spec == 'J23Butanedione_Products':           spec_obs.append('J23Butanedione_Products')
        if spec == 'JClO_Cl_O3P':                       spec_obs.append('JClO_Cl_O3P')
        if spec == 'JClNO2_Cl_NO2':                     spec_obs.append('JClNO2_Cl_NO2')
        if spec == 'JClONO_Cl_NO2':                     spec_obs.append('JClONO_Cl_NO2')
        if spec == 'JClONO2_Cl_NO3':                    spec_obs.append('JClONO2_Cl_NO3')
        if spec == 'JClONO2_ClO_NO2':                   spec_obs.append('JClONO2_ClO_NO2') 
        if spec == 'JBr2_Br_Br':                        spec_obs.append('JBr2_Br_Br')
        if spec == 'JBrO_Br_O':                         spec_obs.append('JBrO_Br_O')
        if spec == 'JHOBr_OH_Br':                       spec_obs.append('JHOBr_OH_Br')
        if spec == 'JBrNO_Br_NO':                       spec_obs.append('JBrNO_Br_NO')
        if spec == 'JBrONO_Br_NO2':                     spec_obs.append('JBrONO_Br_NO2')
        if spec == 'JBrONO_BrO_NO':                     spec_obs.append('JBrONO_BrO_NO')
        if spec == 'JBrNO2_Br_NO2':                     spec_obs.append('JBrNO2_Br_NO2')
        if spec == 'JBrONO2_BrO_NO2':                   spec_obs.append('JBrONO2_BrO_NO2')
        if spec == 'JBrONO2_Br_NO3':                    spec_obs.append('JBrONO2_Br_NO3')
        if spec == 'JBrCl_Br_Cl':                       spec_obs.append('JBrCl_Br_Cl')
        if spec == 'JCHBr3_Products':                   spec_obs.append('JCHBr3_Products')

    # 3) get reduced name
    name_obs2std = {}
    print('Checking if the name is matched. Adding mapping in Flight_transect_csv_reader if its not!!!')
    for ind, name_obs in enumerate(spec_obs):
        name_obs2std[spec_obs[ind]] = spec_list[ind]
        print(spec_obs[ind], spec_list[ind])
    df_obs_reduced = df_obs[spec_obs].rename(columns=name_obs2std)

    # 4) plume age in minute
    df_obs_reduced.index = df_obs_reduced.index
    
    return df_obs_reduced
