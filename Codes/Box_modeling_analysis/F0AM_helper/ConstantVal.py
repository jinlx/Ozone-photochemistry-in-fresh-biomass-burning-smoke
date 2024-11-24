# ============================================================
# Mapping for standard names, GC names, and MCM names
# ===========================================================
# mapping names in to the standard form   
names_std_GC = {
    # non VOCs
    'HONO': 'HNO2',
    'MPN': 'MPN',
    # CxHy
    'Ethyne':  'C2H2',
    'Ethene':  'C2H4',
    'Ethane':  'C2H6',
    'Propane': 'C3H8',
    'Benzene': 'BENZ',
    'Toluene': 'TOLU',
    # Aldehydes
    'Formaldehyde': 'CH2O',
    'Acetaldehyde': 'ALD2',
    'Glyoxal': 'GLYX',
    # C6-C8 aromatics
    'Benzene': 'BENZ',
    'Toluene': 'TOLU', 
    # Organic acids
    'Formic acid': 'HCOOH',
    'Acetic acid': 'ACTA',
    # Biogenic related compounds
    'Isoprene': 'ISOP',
    'Methacrolein': 'MACR',
    'MVK': 'MVK',
    # Alcohols
    'Methanol': 'MOH',
    'Ethanol': 'EOH',
    # Ketones
    'Acetone': 'ACET',
    ##'MEK': 'MEK',
    # Furans related
    'Furan': 'FURAN',
    'Methylfuran': 'M2FURAN',
    'Dimethylfuran': 'DIMEFURAN',
    'Furfural': 'FURFURAL',
    'Methylfurfural': 'MEFURFURAL',
    'Maleic anhydride': 'MALANHY',
    'Furanone': 'BZFUONE',
    # others
    'Glycoaldehyde': 'GLYC',
    'Methylglyoxal': 'MGLY', 
    'Benzaldehyde': 'BALD',
    'PPN': 'PPN',
    'DMS': 'DMS',
    'Isoprene-hydroxynitrate': 'IHN',
    'Phenol': 'PHEN',
    'Cresol': 'CSL',
    # not included in the GEOS-Chem
    'Acrolein': 'ACR',
    'Hydroxyacetone': 'HAC',
    'Methyl acetate': 'METHACET',
    'Ethyl formate': 'ETHFORM',
    'Butadiene': 'C4H6',
    'Butenal': 'C4ALDB',
    'Butanedione': 'BIACET',
    'Pentan2one': 'MPRK',
    'Pentan3one': 'DIKE',
    'Catechol': 'CATECHOL',
    'Hexanones': 'CYHEXOL',
    'Guaiacol': 'GUAIACOL',
    'Heptanone': 'HEPT3ONE',
    'Styrene': 'STYRENE',
    'Tolualdehyde': 'OXYLAL',
    'Creosol': 'MGUAIACOL',
    'Syringol': 'SYRINGOL',
    'Trimethyl123benzene': 'TM123B',
    'Isopropylbenzene': 'IPBENZ',
    'Propylbenzene': 'PBENZ',
    'Methyltoluene': 'METHTOL',
    'Pethyltoluene': 'PETHTOL',
    'Trimethyl135benzene': 'TM135B',
    'Oethyltoluene': 'OETHTOL',
    'Pinic acid':'PINIC',
    'Pinonic acid':'PINONIC',
    'Sesquiterpenes': 'BCARY',
    'Acrylic acid': 'ACO2H',
    'Oxylenol':'OXYLOL',    
    'Pbenzoquinone': 'PBZQONE',
    'Acetonitrile': 'ACETONIT',  

    # Radicals
    'MO2': 'MO2',
    'MCO3': 'MCO3',
    'MALDIALO': 'DIALO',
    'MALDIALO2': 'DIALO2',
    'MALDIALCO2': 'DIALCO2',
    'HO2': 'HO2',
    'OH': 'OH'
}

names_GC_std = {v: k for k, v in names_std_GC.items()}

