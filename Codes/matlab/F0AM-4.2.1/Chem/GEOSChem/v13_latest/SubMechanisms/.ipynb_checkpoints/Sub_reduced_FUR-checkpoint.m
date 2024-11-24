% ---- Begin F0AM Add Compounds code ----
%% Compound list
SpeciesToAdd = {...
'Furans';'Furfurals';'DBDIAL';'HFURO2';'LBZFUONE';'DBDIALCO3';'DBDIALO2';
'HFURCO2H';'LBZFUO2';'DBDIALPAN';'HYDDIALOOH';
'HYDFURFURO2'; 'TRIBDIAL';'MALANHY';
'MALANHYO2';'C3H4';'PO3FUR';'PNO3FUR'};

RO2ToAdd = {...
'HFURO2';'DBDIALCO3';'DBDIALO2';'DBDIALCO3';'LBZFUO2';'MALANHYO2';};
AddSpecies
 
% Unique species in the reduced mechanism
%{
FUR         = IGNORE; {C4H40; General furans without aldehdye group, including furan, methylfuran, and dimethylfuran}
FURFUR      = IGNORE; {C5H4O2; General furans without aldehdye group with addtional aldehdye group, including furfural and methylfurfural}
DBDIAL      = IGNORE; {Generic aldehdye products from FUR oxidation including MALDIAL, C5DICARB, and C4DBDIKET}
HFURO2      = IGNORE; {Generic peroxide radicals from FUR, including HYDFURANO2, HYDMEFURANO2, C5DICARBO2, HYDDIMEFURANO2}
LBZFUONE    = IGNORE; {Lumped furanones from furans oxidation, including BZFUONE and TLFUONE}
DBDIALCO3   = IGNORE; {Generic Peroxyacetyl radical from furans oxidation, including MALDIALCO3 and C5CO14O2}
DBDIALO2    = IGNORE; {Generic peroxy radical from DBDIAL oxidation, including MALDIALO2 and C5DICARBO2}
HFURCO2H    = IGNORE; {Generic organic acid products from furans oxidation including MALDALCO2H and C5CO14OH}
LBZFUO2     = IGNORE; {Generic peroxy radical from lumped furanones, including BZFUO2 and TLFUO2}
DBDIALPAN   = IGNORE; {Generic  PAN compounds from furans oxidation including MALDIALPAN and C5COO2NO2}
HYDDIALOOH  = IGNORE; {DBDIALO2 peroxide}
HYDFURFURO2 = IGNORE; {Generic peroxide radicals from FURFUR}
TRIBDIAL    = IGNORE; {Generic aldehdye products from FUR oxidation, includiing C5DIALCO and C5MCO3DB}
MALANHY     = IGNORE; {C4H2O3; Maleic anhydride}
MALANHYO2   = IGNORE; {RO2 from maleic anhydride}

C3H4        = IGNORE; {C3H4; Dummy hydrocarbon chain}
PO3FUR      = IGNORE; {Dummy product from the reaction of furans reacting with O3}
PNO3FUR     = IGNORE; {Dummy product from the reaction of furans reacting with NO3}

obsolete below...
DIMEFURAN  = IGNORE; {C6H8O; 2,5-Dimethylfuran}
FURFURAL   = IGNORE; {C5H4O2; Furfural}
MEFURFURAL = IGNORE; {C6H6O2; Methylfurfural}
DIAL       = IGNORE; {Generic aldehdye products from furans oxidation including MALDIAL, C5DICARB, and C5DIALCO}
DIALCO2H   = IGNORE; {Generic organic acid products from furans oxidation including MALDALCO2H and C5CO14OH}
DIKET      = IGNORE; {Generic chemical compound containing two carbonyl groups from furans oxidation including C4DBDIKET and C5MCO3DB}
DIALO2     = IGNORE; {Generic peroxy radical from furans oxidation including MALDIALO2 and C5DICARBO2}
DIALCO3    = IGNORE; {Generic Peroxyacetyl radical from furans oxidation including MALDIALCO3 and C5CO14O2}
LBZFUONE   = IGNORE; {Lumped furanones from furans oxidation including BZFUONE and TLFUONE}
DIALOOH    = IGNORE; {Generic hydroperoxide radicals from furans oxidation including MALDIALOOH and C5DICAROOH}
DIALCO3H   = IGNORE; {Generic C(O)OO radicals from furans oxidation including MALDIALCO3 and C5CO14OOH}
DIALCO2    = IGNORE; {Generic C(O)O radicals from furans oxidation including MALDIALCO2 and C5CO14CO2}
DIALPAN    = IGNORE; {Generic PAN compounds from furans oxidation including MALDIALPAN and C5COO2NO2}
HCOCO2H    = IGNORE; {C2H2O3; Glyoxylic acid}
MALANHY    = IGNORE; {C4H2O3; Maleic anhydride}
%}

