SpeciesToAdd = {...
'SO3'; ...
'FURAN'; 'M2FURAN'; 'DIMEFURAN'; 'FURFURAL'; 'MEFURFURAL'; ...
'FALD'; 'FURANRO2'; 'HYDMEFURANRO2'; ...
'FALDCO3'; 'FURANOOH'; 'C5CO14OH'; 'BZFUONE'; ...
'FALDCO2H'; 'MANHYDRIDE'; 'FURANPAN'; 'BZFUO2';};


AddSpecies

% -----------------------------------------------------------------------------------------------------------------------
% JIN Furan mechanism, functional-group-based V1, 05302022
% -----------------------------------------------------------------------------------------------------------------------
%{
Lixu, 20220223 Fix the bug for C2H4 + OH chemistry.
Lixu, 20220530 Develop Furans + OH path
Lixu, 20220621 Add description of lumped species.
- FURAN, M2FURAN, and DIMEFURAN
FALD      {Generic aldehdye products from furans oxidation including HOHOC4DIAL, C5DICARB, C4DBDIKET, and C5DIALCO. They are first oxidation products from Furans} 

FURANRO2 {Generic peroxy radical from furans oxidation including HYDFURANO2; C5HYDCARBO2; FURFURALO2, HYDFURFURALO2, ALDFURFURALO2(this probably need to be put individually since it can produce FURANO2, which may explain why we have less Maleic anhydride). They are first oxidation products from Furans.} 

HYDMEFURANRO2 {Generic hydroperoxide radical from methyl furans including HYDMEFURANO2, HYDDIMEFURANO2, and HYDMEFURFURALO2. These are oxdiation radicals producing MANHYDRIDE}

C5CO14OH {Acetyl acrylic acid or C5CO14OH}
FALDCO3  {Generic Peroxyacetyl radical from furan-related aldehydes oxidation including MALDIALCO3}
FALDCO2H {Generic Peroxyacetyl radical from furan-related aldehydes oxidation including MALDALCO2H and MALDALCO3H}

MANHYDRIDE  { Maleic anhydride or MALANHY}
MANHYDRIDEO2 { Peroxyacetyl radical from MANHYDRIDE oxidation or MALANHY}
GLYCO2H  {Glyoxylic acid or HCOCO2H}
FURANOOH {Generic peroxide product from oxidation of FURANRO2, including HYDFURANOOH and MALDIALOOH}
FURANPAN {MALDIALPAN} FURFURALPAN...
MANHYDRIDE  {Maleic anhydride or MALANHY}
BZFUONE {including TLFUONE and BZFUONE}
BZFUO2 {BZFUONE oxidation product}


26 rxts and 13 species
Furans + OH path: Function-group-based + approximation of oxidation product
FURAN + OH = 0.7FALD + 0.7HO2 + 0.3FURANRO2 (k = 4.2e-11)
M2FURAN + OH = 0.3FALD + 0.3HO2 + 0.3HYDMEFURANRO2 + 0.4FURANRO2 + 0.4CH2O + 0.4MGLY (k = 6.2e-11) % CH2O and MGLY, guessing its ratio
DIMEFURAN + OH = 0.3FALD + 0.3HO2 + 0.7HYDMEFURANRO2 + 0.7MGLY(k = 1.32e-10) % MGLY 
FURFURAL + OH = 0.565FURANRO2 + 0.435FALD + 0.463HO2 (k = 3.50e-11)
MEFURFURAL + OH = 0.532HYDMEFURANRO2+ 0.458FALD + 0.458HO2 (k = 5.1e-11)
    FALD + OH = 0.83FALDCO3 + 0.17FURANRO2 (k = 5.20e-11)
    FALD + hv = 0.6FALDCO3 + 0.6HO2 + 0.4BZFUONE
    FURANRO2 + NO = GLYX + NO2 + HO2 (k = KRO2NO)
    FURANRO2 + HO2 = FURANOOH (k = KRO2HO2) # assuming it follows the reaction of HYDFURANOOH
    FURANRO2 + MO2 = 0.42*(2GLYX + HO2) + 0.16FALD + 0.42FALDCO2H (k = 6.6e-13)                                     # assumption made to weight proportion and rate constant, assuming RO2 as MO2
    FURANRO2 + NO3 = 2GLYX + HO2 + NO2 (k = KRO2NO3)    
    HYDMEFURANRO2 + NO = C5CO14OH + HO2 + NO2 (k = KRO2NO)
        FALDCO3 + MO2 = 0.7*(0.4GLYX + 0.4CO + 0.6MANHYDRIDE) + 0.3*FALDCO2H (k = 1.00e-11)
        FALDCO3 + HO2 = 0.56FALDCO2H + 0.15O3  + 0.44(OH+HO2) + 0.176GLYX + 0.176CO + 0.246MANHYDRIDE
        FALDCO3 + NO = 0.4GLYX + 0.4CO + 0.6MANHYDRIDE + NO2 (k = KAPNO)
        FALDCO3 + NO2 = FURANPAN (k = KFPAN)
        FALDCO3 + NO3 = 0.4GLYX + 0.4CO + 0.6MANHYDRIDE + NO2 (k = KRO2NO3.*1.74)
        FURANOOH + hv = FALDCO2H  + OH (JHPALD.*2)
        FURANOOH + OH = FALDCO2H + OH (k = 4e-11)
        C5CO14OH = 0.83(MANHYDRIDE + MO2) + 0.17(MGLY + HO2 + CO) (k = 5.44e-11) 
        BZFUONE + OH = BZFUO2 (k = 4.45e-11)
            FALDCO2H + OH = FURANRO2 (k = 3.70e-11)
            FALDCO2H + hv = HO2 + CO + HO2 + CO
            MANHYDRIDE + OH = MO2  (k = 1.4e-12)                                                                    # regard MALANHYO2 as MO2. This could be a big assumption. Check any potential error.
            FURANPAN = FALDCO3 + NO2 (k = KBPAN)
            BZFUO2 + NO = 2CO + 2HO2 + NO2 + CH2O  (k = KRO2NO) % assumption made
%}