names_std_MCM = {
    # non VOCs
    'HONO': 'HONO',
    'MPN': 'CH3O2NO2',
    # CxHy
    'Ethyne':  'C2H2',
    'Ethene':  'C2H4',
    'Ethane':  'C2H6',
    'Propane': 'C3H8',
    'Benzene': 'BENZENE',
    'Toluene': 'TOLUENE',
    # Aldehydes
    'Formaldehyde': 'HCHO',
    'Acetaldehyde': 'CH3CHO',
    'Glyoxal': 'GLYOX',
    # C6-C8 aromatics
    'Benzene':'BENZENE',
    'Toluene':'TOLUENE',
    # Organic acids
    'Formic acid': 'HCOOH',
    'Acetic acid': 'CH3CO2H',
    # Biogenic related compounds
    'Isoprene': 'C5H8',
    'Methacrolein': 'MACR',
    'MVK': 'MVK',
    # Alcohols
    'Methanol': 'CH3OH',
    'Ethanol': 'C2H5OH',  
    # Ketones
    'Acetone': 'CH3COCH3',
    #'MEK': 'MEK',
    # Furans related
    'Furan': 'FURAN',
    'Methylfuran': 'M2FURAN',
    'Dimethylfuran': 'DIMEFURAN',
    'Furfural': 'FURFURAL',
    'Methylfurfural': 'MEFURFURAL',
    'Maleic anhydride': 'MALANHY',
    'Furanone': 'BZFUONE',
    # others
    'Glycoaldehyde': 'HOCH2CHO',
    'Methylglyoxal': 'MGLYOX',
    'Benzaldehyde': 'BENZAL',
    'DMS': 'DMS',
    'PPN': 'PPN',
    'Isoprene-hydroxynitrate': 'ISOPANO3',
    'Phenol': 'PHENOL',
    'Cresol': 'CRESOL',
    # not included in the GEOS-Chem
    'Acrolein': 'ACR',
    'Hydroxyacetone': 'ACETOL',
    'Methyl acetate': 'METHACET',
    'Ethyl formate': 'ETHFORM',
    'Butadiene': 'C4H6',
    'Butenal': 'C4ALDB',
    'Butanedione': 'BIACET',
    'Pentan2one': 'MPRK',
    'Pentan3one': 'DIKE',
    'Catechol': 'CATECHOL',
    'Hexanones': 'CYHEXOL',
    'Guaiacol': 'GUAIACOL',
    'Heptanone': 'HEPT3ONE',
    'Styrene': 'STYRENE',
    'Tolualdehyde': 'OXYLAL',
    'Creosol': 'MGUAIACOL',
    'Syringol': 'SYRINGOL',
    'Trimethyl123benzene': 'TM123B',
    'Isopropylbenzene': 'IPBENZ',
    'Propylbenzene': 'PBENZ',
    'Methyltoluene': 'METHTOL',
    'Pethyltoluene': 'PETHTOL',
    'Trimethyl135benzene': 'TM135B',
    'Oethyltoluene': 'OETHTOL',
    'Pinic acid':'PINIC',
    'Pinonic acid':'PINONIC',
    'Sesquiterpenes': 'BCARY',
    'Acrylic acid': 'ACO2H',
    'Oxylenol':'OXYLOL',    
    'Pbenzoquinone': 'PBZQONE',
    'Acetonitrile': 'ACETONIT',  
    # Radicals
    'MO2': 'CH3O2',
    'MCO3': 'CH3CO3',
    'MALDIALO': 'MALDIALO',
    'MALDIALO2': 'MALDIALO2',
    'MALDIALCO2': 'MALDIALCO2',
    'HO2':'HO2',
    'OH': 'OH'
}
names_MCM_std = {v: k for k, v in names_std_MCM.items()}

# ==============================
# Dictionary of rate constant
# ==============================
'''
kOH is from EuroChamp, Assuming 300K and standard pressure
'''
k_OH_dic = {
    'Benzene': 1.2E-12,
    'Toluene': 5.6E-12,
    'Xylenes': 1.70E-11, # GEOS-Chem
    'Isoprene': 1E-10,
    'Methanol': 8.78E-13,
    'Ethanol': 3.33E-12,
    'Acetone': 1.87E-13,
    'MEK': 1.05E-12,
    'Phenol': 4.50E-12,
    'Cresol': 4.10E-11,
    'Furan': 3.83E-11,
    'Methylfuran':7.00E-11,
    'Dimethylfuran':1.16E-10,
    'Furfural': 3.50E-11, 
    'Methylfurfural':5.10E-11,
    'Furanone': 4.90E-11,
    'Butadiene': 6.63E-11,
    'Acrolein':2.17E-11,
    'Butenal': 3.60E-11,
    'Guaiacol': 5.40E-11,
    'Styrene': 5.80E-11,
    'Tolualdehyde': 1.89E-11,
    'Creosol': 7.51E-11,
    'Syringol': 8.10E-11,
    'Sesquiterpene': 1.97E-10,
    'Catechol': 1.00E-10,
    'CO': 2.4E-13,
    'Monoterpenes': 6.35E-11,
}
# ============================
# Emission ratio is from Koss
# ============================
'''
Reference:
Koss, Abigail R., et al. "Non-methane organic gas emissions from biomass burning: identification, quantification, and emission factors from PTR-ToF during the FIREX 2016 laboratory experiment." Atmospheric Chemistry and Physics 18.5 (2018): 3299-3319.
'''

