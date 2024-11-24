# Current VOCs that GEOS-Chem contains, 2024/04/16
CTM_VOC_list = ['CH4', 'C2H2', 'C2H4', 'C2H6', 'PRPE', 
                'C3H8', 'ALK4', 'CH2O', 'ALD2', 'RCHO', 
                'GLYX', 'BENZ', 'TOLU', 'XYLE', 'HCOOH',
                'ACTA', 'ISOP', 'MTPA', 'MACR', 'MVK', 
                'MOH', 'EOH', 'ACET', 'MEK', 'GLYC', 'DMS',
                'MGLY', 'HAC', 'PHEN', 'BALD', 'CSL', 'FURA']


# mapping names in to the standard form   
names_std_GC = {
    # non VOCs
    'HONO': 'HNO2', 'MPN': 'MPN',
    # CxHy
    'Ethyne':  'C2H2', 'Ethene':  'C2H4', 'Lumped C>=3 alkenes': 'PRPE', 
    'Ethane':  'C2H6', 'Propane': 'C3H8', 'Lumped C>=4 alkanes': 'ALK4', 
    # Aldehydes
    'Formaldehyde': 'CH2O', 'Acetaldehyde': 'ALD2', 'Lumped C>=3 aldehydes': 'RCHO', 
    'Glyoxal': 'GLYX', 'Methylglyoxal': 'MGLY', 
    # C6-C8 aromatics
    'Benzene': 'BENZ', 'Toluene': 'TOLU', 
    # Organic acids
    'Formic acid': 'HCOOH', 'Acetic acid': 'ACTA',
    # Biogenic related compounds
    'Isoprene': 'ISOP', 'Methacrolein': 'MACR', 'MVK': 'MVK',
    # Alcohols
    'Methanol': 'MOH', 'Ethanol': 'EOH',
    # Ketones
    'Acetone': 'ACET', 'MEK': 'MEK',
    # Furans related
    'Furan': 'FURAN',
    'Methylfuran': 
    'M2FURAN', 
    'Dimethylfuran': 
    'DIMEFURAN',
    'Furfural': 'FURFURAL',
    'Methylfurfural': 'MEFURFURAL', 
    'Furanone': 'BZFUONE',
    'Maleic anhydride': 'MALANHY',
    # others
    'Glycoaldehyde': 'GLYC', 
    'Benzaldehyde': 'BALD',
    'Phenol': 'PHEN',
    'Cresol': 'CSL',
    'PPN': 'PPN',
    'DMS': 'DMS',
    'Isoprene-hydroxynitrate': 'IHN',

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