i=i+1;
Rnames{i} = 'FURAN + OH = 0.7FALD + 0.7HO2 + 0.3FURANRO2';
k(:,i) = 4.2e-11;
Gstr{i,1} = 'FURAN'; Gstr{i,2} = 'OH'; 
fFURAN(i)=fFURAN(i)-1; fOH(i)=fOH(i)-1; fFALD(i)=fFALD(i)+0.7; fHO2(i)=fHO2(i)+0.7; fFURANRO2(i)=fFURANRO2(i)+0.3; 

i=i+1;
Rnames{i} = 'M2FURAN + OH = 0.3FALD + 0.3HO2 + 0.3HYDMEFURANRO2 + 0.4FURANRO2 + 0.4CH2O + 0.4MGLY';
k(:,i) = 6.2e-11;
Gstr{i,1} = 'M2FURAN'; Gstr{i,2} = 'OH'; 
fM2FURAN(i)=fM2FURAN(i)-1; fOH(i)=fOH(i)-1; fFALD(i)=fFALD(i)+0.3; fHO2(i)=fHO2(i)+0.3; fHYDMEFURANRO2(i)=fHYDMEFURANRO2(i)+0.3; fFURANRO2(i)=fFURANRO2(i)+0.4; fCH2O(i)=fCH2O(i)+0.4; fMGLY(i)=fMGLY(i)+0.4;

i=i+1;
Rnames{i} = 'DIMEFURAN + OH = 0.3FALD + 0.3HO2 + 0.7HYDMEFURANRO2 + 0.7MGLY';
k(:,i) = 1.32e-10;
Gstr{i,1} = 'DIMEFURAN'; Gstr{i,2} = 'OH'; 
fDIMEFURAN(i)=fDIMEFURAN(i)-1; fOH(i)=fOH(i)-1; fFALD(i)=fFALD(i)+0.3; fHO2(i)=fHO2(i)+0.3; fHYDMEFURANRO2(i)=fHYDMEFURANRO2(i)+0.7; fMGLY(i)=fMGLY(i)+0.7;

i=i+1;
Rnames{i} = 'FURFURAL + OH = 0.565FURANRO2 + 0.435FALD + 0.463HO2';
k(:,i) = 3.50e-11;
Gstr{i,1} = 'FURFURAL'; Gstr{i,2} = 'OH'; 
fFURFURAL(i)=fFURFURAL(i)-1; fOH(i)=fOH(i)-1; fFURANRO2(i)=fFURANRO2(i)+0.565; fFALD(i)=fFALD(i)+0.435; fHO2(i)=fHO2(i)+0.463; 

i=i+1;
Rnames{i} = 'MEFURFURAL + OH = 0.532FURANRO2 + 0.458FALD + 0.458HO2';
k(:,i) = 5.1e-11;
Gstr{i,1} = 'MEFURFURAL'; Gstr{i,2} = 'OH'; 
fMEFURFURAL(i)=fMEFURFURAL(i)-1; fOH(i)=fOH(i)-1; fFURANRO2(i)=fFURANRO2(i)+0.532; fFALD(i)=fFALD(i)+0.458; fHO2(i)=fHO2(i)+0.458; 