ER_dic = {
    'Benzene': 1.7, 
    'Toluene': 0.9,
    'Xylenes': 0.4,
    'Isoprene': 1, # <10% with O3
    'Methanol': 12, 
    'Ethanol': 0.56, 
    'Acetone': 2.3, # 50% photolysis
    'MEK': 0.52, #20-60% photolysis
    'Phenol': 2, # <10% with NO3
    'Cresol': 1.5, # 10-30% with NO3
    'Furan': 1.9,
    'Methylfuran':1.51, # 30-40% with NO3 and O3
    'Dimethylfuran':0.83,  # 40-70% with NO3 and O3
    'Furfural': 2.1, 
    'Methylfurfural':2.4*0.5, # 20-40% from NO3 and O3
    'Furanone': 1.7,
    'Butadiene': 1.8,
    'Butenal': 0.154, # This is from Permar
    'Guaiacol': 1.3,
    'Styrene': 0.27,
    'Tolualdehyde': 0.34, # photolysis ~30%
    'Creosol': 0.269, # From wade, 10-30%.
    'Syringol': 0.12, # 20-60%
    'Sesquiterpene': 0.15, # mostly reacting with O3
    'Catechol': 2.4*0.5, # Correct by 50% from methylfurfural, 20-40%
    'CO': 1000,
    'Monoterpenes': 2.7,
}

