# ======================
# Furans
# ======================
# OH paths (full path, there are 44 reactions)
# This is based on what we got following the major chemcial path as shown in slides
FURAN + OH = 0.7MALDIAL + 0.7HO2 + 0.3HYDFURANO2 (k = 4.2e-11) # haven't weighted glyxoal and divide products into number of C
    MALDIAL + OH = 0.83MALDIALCO3 + 0.17MALDIALO2 (k = 5.20e-11)
        MALDIALCO3 + NO = 0.4(GLYOX + HO2 + CO) + 0.6(MALANHY + HO2) + NO2 (k = KAPNO)
            MALANHY + OH = MALANHYO2 (k = 1.4e-12)
                MALANHYO2 + NO = HCOCOHCO3 + NO2 (k = KRO2NO)
                    HCOCOHCO3 + NO  = GLYOX + HO2 + NO2 (k = KAPNO)
                    HCOCOHCO3 + NO2 = HCOCOHPAN (k = KFPAN) # Is it reasonable to assume it as PAN? Can we further assume HCOCOHCO3 as MALDIALCO3?
        MALDIALCO3 + NO2 = MALDIALPAN (k = KFPAN) # Is it reasonable to assume it as PAN?
        
        MALDIALO2 + HO2 = MALDIALOOH
        MALDIALO2 + NO = MALDIALO + NO2
        MALDIALO2 + NO3 = MALDIALO + NO
        
    MALDIAL + hv = 0.6MALDIALCO3 + 0.4BZFUONE (J = J4.*0.14)
        BZFUONE + OH = BZFUO2 (k = 4.45e-11)
            BZFUO2 + NO = CO14O3CHO + HO2 + NO2 (k = KRO2NO)
                CO14O3CHO + OH = CO + HCOCH2O2 (k = 3.44e-11)
                CO14O3CHO + hv = HO2 + CO + HCOCH2O2 (J = J34)
                    HCOCH2O2 + NO = NO2 + HCHO + CO + HO2 (k = KRO2NO) # There is no HCOCH2O2 + NO2 rxns in the MCM, which is bizarre 

    HYDFURANO2 + NO = MALDALCO2H + NO2 + HO2
        MALDALCO2H + OH = 0.4(GLYOX + HO2 + CO) + 0.6(MALANHY + HO2)

MEFURAN + OH = 0.31(C5DICARB + HO2) + 0.3HYDMEFURANO2 + 0.39C5HYDCARBO2
    C5DICARB + OH = 0.48(C5CO14O2) + 0.52C5DICARBO2
        C5CO14O2 + NO = C5CO14CO2 + NO2
            C5CO14CO2 = 0.83(MALANHY + CH3O2) + 0.17(MGLYOX + HO2 + CO)
        C5CO14O2 + NO2 = C5COO2NO2
        
    C5DICARB + hv = 0.6(C5CO14O2 + HO2) + 0.4TLFUONE
        TLFUONE + OH = TLFUO2
            TLFUO2 + NO = ACCOMECHO + HO2 + NO2
                ACCOMECHO + OH = ACCOMECO3
                    ACCOMECO3 + NO = MECOACETO2 + NO2
                        MECOACETO2 + NO = CH3CO3 + HCHO + NO2
                    ACCOMECO3 + NO2 = ACCOMEPAN  
    C5HYDCARBO2 + NO = MALDALCO2H + NO2 + CH3O2
    HYDMEFURANO2 + NO = C5CO14OH + HO2 + NO2
        C5CO14OH + OH = C5CO14CO2

DIMEFURAN + OH = 0.27(C4DBDIKET + HO2) + 0.73HYDDIMEFURANO2
    C4DBDIKET + OH = DMKOHO2
        DMKOHO2 + NO = 0.7(CO2H3CHO + CH3CO3) + 0.3(MGLYOX + MGLYOX + HO2) + NO2
            CO2H3CHO + OH = CO2H3CO3
            CO2H3CHO + hv = MGLYOX + CO + HO2 + HO2
                CO2H3CO3 + NO = MGLYOX + HO2 + NO2
                CO2H3CO3 + NO2 = C4PAN6            
    C4DBDIKET + hv = MGLYOX + CH3CO3 + HO2 + CO
    
    HYDDIMEFURANO2 + NO = C5CO14OH + NO2 + CH3O2
    
FURFURAL + OH = 0.47C5DIALCO + 0.53HYDFURFURALO2
    C5DIALCO + OH = MALDIALCO3 + CO
    C5DIALCO + hv = MALDIALCO3 + CO + HO2
    HYDFURFURALO2 + NO = MALDALCO2H + NO2 + CO + HO2

MEFURFURAL + OH = 0.01C5MCO3DB + 0.532HYDMEFURFURALO2 + 0.458(C5MCO3DB + HO2) # 5.1e-11


# Simplified version 1: regarding furans as aromatics, ask Kelvin bate

# Simplified version 2: based on functional groups
1) For M2Furan: lump C5DICARB as MALDIAL; lump TLFUONE as BZFUONE; lump C5HYDCARBO2 as HYDFURANO2. 


# simplified version 3: 



# NO3 and O3 paths are required after talking to UCR group


# ====================
# C4H6 (1,3-butadiene)
# ====================


# there are 18 rxns for C4H6, may not necessary to add them all 
C4H6 + OH = 0.217BUTDAO2 + 0.649BUTDBO2 + 0.134BUTDCO2
    BUTDAO2 + NO = 0.95(HC3CHO + HO2 + NO2) + 0.05BUTDANO3 # 7% product is ignored
        HC3CHO + OH = 0.43C41O2 + 0.57HC3CO3
            C41O2 + NO = 0.98(C41O + NO2) + 0.02C41NO3
                C41O = GLYOX + HOCH2CHO + HO2
                    HOCH2CHO + OH = 0.2(GLYOX + HO2) + 0.8HOCH2CO3
                        HOCH2CO3 + NO = NO2 + HO2 + HCHO
                        HOCH2CO3 + NO2 = PHAN
    BUTDBO2 + NO = 0.93(ACR + HCHO + HO2 + NO2) + 0.07BUTDBNO3 # 7% product is ignored
        BUTDBO2 + OH = MVKOH + NO2
            MVKOH + OH = 0.7MVKOHBO2 + 0.3MVKOHAO2
                MVKOHBO2 + NO = HOCH2CHO + HOCH2CO3 + NO2
                MVKOHAO2 + NO = HOCH2COCHO + HCHO + HO2 + NO2
    BUTDCO2 + NO = 0.95(ACR + HCHO + HO2 + NO2) + 0.05NBUTDAOH # 5% product is ignored
        ACR + OH = 0.68ACO3 + 0.255ACRO2 + 0.065OCCOHCO2 # 7% product is ignored
            ACO3 + NO = HO2 + CO + HCHO + NO2
            ACO3 + NO2 = ACRPAN
            ACRO2 = HOCH2CHO + CO + OH