i=i+1;
Rnames{i} = 'FALD  + OH = 0.83FALDCO3 + 0.17FURANRO2';
k(:,i) = 5.2e-11;
Gstr{i,1} = 'FALD'; Gstr{i,2} = 'OH'; 
fFALD(i)=fFALD(i)-1; fOH(i)=fOH(i)-1; fFALDCO3(i)=fFALDCO3(i)+0.83; fFURANRO2(i)=fFURANRO2(i)+0.17; 

i=i+1;
Rnames{i} = 'FALD + hv = 0.6FALDCO3 + 0.6HO2 + 0.4BZFUONE';
k(:,i) = 5.2e-11;
Gstr{i,1} = 'FALD'; 
fFALD(i)=fFALD(i)-1; fFALDCO3(i)=fFALDCO3(i)+0.6; fHO2(i)=fHO2(i)+0.6; fBZFUONE(i)=fBZFUONE(i)+0.4; 

i=i+1;
Rnames{i} = 'FURANRO2 + NO = GLYX + NO2 + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'FURANRO2'; Gstr{i,2} = 'NO'; 
fFURANRO2(i)=fFURANRO2(i)-1; fNO(i)=fNO(i)-1; fGLYX(i)=fGLYX(i)+1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'FURANRO2 + HO2 = FURANOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'FURANRO2'; Gstr{i,2} = 'HO2'; 
fFURANRO2(i)=fFURANRO2(i)-1; fHO2(i)=fHO2(i)-1; fFURANOOH(i)=fFURANOOH(i)+1;

i=i+1;
Rnames{i} = ' FURANRO2 + MO2 = 0.84GLYX + 0.42HO2 + 0.16FALD + 0.42FALDCO2H';
k(:,i) = 6.6e-13;
Gstr{i,1} = 'FURANRO2'; Gstr{i,2} = 'MO2'; 
fFURANRO2(i)=fFURANRO2(i)-1; fMO2(i)=fMO2(i)-1; fGLYX(i)=fGLYX(i)+0.84; fHO2(i)=fHO2(i)+0.42; fFALD(i)=fFALD(i)+0.16; fFALDCO2H(i)=fFALDCO2H(i)+0.42;