# ===========================================================================
# Define a dictionary for target_y values and their corresponding text labels
# ===========================================================================
text_labels = {
    'PO3': 'PO$_{3}$ (ppb h$^{-1}$)',
    'POx': 'PO$_{x}$ (ppb h$^{-1}$)',
    'OH turnover rate': 'OH turnover rate (ppb h$^{-1}$)',
    
    'TVOCR': 'Total VOC reactivity ($s^{-1}$)',
    'OPE': 'OPE (h$^{-1}$)',
    
    'HO2': 'HO$_{2}$ (molecule cm$^{-3}$)',
    'cal_OH_mean': 'OH (1×10$^{6}$ molecule cm$^{-3}$)',

    'Physical age': 'Physical age (hour)',
    'Chemical age': 'Chemical age (hour)',
    'Plume_Age': 'Physical age (hour)',
    'cal_chem_age_median': 'Chemical age (hour)',
    'cal_chem_age_mean': 'Chemical age (hour)',
    'output_chem_age': 'Chemical age (hour)',

    'CH2O': 'CH$_{2}$O (ppb)',
    'Formaldehyde': 'Formaldehyde (ppb)',
    'NOx': 'NO$_{x}$ (ppb)',
    'NO2': 'NO$_{2}$ (ppb)',
    'NO': 'NO (ppb)' ,
    'O3': 'Ozone (ppb)' ,
    'Ozone': 'Ozone (ppb)',
    
    'OHRvoc vs OHRnox': 'OHR$_{VOC}$: OHR$_{NOx}$',
    'OHRvoc: OHRnox': 'OHR$_{VOC}$: OHR$_{NOx}$',
    'OHRnox vs OHRvoc': 'OHR$_{NOx}$: OHR$_{VOC}$',
    'OHRnox: OHRvoc': 'θ value',
    
    'CH2O vs NO2': 'CH$_{2}$O: NO$_{2}$',
    'CH2O: NO2': 'The ratio of formaldehyde to nitrogen dioxide',
    
    'H2O2 vs HNO3': 'H$_{2}$O$_{2}$: HNO$_{3}$',
    'LROx': 'L$_{ROx}$ (ppb h$^{-1}$)',
    'LNOx_broad': 'L$_{NOx}$ (ppb h$^{-1}$)',
    'LROx vs LNOx_broad': 'L$_{ROx}$: L$_{NOx}$', 
    'NEMR(O3)': '∆O$_{3}$/∆CO',
    'NEMR_O3': '∆O$_{3}$/∆CO',
    'NEMR_O3_rate': '∆O$_{3}$/∆CO per hour',
    'NEMR(Ox)': '∆(O$_{3}$+ NO$_{2}$)/∆CO',
    'NEMR_Ox': '∆(O$_{3}$+ NO$_{2}$)/∆CO',
    'NEMR_PAN': '∆(PAN)/∆CO',
    'NEMR_PAN_rate': '∆(PAN)/∆CO per hour',

    'NEMR_furans': '∆(Lumped furans)/∆CO',
    'NEMR_furfurals': '∆(Lumped furfurals)/∆CO',    
    'NEMR_MA': '∆(Maleic anhydride)/∆CO',    
    'Furans': 'Lumped furans (ppb)',
    'Furfurals': 'Lumped furfurals (ppb)',    
    'Maleic anhydride': 'Maleic anhydride (ppb)',    

    'LROx: LNOx': r'LRO$_{x}$: LNO$_{x}$',
    'Ln: Q': r'L$_{n}$: Q',
    'H2O2: HNO3': r'H$_{2}$O$_{2}$: HNO$_{3}$',
}    
text_ysublabels = {
    'O3': 'O$_{3}$',
    'Ox': 'O$_{x}$',
    'PO3': 'PO$_{3}$',
    'POx': 'PO$_{x}$',
    'HO2': 'HO$_{2}$',
    'HOx': 'HO$_{x}$',
    'Ozone': 'Ozone',
    'CH2O': 'CH$_{2}$O',
    'NOx': 'NO$_{x}$',
    'NO2': 'NO$_{2}$',
    'HNO3': 'HNO$_{3}$',
    'OHRvoc vs OHRnox': 'OHR$_{VOC}$:OHR$_{NOx}$ ratio',
    'OHRnox vs OHRvoc': 'OHR$_{NOx}$:OHR$_{VOC}$ ratio',
    'CH2O vs NO2' : 'CH$_{2}$O: NO$_{2}$ ratio',
    'H2O2 vs HNO3': 'H$_{2}$O$_{2}$: HNO$_{3}$ ratio',
    'NONO2Ratio': 'NO: NO$_{2}$ ratio',
    'HNO3': 'HNO$_{3}$',
    'Lumped_C>=3_aldehydes': 'Lumped $\geq$ 3C aldehydes',
    'Formic_acid': 'Formic acid',
    'Acetic_acid': 'Acetic acid',
    'MEK': 'Methyl ethyl ketone',
    'Maleic_Anhydride': 'Maleic anhydride',
    'TRO2': 'Total RO$_{2}$',
    'TPNs': 'Total PNs',
    'TANs': 'Total ANs',
    'Butanedione': '2,3-Butanedione',
    'Ln vs Q': 'Ln:Q',
    'LROx vs LNOx_borad': 'L$_{ROx}$:L$_{NOx}$',
    'GLYX': 'Glyoxal',
    'GLYC': 'Glycolaldehyde',
    'BALD': 'Benzaldehyde',
    'RO2':  'RO$_{2}$',
    'PAN':  'PAN',
    'PPN':  'PPN',
    'MPN':  'MPN',
    'MGLY': 'Methylglyoxal',
    
    'LROx: LNOx': r'LRO$_{x}$: LNO$_{x}$',
    'Ln: Q': r'L$_{n}$: Q',
    'H2O2: HNO3': r'H$_{2}$O$_{2}$: HNO$_{3}$',

    'FURA': 'Furans', 
    'FURFUR': 'Furfurals',
    'LBZFUONE': 'Furanones', 
    'MALANHY': 'Maleic Anhydride'
}    