%% Reactions list
i=i+1;
Rnames{i} = 'Furans + OH = 0.51DBDIAL + 0.49HFURO2 + 0.51HO2';
k(:,i) = 3.83E-11;
Gstr{i,1} = 'Furans'; Gstr{i,2} = 'OH';
fFurans(i)=fFurans(i)-1; fOH(i)=fOH(i)-1; fDBDIAL(i)=fDBDIAL(i)+0.51; fHFURO2(i)=fHFURO2(i)+0.49; fHO2(i)=fHO2(i)+0.51; 

i=i+1;
Rnames{i} = 'Furans + O3 = PO3FUR';
k(:,i) = 2.40E-18;
Gstr{i,1} = 'Furans'; Gstr{i,2} = 'O3';
fFurans(i)=fFurans(i)-1; fO3(i)=fO3(i)-1; fPO3FUR(i)=fPO3FUR(i)+1;

i=i+1;
Rnames{i} = 'Furans + NO3 = PNO3FUR';
k(:,i) = 1.2E-12;
Gstr{i,1} = 'Furans'; Gstr{i,2} = 'NO3';
fFurans(i)=fFurans(i)-1; fNO3(i)=fNO3(i)-1; fPNO3FUR(i)=fPNO3FUR(i)+1;

i=i+1;
Rnames{i} = 'DBDIAL + hv = 0.36LBZFUONE + 0.54DBDIALCO3 + 0.09MGLY + 0.09MCO3 + 0.09CO + 0.64HO2';
k(:,i) = JNO2*0.14;
Gstr{i,1} = 'DBDIAL';
fDBDIAL(i)=fDBDIAL(i)-1; fLBZFUONE(i)=fLBZFUONE(i)+0.36; fDBDIALCO3(i)=fDBDIALCO3(i)+0.54; fMGLY(i)=fMGLY(i)+0.09; fMCO3(i)=fMCO3(i)+0.09; fCO(i)=fCO(i)+0.09; fHO2(i)=fHO2(i)+0.64;

i=i+1;
Rnames{i} = 'DBDIAL + OH = 0.31DBDIALO2 + 0.69DBDIALCO3';
k(:,i) = 5.35E-11;
Gstr{i,1} = 'DBDIAL';Gstr{i,2} = 'OH';
fDBDIAL(i)=fDBDIAL(i)-1; fOH(i)=fOH(i)-1; fDBDIALO2(i)=fDBDIALO2(i)+0.31; fDBDIALCO3(i)=fDBDIALCO3(i)+0.69;

i=i+1;
Rnames{i} = 'HFURO2 + NO = HFURCO2H + NO2 + 0.73HO2 + 0.27MO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'HFURO2';Gstr{i,2} = 'NO';
fHFURO2(i)=fHFURO2(i)-1; fNO(i)=fNO(i)-1; fHFURCO2H(i)=fHFURCO2H(i)+1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+0.73; fMO2(i)=fMO2(i)+0.27;

i=i+1;
Rnames{i} = 'LBZFUONE + OH = LBZFUO2';
k(:,i) = 4.92E-11;
Gstr{i,1} = 'LBZFUONE';Gstr{i,2} = 'OH';
fLBZFUONE(i)=fLBZFUONE(i)-1; fOH(i)=fOH(i)-1; fLBZFUO2(i)=fLBZFUO2(i)+1; 

i=i+1;
Rnames{i} = 'DBDIALCO3 + NO2 = DBDIALPAN';
k(:,i) = KFPAN;
Gstr{i,1} = 'DBDIALCO3';Gstr{i,2} = 'NO2';
fDBDIALCO3(i)=fDBDIALCO3(i)-1; fNO2(i)=fNO2(i)-1; fDBDIALPAN(i)=fDBDIALPAN(i)+1;