i=i+1;
Rnames{i} = 'FURANRO2 + NO3 = 2GLYX + HO2 + NO';
k(:,i) = KRO2NO3;
Gstr{i,1} = 'FURANRO2'; Gstr{i,2} = 'NO3'; 
fFURANRO2(i)=fFURANRO2(i)-1; fNO3(i)=fNO3(i)-1; fGLYX(i)=fGLYX(i)+2; fHO2(i)=fHO2(i)+1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURANRO2 + NO = C5CO14OH + HO2 + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'HYDMEFURANRO2'; Gstr{i,2} = 'NO'; 
fHYDMEFURANRO2(i)=fHYDMEFURANRO2(i)-1; fNO(i)=fNO(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'FALDCO3 + MO2 = 0.28GLYX + 0.28CO + 0.42MANHYDRIDE + 0.3FALDCO2H';
k(:,i) = 1.00e-11;
Gstr{i,1} = 'FALDCO3'; Gstr{i,2} = 'MO2'; 
fFALDCO3(i)=fFALDCO3(i)-1; fMO2(i)=fMO2(i)-1; fGLYX(i)=fGLYX(i)+0.28; fCO(i)=fCO(i)+0.28; fMANHYDRIDE(i)=fMANHYDRIDE(i)+0.42; fFALDCO2H(i)=fFALDCO2H(i)+0.3;

i=i+1;
Rnames{i} = 'FALDCO3 + HO2 = 0.56FALDCO2H + 0.15O3  + 0.44OH + 0.44HO2 + 0.176GLYX + 0.176CO + 0.246MANHYDRIDE';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'FALDCO3'; Gstr{i,2} = 'HO2'; 
fFALDCO3(i)=fFALDCO3(i)-1; fHO2(i)=fHO2(i)-1; fFALDCO2H(i)=fFALDCO2H(i)+0.56; fO3(i)=fO3(i)+0.15; fOH(i)=fOH(i)+0.44; fHO2(i)=fHO2(i)+0.44; fGLYX(i)=fGLYX(i)+0.176; fCO(i)=fCO(i)+0.176; fMANHYDRIDE(i)=fMANHYDRIDE(i)+0.246; 

i=i+1;
Rnames{i} = 'FALDCO3 + NO = 0.4GLYX + 0.4CO + 0.6MANHYDRIDE + NO2'; % Lixu, change 0.6 into 1.2, change back.
k(:,i) = KAPNO;
Gstr{i,1} = 'FALDCO3'; Gstr{i,2} = 'NO'; 
fFALDCO3(i)=fFALDCO3(i)-1; fNO(i)=fNO(i)-1; fGLYX(i)=fGLYX(i)+0.4; fCO(i)=fCO(i)+0.4; fMANHYDRIDE(i)=fMANHYDRIDE(i)+1.2; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'FALDCO3 + NO2 = FURANPAN';
k(:,i) = KFPAN;
Gstr{i,1} = 'FALDCO3'; Gstr{i,2} = 'NO2'; 
fFALDCO3(i)=fFALDCO3(i)-1; fNO2(i)=fNO2(i)-1; fFURANPAN(i)=fFURANPAN(i)+1;

i=i+1;
Rnames{i} = 'FALDCO3 + NO3 = 0.4GLYX + 0.4CO + 0.6MANHYDRIDE + NO2';
k(:,i) = KRO2NO3.*1.74;
Gstr{i,1} = 'FALDCO3'; Gstr{i,2} = 'NO3'; 
fFALDCO3(i)=fFALDCO3(i)-1; fNO3(i)=fNO3(i)-1; fGLYX(i)=fGLYX(i)+0.4; fCO(i)=fCO(i)+0.4; fMANHYDRIDE(i)=fMANHYDRIDE(i)+0.6; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'FURANOOH + hv = FALDCO2H  + OH';
k(:,i) = JHPALD.*2;
Gstr{i,1} = 'FURANOOH'; 
fFURANOOH(i)=fFURANOOH(i)-1; fFALDCO2H(i)=fFALDCO2H(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'FURANOOH + OH = FALDCO2H  + OH';
k(:,i) = 4e-11;
Gstr{i,1} = 'FURANOOH'; Gstr{i,2} = 'OH'; 
fFURANOOH(i)=fFURANOOH(i)-1; fOH(i)=fOH(i)-1; fFALDCO2H(i)=fFALDCO2H(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'C5CO14OH = 0.83MANHYDRIDE + 0.83MO2 + 0.17MGLY + 0.17HO2 + 0.17CO';
k(:,i) = 5.44e-11;
Gstr{i,1} = 'C5CO14OH'; 
fC5CO14OH(i)=fC5CO14OH(i)-1; fMANHYDRIDE(i)=fMANHYDRIDE(i)+0.83; fMO2(i)=fMO2(i)+0.83; fMGLY(i)=fMGLY(i)+0.17; fHO2(i)=fHO2(i)+0.17; fCO(i)=fCO(i)+0.17;

i=i+1;
Rnames{i} = 'BZFUONE + OH = BZFUO2';
k(:,i) = 4.45e-11;
Gstr{i,1} = 'BZFUONE'; Gstr{i,2} = 'OH'; 
fBZFUONE(i)=fBZFUONE(i)-1; fOH(i)=fOH(i)-1; fBZFUO2(i)=fBZFUO2(i)+1; 

i=i+1;
Rnames{i} = 'FALDCO2H + OH = FURANRO2';
k(:,i) = 3.70e-11;
Gstr{i,1} = 'FALDCO2H'; Gstr{i,2} = 'OH'; 
fFALDCO2H(i)=fFALDCO2H(i)-1; fOH(i)=fOH(i)-1; fFURANRO2(i)=fFURANRO2(i)+1;

i=i+1;
Rnames{i} = 'FALDCO2H + hv = 2HO2 + 2CO';
k(:,i) = JMACR;
Gstr{i,1} = 'FALDCO2H'; 
fFALDCO2H(i)=fFALDCO2H(i)-1; fHO2(i)=fHO2(i)+2; fCO(i)=fCO(i)+2; 

i=i+1;
Rnames{i} = 'MANHYDRIDE + OH = MO2';
k(:,i) = 1.4e-12;
Gstr{i,1} = 'MANHYDRIDE'; Gstr{i,2} = 'OH'; 
fMANHYDRIDE(i)=fMANHYDRIDE(i)-1; fOH(i)=fOH(i)-1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'FURANPAN = FALDCO3 + NO2';
k(:,i) = KBPAN;
Gstr{i,1} = 'FURANPAN'; 
fFURANPAN(i)=fFURANPAN(i)-1; fFALDCO3(i)=fFALDCO3(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'BZFUO2 + NO = 2CO + 2HO2 + NO2 + CH2O';
k(:,i) = KRO2NO;
Gstr{i,1} = 'BZFUO2'; Gstr{i,2} = 'NO'; 
fBZFUO2(i)=fBZFUO2(i)-1; fNO(i)=fNO(i)-1; fCO(i)=fCO(i)+2; fHO2(i)=fHO2(i)+2; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+1;