# ==========================================
# Measurement uncertainty of PTR measurement
# Reference: Permar et al. (2021) supplement
# ==========================================
name2uncertainty = {"Lumped C>=3 alkenes": 0.1,
                    "Formaldehyde": 0.4,
                    "Acetaldehyde": 0.15,
                    "Lumped C>=3 aldehydes": 0.5,
                    "Glyoxal": 0.5, # check with Matt
                    "Methylglyoxal": 0.5,
                    "Benzene": 0.15,
                    "Toluene": 0.15,
                    "Xylenes": 0.15,
                    "Formic acid": 0,
                    "Acetic acid": 0.3,
                    "Isoprene": 0, # not sure
                    "Monoterpenes": 0.5,
                    "Methacrolein": 0.15,
                    "MVK": 0.15,
                    "Methanol": 0.15,
                    "Ethanol": 0,
                    "Methyl ethyl ketone": 0.15,
                    "Glycoaldehyde": 0.5,
                    "DMS": 0,
                    "Hydroxyacetone": 0.5,
                    "Phenol": 0.5,
                    "Cresol": 0.5,
                    "Benzaldehyde": 0.5,
                    "Furans": 0.5,
                    "Furfurals": 0.5,
                    "Furan": 0.15,
                    "Methylfuran": 0.15,
                    "Dimethylfuran": 0.5,
                    "Furfural": 0.15,
                    "Methylfurfural": 0.15,
                    "Furanone": 0.5,
                    "Maleic anhydride": 0.5,
                    "Acrolein": 0.5,
                    "Butadiene": 0.5,
                    "Butenal": 0.5,
                    "Butanedione": 0.5,
                    "Pentan2one": 0.5,
                    "Pentan3one": 0.5,
                    "Catechol": 0.5,
                    "Hexanones": 0.15,
                    "Guaiacol": 0.5,
                    "Heptanone": 0.5,
                    "Styrene": 0,
                    "Tolualdehyde": 0.5,
                    "Creosol": 0.5,
                    "Syringol": 0.5,
                    "Trimethyl123benzene": 0, # AWAS, delete
                    "Isopropylbenzene": 0,# AWAS, delete
                    "Propylbenzene": 0,# AWAS, delete
                    "Methyltoluene": 0,# AWAS, delete
                    "Pethyltoluene": 0,# AWAS, delete
                    "Trimethyl135benzene": 0,# AWAS, delete
                    "Oethyltoluene": 0,# AWAS, delete
                    "Pinic acid": 10, # CIMS, guessing
                    "Pinonic acid": 10, # CIMS, guessing
                    "Sesquiterpenes": 0.5,
                    "Acrylic acid": 0, # delete later
                    "Oxylenol": 0, # AWAS, delete
                    "Pbenzoquinone": 0,# AWAS, delete
                    "O3": 0.02,
                    "NOx": 0.04,
                    "PAN": 0.12}

# ======================
# Dictionary for flights
# ======================
'''
id2fire_name = {'RF01': '2018-07-24 Rattlesnake Creek Fire\n(WE-CAN)',
                'RF02': '2018-07-26 Carr Fire\n(WE-CAN)',
                'RF03': '2018-07-30 Taylor Creek\n(WE-CAN)',
                'RF04': '2018-07-31 Sharps Fire\n(WE-CAN)',
                'RF05': '2018-08-02 Mendocino Complex Fire\n(WE-CAN)',
                'RF06': '2018-08-03 Three Fires\n(WE-CAN)',
                'RF07': '2018-08-06 Donnell Fire\n(WE-CAN)',
                #'RF08': '2018-08-08 Mendocino Complex Fire\n(WE-CAN)',
                'RF09': '2018-08-09 Bear Trap Fire\n(WE-CAN)',
                'RF10': '2018-08-13 Five Fires\n(WE-CAN)',
                'RF11': '2018-08-15 Four Fires\n(WE-CAN)',
                #'RF12': '2018-08-16 Miriam Fire\n(WE-CAN)',
                'RF13': '2018-08-20 Two Fires\n(WE-CAN)',
                #'RF15': '2018-08-28 South Sugarloaf Fire\n(WE-CAN)',
                'RF18': '2018-09-10 Red Feather Lakes Rx Fire\n(WE-CAN)',
                'RF19': '2018-09-13 Silver Creek Fire\n(WE-CAN)',
                'P-3B': '2013-09-23 Managed Understory Fire\n(DISCOVER-AQ)',
                'FN19': '2019-08-30 Black Water Fire\n(FIREX-AQ)'}
'''