i=i+1;
Rnames{i} = 'DBDIALCO3 + NO = 0.34GLYX + 0.03MGLY + 0.64MALANHY + 0.87HO2 + 0.36CO + 0.13MO2 + 1.00NO2';
k(:,i) = KAPNO;
Gstr{i,1} = 'DBDIALCO3';Gstr{i,2} = 'NO';
fDBDIALCO3(i)=fDBDIALCO3(i)-1; fNO(i)=fNO(i)-1; fGLYX(i)=fGLYX(i)+0.34; fMGLY(i)=fMGLY(i)+0.03; fMALANHY(i)=fMALANHY(i)+0.64; fHO2(i)=fHO2(i)+0.87; fCO(i)=fCO(i)+0.36; fMO2(i)=fMO2(i)+0.13; fNO2(i)=fNO2(i)+1.00;

i=i+1;
Rnames{i} = 'DBDIALO2 + NO = NO2 + 1.10GLYX + 0.69MGLY + 1.21HO2 + 0.21MCO3 + 0.21CO';
k(:,i) = KRO2NO;
Gstr{i,1} = 'DBDIALO2';Gstr{i,2} = 'NO';
fDBDIALO2(i)=fDBDIALO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fGLYX(i)=fGLYX(i)+1.10; fMGLY(i)=fMGLY(i)+0.69; fHO2(i)=fHO2(i)+1.21; fMCO3(i)=fMCO3(i)+0.21; fCO(i)=fCO(i)+0.21;

i=i+1;
Rnames{i} = 'DBDIALO2 + RO2 = 0.82GLYX + 0.69MGLY + 2.22HO2 + 0.45MCO3 + 1.19CO';
k(:,i) = 1.03E-12;
Gstr{i,1} = 'DBDIALO2';Gstr{i,2} = 'RO2';
fDBDIALO2(i)=fDBDIALO2(i)-1; fRO2(i)=fRO2(i)-1; fGLYX(i)=fGLYX(i)+0.82; fMGLY(i)=fMGLY(i)+0.69; fHO2(i)=fHO2(i)+2.22; fMCO3(i)=fMCO3(i)+0.45; fCO(i)=fCO(i)+1.19;

i=i+1;
Rnames{i} = 'DBDIALO2 + HO2 = HYDDIALOOH';
k(:,i) = KRO2HO2*0.69;
Gstr{i,1} = 'DBDIALO2';Gstr{i,2} = 'HO2';
fDBDIALO2(i)=fDBDIALO2(i)-1; fHO2(i)=fHO2(i)-1; fHYDDIALOOH(i)=fHYDDIALOOH(i)+1;

i=i+1;
Rnames{i} = 'HFURCO2H + OH = 0.13GLYX + 0.11MGLY + 0.75MALANHY + 0.44HO2 + 0.25CO + 0.56MO2';
k(:,i) = 4.87E-11;
Gstr{i,1} = 'HFURCO2H';Gstr{i,2} = 'OH';
fHFURCO2H(i)=fHFURCO2H(i)-1; fOH(i)=fOH(i)-1; fGLYX(i)=fGLYX(i)+0.13; fMGLY(i)=fMGLY(i)+0.11; fMALANHY(i)=fMALANHY(i)+0.75; fHO2(i)=fHO2(i)+0.44; fCO(i)=fCO(i)+0.25; fMO2(i)=fMO2(i)+0.56;

i=i+1;
Rnames{i} = 'LBZFUO2 + NO = NO2 + 1.19HO2 + 0.81GLYX + 1.00CH2O + 1.19CO + 0.19MCO3';
k(:,i) = KRO2NO;
Gstr{i,1} = 'LBZFUO2';Gstr{i,2} = 'NO';
fLBZFUO2(i)=fLBZFUO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1.19; fGLYX(i)=fGLYX(i)+0.81; fCH2O(i)=fCH2O(i)+1.00; fCO(i)=fCO(i)+1.19; fMCO3(i)=fMCO3(i)+0.19;

