SpeciesToAdd = {...
'SO3'; ...
'FURAN'; 'M2FURAN'; 'DIMEFURAN'; 'FURFURAL'; 'MEFURFURAL'; ...
'DIAL'; 'DIALCO2H'; 'DIKET'; ...
'DIALO2'; 'DIALCO3'; 'LBZFUONE'; ...
'DIALOOH'; 'DIALCO3H'; 'DIALCO2'; 'DIALPAN'; ...
'HCOCO2H'; 'MALANHY'; ...
'DIALO';};

RO2ToAdd = {'DIALO2'};
 
AddSpecies

% -----------------------------------------------------------------------------------------------------------------------
% JIN Furan mechanism, functional-group-based V1, 05302022
% JIN Furan mechanism, functional-group-based V2, 06222022
% -----------------------------------------------------------------------------------------------------------------------
%{
Lixu, 20220223 Fix the bug for C2H4 + OH chemistry.
Lixu, 20220530 Develop Furans + OH path
Lixu, 20220621 Add description of lumped species.
Lixu, 20220622 Modify the chemical mechanism based on Matt's results.
Lixu, 20220630 turn over previous setting but using mech based on Siyuan's paper, see FuranExplicitMech_JIN.xlsx
FURAN      = IGNORE; {C4H40; Furan}
M2FURAN    = IGNORE; {C5H6O; 2-Methylfuran}
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
i=i+1;
Rnames{i} = 'FURAN + OH = 0.7DIAL + 0.3DIALCO2H + 0.7HO2';
k(:,i) = 4.2e-11;
Gstr{i,1} = 'FURAN'; Gstr{i,2} = 'OH'; 
fFURAN(i)=fFURAN(i)-1; fOH(i)=fOH(i)-1; fDIAL(i)=fDIAL(i)+0.7; fDIALCO2H(i)=fDIALCO2H(i)+0.3; fHO2(i)=fHO2(i)+0.7; 

i=i+1;
Rnames{i} = 'M2FURAN + OH = 0.31DIAL + 0.69DIALCO2H + 0.31HO2';
k(:,i) = 6.2e-11;
Gstr{i,1} = 'M2FURAN'; Gstr{i,2} = 'OH'; 
fM2FURAN(i)=fM2FURAN(i)-1; fOH(i)=fOH(i)-1; fDIAL(i)=fDIAL(i)+0.31; fDIALCO2H(i)=fDIALCO2H(i)+0.69; fHO2(i)=fHO2(i)+0.31;

i=i+1;
Rnames{i} = 'DIMEFURAN + OH = 0.27DIKET + 0.73DIALCO2H + 0.27HO2';
k(:,i) = 1.30E-10;
Gstr{i,1} = 'DIMEFURAN'; Gstr{i,2} = 'OH'; 
fDIMEFURAN(i)=fDIMEFURAN(i)-1; fOH(i)=fOH(i)-1; fDIKET(i)=fDIKET(i)+0.27; fDIALCO2H(i)=fDIALCO2H(i)+0.73; fHO2(i)=fHO2(i)+0.27;

i=i+1;
Rnames{i} = 'FURFURAL + OH = 0.44DIAL + 0.56DIALCO2H';
k(:,i) = 3.50e-11;
Gstr{i,1} = 'FURFURAL'; Gstr{i,2} = 'OH'; 
fFURFURAL(i)=fFURFURAL(i)-1; fOH(i)=fOH(i)-1; fDIAL(i)=fDIAL(i)+0.44; fDIALCO2H(i)=fDIALCO2H(i)+0.56;

i=i+1;
Rnames{i} = 'MEFURFURAL + OH = 0.44DIKET + 0.56DIALCO2H + 0.46HO2';
k(:,i) = 5.1e-11;
Gstr{i,1} = 'MEFURFURAL'; Gstr{i,2} = 'OH'; 
fMEFURFURAL(i)=fMEFURFURAL(i)-1; fOH(i)=fOH(i)-1; fDIKET(i)=fDIKET(i)+0.44; fDIALCO2H(i)=fDIALCO2H(i)+0.56; fHO2(i)=fHO2(i)+0.46;

i=i+1;
Rnames{i} = 'DIAL + OH = 0.20DIALO2 + 0.80DIALCO3 + 0.47CO';
k(:,i) = 5.13E-11;
Gstr{i,1} = 'DIAL'; Gstr{i,2} = 'OH'; 
fDIAL(i)=fDIAL(i)-1; fOH(i)=fOH(i)-1; fDIALO2(i)=fDIALO2(i)+0.20; fDIALCO3(i)=fDIALCO3(i)+0.80; fCO(i)=fCO(i)+0.47;

i=i+1;
Rnames{i} = 'DIAL + NO3 = DIALCO3 + HNO3 + 0.47CO';
k(:,i) = KNO3AL.*3.91;
Gstr{i,1} = 'DIAL'; Gstr{i,2} = 'NO3'; 
fDIAL(i)=fDIAL(i)-1; fNO3(i)=fNO3(i)-1; fDIALCO3(i)=fDIALCO3(i)+1; fHNO3(i)=fHNO3(i)+1; fCO(i)=fCO(i)+0.47;

i=i+1;
Rnames{i} = 'DIAL + O3 = 1.14GLYX + 0.04MGLY + 0.12CH2O + 0.03MCO3 + 0.18H2O2 + 0.57OH + 0.84HO2 + 1.73CO';
k(:,i) = 2.00E-18;
Gstr{i,1} = 'DIAL'; Gstr{i,2} = 'O3'; 
fDIAL(i)=fDIAL(i)-1; fO3(i)=fO3(i)-1; fGLYX(i)=fGLYX(i)+1.14; fMGLY(i)=fMGLY(i)+0.04; fCH2O(i)=fCH2O(i)+0.12; fMCO3(i)=fMCO3(i)+0.03; fH2O2(i)=fH2O2(i)+0.18; fOH(i)=fOH(i)+0.57; fHO2(i)=fHO2(i)+0.84; fCO(i)=fCO(i)+1.73;

i=i+1;
Rnames{i} = 'DIAL + hv = 0.21LBZFUONE + 0.79DIALCO3 + 0.47CO + 0.47HO2';
k(:,i) = JNO2.*0.14; % assumption made, Lixu
Gstr{i,1} = 'DIAL';
fDIAL(i)=fDIAL(i)-1; fLBZFUONE(i)=fLBZFUONE(i)+0.21; fDIALCO3(i)=fDIALCO3(i)+0.79; fCO(i)=fCO(i)+0.47; fHO2(i)=fHO2(i)+0.47;

i=i+1;
Rnames{i} = 'DIALO2 + NO = NO2 + 1.8GLYX + 0.2MGLY + HO2';
k(:,i) = KRO2NO; 
Gstr{i,1} = 'DIALO2'; Gstr{i,2} = 'NO'; 
fDIALO2(i)=fDIALO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fGLYX(i)=fGLYX(i)+1.8; fMGLY(i)=fMGLY(i)+0.2; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'DIALO2 + NO3 = NO2 + 1.8GLYX + 0.2MGLY + HO2';
k(:,i) = KRO2NO3; 
Gstr{i,1} = 'DIALO2'; Gstr{i,2} = 'NO3'; 
fDIALO2(i)=fDIALO2(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fGLYX(i)=fGLYX(i)+1.8; fMGLY(i)=fMGLY(i)+0.2; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'DIALO2 + MO2 = 1.8GLYX + 0.2MGLY + HO2';
k(:,i) = 5.89E-13; 
Gstr{i,1} = 'DIALO2'; Gstr{i,2} = 'MO2'; 
fDIALO2(i)=fDIALO2(i)-1; fMO2(i)=fMO2(i)-1; fGLYX(i)=fGLYX(i)+1.8; fMGLY(i)=fMGLY(i)+0.2; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'DIALO2 + HO2 = DIALOOH';
k(:,i) = KRO2HO2.*0.64; 
Gstr{i,1} = 'DIALO2'; Gstr{i,2} = 'HO2'; 
fDIALO2(i)=fDIALO2(i)-1; fHO2(i)=fHO2(i)-1; fDIALOOH(i)=fDIALOOH(i)+1;

i=i+1;
Rnames{i} = 'DIALOOH + OH = DIAL + OH';
k(:,i) = 1.22E-10; 
Gstr{i,1} = 'DIALOOH'; Gstr{i,2} = 'OH'; 
fDIALOOH(i)=fDIALOOH(i)-1; fOH(i)=fOH(i)-1; fDIAL(i)=fDIAL(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'DIALOOH + hv = 1.8GLYX + 0.2MGLY + OH';
k(:,i) = JCH3OOH; 
Gstr{i,1} = 'DIALOOH';
fDIALOOH(i)=fDIALOOH(i)-1; fGLYX(i)=fGLYX(i)+1.8; fMGLY(i)=fMGLY(i)+0.2; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'DIALCO3 + HO2 = 0.15DIALCO2H + 0.41DIALCO3H + 0.44DIALCO2 + 0.15O3 + 0.44OH';
k(:,i) = KAPHO2; 
Gstr{i,1} = 'DIALCO3'; Gstr{i,2} = 'HO2'; 
fDIALCO3(i)=fDIALCO3(i)-1; fHO2(i)=fHO2(i)-1; fDIALCO2H(i)=fDIALCO2H(i)+0.15; fDIALCO3H(i)=fDIALCO3H(i)+0.41; fDIALCO2(i)=fDIALCO2(i)+0.44; fO3(i)=fO3(i)+0.15; fOH(i)=fOH(i)+0.44;

i=i+1;
Rnames{i} = 'DIALCO3 + NO = DIALCO2 + NO2';
k(:,i) = KAPNO; 
Gstr{i,1} = 'DIALCO3'; Gstr{i,2} = 'NO'; 
fDIALCO3(i)=fDIALCO3(i)-1; fNO(i)=fNO(i)-1; fDIALCO2(i)=fDIALCO2(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'DIALCO3 + NO2 = DIALPAN';
k(:,i) = KFPAN; 
Gstr{i,1} = 'DIALCO3'; Gstr{i,2} = 'NO2'; 
fDIALCO3(i)=fDIALCO3(i)-1; fNO2(i)=fNO2(i)-1; fDIALPAN(i)=fDIALPAN(i)+1;

i=i+1;
Rnames{i} = 'DIALCO3 + NO3 = DIALCO2 + NO2';
k(:,i) = KRO2NO3.*1.74; 
Gstr{i,1} = 'DIALCO3'; Gstr{i,2} = 'NO3'; 
fDIALCO3(i)=fDIALCO3(i)-1; fNO3(i)=fNO3(i)-1; fDIALCO2(i)=fDIALCO2(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'DIALCO3 + MO2 = DIALCO2H + DIALCO2';
k(:,i) = 1.00E-11; 
Gstr{i,1} = 'DIALCO3'; Gstr{i,2} = 'MO2'; 
fDIALCO3(i)=fDIALCO3(i)-1; fMO2(i)=fMO2(i)-1; fDIALCO2H(i)=fDIALCO2H(i)+1; fDIALCO2(i)=fDIALCO2(i)+1;

i=i+1;
Rnames{i} = 'DIALCO2H + OH = DIALCO2';
k(:,i) = 4.69E-11; 
Gstr{i,1} = 'DIALCO2H'; Gstr{i,2} = 'OH'; 
fDIALCO2H(i)=fDIALCO2H(i)-1; fOH(i)=fOH(i)-1; fDIALCO2(i)=fDIALCO2(i)+1;

i=i+1;
Rnames{i} = 'DIALCO2H + hv = HCOCO2H + 1.43HO2 + 1.43CO + 0.57MCO3';
k(:,i) = JMACR; % assumption made, Lixu 
Gstr{i,1} = 'DIALCO2H';
fDIALCO2H(i)=fDIALCO2H(i)-1; fHCOCO2H(i)=fHCOCO2H(i)+1; fHO2(i)=fHO2(i)+1.43; fCO(i)=fCO(i)+1.43; fMCO3(i)=fMCO3(i)+0.57;

i=i+1;
Rnames{i} = 'HCOCO2H + OH = HO2 + CO';
k(:,i) = 1.23E-11; 
Gstr{i,1} = 'HCOCO2H'; Gstr{i,2} = 'OH'; 
fHCOCO2H(i)=fHCOCO2H(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'DIALCO3H + OH = DIALCO3';
k(:,i) = 3.84E-11; 
Gstr{i,1} = 'DIALCO3H'; Gstr{i,2} = 'OH'; 
fDIALCO3H(i)=fDIALCO3H(i)-1; fOH(i)=fOH(i)-1; fDIALCO3(i)=fDIALCO3(i)+1;

i=i+1;
Rnames{i} = 'DIALCO3H + hv = DIALCO2 + OH';
k(:,i) = JHPALD.*2; 
Gstr{i,1} = 'DIALCO3H';
fDIALCO3H(i)=fDIALCO3H(i)-1; fDIALCO2(i)=fDIALCO2(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'DIALCO2 = 0.38GLYX + 0.01MGLY + 0.61MALANHY + 0.04MO2 + 0.96HO2 + 0.39CO';
k(:,i) = KDEC; 
Gstr{i,1} = 'DIALCO2';
fDIALCO2(i)=fDIALCO2(i)-1; fGLYX(i)=fGLYX(i)+0.38; fMGLY(i)=fMGLY(i)+0.01; fMALANHY(i)=fMALANHY(i)+0.61; fMO2(i)=fMO2(i)+0.04; fHO2(i)=fHO2(i)+0.96; fCO(i)=fCO(i)+0.39;

i=i+1;
Rnames{i} = 'DIALPAN + OH = 0.96GLYX + 0.04MGLY + 2CO + NO2';
k(:,i) = 3.78E-11; 
Gstr{i,1} = 'DIALPAN'; Gstr{i,2} = 'OH'; 
fDIALPAN(i)=fDIALPAN(i)-1; fOH(i)=fOH(i)-1; fGLYX(i)=fGLYX(i)+0.96; fMGLY(i)=fMGLY(i)+0.04; fCO(i)=fCO(i)+2; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'DIALPAN = DIALCO3 + NO2';
k(:,i) = KBPAN; 
Gstr{i,1} = 'DIALPAN';
fDIALPAN(i)=fDIALPAN(i)-1; fDIALCO3(i)=fDIALCO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'DIKET + hv = MGLY + MCO3 + HO2 + 1.39CO';
k(:,i) = JNO2.*0.0057; 
Gstr{i,1} = 'DIKET';
fDIKET(i)=fDIKET(i)-1; fMGLY(i)=fMGLY(i)+1; fMCO3(i)=fMCO3(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1.39;

i=i+1;
Rnames{i} = 'DIKET + OH = DIALO2 + CO';
k(:,i) = 4.90E-11; 
Gstr{i,1} = 'DIKET'; Gstr{i,2} = 'OH';
fDIKET(i)=fDIKET(i)-1; fOH(i)=fOH(i)-1; fDIALO2(i)=fDIALO2(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'DIKET + O3 = DIAL + MGLY + CO';
k(:,i) = 5.00E-18; 
Gstr{i,1} = 'DIKET'; Gstr{i,2} = 'O3';
fDIKET(i)=fDIKET(i)-1; fO3(i)=fO3(i)-1; fDIAL(i)=fDIAL(i)+1; fMGLY(i)=fMGLY(i)+1; fCO(i)=fCO(i)+1;