id2fire_name = {'RF01': 'Rattlesnake Creek Fire\n(WE-CAN)',
                'RF02': 'Carr Fire\n(WE-CAN)',
                'RF03': 'Taylor Creek Fire\n(WE-CAN)',
                'RF04': 'Sharps Fire\n(WE-CAN)',
                'RF05': 'Mendocino Complex Fire\n(WE-CAN)',
                'RF06': 'Three Fires\n(WE-CAN)',
                'RF07': 'Donnell Fire\n(WE-CAN)',
                #'RF08': 'Mendocino Complex Fire\n(WE-CAN)',
                'RF09': 'Bear Trap Fire\n(WE-CAN)',
                'RF10': 'Five Fires\n(WE-CAN)',
                'RF11': 'Four Fires\n(WE-CAN)',
                #'RF12': 'Miriam Fire\n(WE-CAN)',
                'RF13': 'Two Fires\n(WE-CAN)',
                #'RF15': 'South Sugarloaf Fire\n(WE-CAN)',
                'RF18': 'Red Feather Lakes Rx Fire\n(WE-CAN)',
                'RF19': 'Silver Creek Fire\n(WE-CAN)',
                'P-3B': 'Managed Understory Fire\n(DISCOVER-AQ)',
                'FN19': 'Black Water Fire\n(FIREX-AQ)'}

'''
id2fire_name = {'RF01': '2018-07-24 Rattlesnake Creek Fire',
                'RF02': '2018-07-26 Carr Fire',
                'RF03': '2018-07-30 Taylor Creek',
                'RF04': '2018-07-31 Sharps Fire',
                'RF05': '2018-08-02 Mendocino Complex Fire',
                'RF06': '2018-08-03 Three Fires',
                'RF07': '2018-08-06 Donnell Fire',
                #'RF08': '2018-08-08 Mendocino Complex Fire',
                'RF09': '2018-08-09 Bear Trap Fire',
                'RF10': '2018-08-13 Five Fires',
                'RF11': '2018-08-15 Four Fires',
                #'RF12': '2018-08-16 Miriam Fire',
                'RF13': '2018-08-20 Two Fires',
                #'RF15': '2018-08-28 South Sugarloaf Fire',
                'RF18': '2018-09-10 Red Feather Lakes Rx Fire',
                'RF19': '2018-09-13 Silver Creek Fire',
                'P-3B': '2013-09-23 Managed Understory Fire',
                'FN19': '2019-08-30 Black Water Fire'}


id2fire_name = {'RF01': 'WE-CAN: Rattlesnake Creek Fire',
                'RF02': 'WE-CAN: Carr Fire',
                'RF03': 'WE-CAN: Taylor Creek',
                'RF04': 'WE-CAN: Sharps Fire',
                'RF05': 'WE-CAN: Mendocino Complex Fire',
                'RF06': 'WE-CAN: Three Fires',
                'RF07': 'WE-CAN: Donnell Fire',
                #'RF08': 'WE-CAN: Mendocino Complex Fire',
                'RF09': 'WE-CAN: Bear Trap Fire',
                'RF10': 'WE-CAN: Five Fires',
                'RF11': 'WE-CAN: Four Fires',
                #'RF12': 'WE-CAN: Miriam Fire',
                'RF13': 'WE-CAN: Two Fires',
                #'RF15': 'WE-CAN: South Sugarloaf Fire',
                'RF18': 'WE-CAN: Red Feather Lakes Rx Fire',
                'RF19': 'WE-CAN: Silver Creek Fire',
                'P-3B': 'DISCOVER-AQ: Managed Understory Fire',
                'FN19': 'FIREX-AQ: Black Water Fire'}
'''
# ==================================
# VOCs that are not in the GEOS-Chem
# ==================================
Comps_in_GC = ['Ethyne', 
               'Ethene', 'Lumped C>=3 alkenes',
               'Ethane', 'Propane', 'Lumped C>=4 alkanes', 
               'Formaldehyde', 'Acetaldehyde', 'Lumped C>=3 aldehydes',
               'Glyoxal', 'Methylglyoxal', 'Benzene', 'Toluene', 'Xylenes',
               'Formic acid',  'Acetic acid',
               'Isoprene', 'Monoterpenes', 'Methacrolein', 'MVK',
               'Methanol', 'Ethanol',
               'Acetone', 'MEK', 'Glycoaldehyde',
               'DMS', 'Hydroxyacetone',
               'Phenol', 'Cresol', 'Benzaldehyde',
               'Ozone', 'TVOCR', 'OHRnox', 'OHRvoc vs OHRnox', 'OHRnox vs OHRvoc', 'CH2O', 'CH2O vs NO2',
               'Physical age', 'Chemical age',
               'PAN', 'PPN', 'MPN',
               'HO2', 'TRO2', 'XO2', 
               'NEMR(O3)', 'NEMR(Ox)']