i=i+1;
Rnames{i} = 'LBZFUO2 + HO2 = 1.00CH2O + 1.19CO + 0.81GLYX + 1.19HO2 + 1.00OH + 0.19MCO3';
k(:,i) = KRO2HO2*0.71;
Gstr{i,1} = 'LBZFUO2';Gstr{i,2} = 'HO2';
fLBZFUO2(i)=fLBZFUO2(i)-1; fHO2(i)=fHO2(i)-1; fCH2O(i)=fCH2O(i)+1; fCO(i)=fCO(i)+1.19; fGLYX(i)=fGLYX(i)+0.81; fHO2(i)=fHO2(i)+1.19; fOH(i)=fOH(i)+1.00; fMCO3(i)=fMCO3(i)+0.19;

i=i+1;
Rnames{i} = 'DBDIALPAN = DBDIALCO3 + NO2';
k(:,i) = KBPAN;
Gstr{i,1} = 'DBDIALPAN';
fDBDIALPAN(i)=fDBDIALPAN(i)-1; fDBDIALCO3(i)=fDBDIALCO3(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MALANHY + OH = MALANHYO2';
k(:,i) = 1.4E-12;
Gstr{i,1} = 'MALANHY';Gstr{i,2} = 'OH';
fMALANHY(i)=fMALANHY(i)-1.0; fOH(i)=fOH(i)-1.0; fMALANHYO2(i)=fMALANHYO2(i)+1.0;

i=i+1;
Rnames{i} = 'HYDDIALOOH + OH = 0.40GLYX + 0.44MGLY + 2.03HO2 + 1.40OH + 1.85CO + 0.15MCO3';
k(:,i) = 1.14E-10;
Gstr{i,1} = 'HYDDIALOOH';Gstr{i,2} = 'OH';
fHYDDIALOOH(i)=fHYDDIALOOH(i)-1; fOH(i)=fOH(i)-1; fGLYX(i)=fGLYX(i)+0.40; fMGLY(i)=fMGLY(i)+0.44; fHO2(i)=fHO2(i)+2.03; fOH(i)=fOH(i)+1.40; fCO(i)=fCO(i)+1.85; fMCO3(i)=fMCO3(i)+0.15;

i=i+1;
Rnames{i} = 'MALANHYO2 + NO = NO2 + GLYX + CO + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'MALANHYO2';Gstr{i,2} = 'NO';
fMALANHYO2(i)=fMALANHYO2(i)-1.0; fNO(i)=fNO(i)-1.0; fNO2(i)=fNO2(i)+1.0; fGLYX(i)=fGLYX(i)+1.0; fCO(i)=fCO(i)+1.0; fHO2(i)=fHO2(i)+1.0;

i=i+1;
Rnames{i} = 'Furfurals + OH = 0.5HYDFURFURO2 + 0.5TRIBDIAL + 0.5HO2';
k(:,i) = 3.96E-11;
Gstr{i,1} = 'Furfurals';Gstr{i,2} = 'OH';
fFurfurals(i)=fFurfurals(i)-1; fOH(i)=fOH(i)-1; fHYDFURFURO2(i)=fHYDFURFURO2(i)+0.5; fTRIBDIAL(i)=fTRIBDIAL(i)+0.5; fHO2(i)=fHO2(i)+0.5;

i=i+1;
Rnames{i} = 'HYDFURFURO2 + NO = HFURCO2H + NO2 + CO + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'HYDFURFURO2';Gstr{i,2} = 'NO';
fHYDFURFURO2(i)=fHYDFURFURO2(i)-1; fNO(i)=fNO(i)-1; fHFURCO2H(i)=fHFURCO2H(i)+1; fNO2(i)=fNO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1.0; 

i=i+1;
Rnames{i} = 'TRIBDIAL + OH = DBDIALCO3 + CO';
k(:,i) = 4.9E-11;
Gstr{i,1} = 'TRIBDIAL';Gstr{i,2} = 'OH';
fTRIBDIAL(i)=fTRIBDIAL(i)-1.0; fOH(i)=fOH(i)-1.0; fDBDIALCO3(i)=fDBDIALCO3(i)+1.0; fCO(i)=fCO(i)+1.0;

i=i+1;
Rnames{i} = 'TRIBDIAL + hv = DBDIALCO3 + CO + HO2';
k(:,i) = JMGlyxl;
Gstr{i,1} = 'TRIBDIAL';
fTRIBDIAL(i)=fTRIBDIAL(i)-1.0; fDBDIALCO3(i)=fDBDIALCO3(i)+1.0; fCO(i)=fCO(i)+1.0; fHO2(i) = fHO2(i)+1.0;



%END OF REACTION LIST