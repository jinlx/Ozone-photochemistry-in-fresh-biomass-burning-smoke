%{
The following reactions are from Siyuan Wang's 2021 JGR paper.
Link: https://agupubs.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1029%2F2021JD035203&file=2021JD035203-sup-0001-Supporting+Information+SI-S01.pdf
FURAN + OH = 0.39 DIAL + 0.49 HO2 + 0.51 FURANO2

DIAL + OH = DIALO2
DIALO2 + NO = NO2 + 0.49 MALANHY + 0.96 HO2 + 0.04CH3O2
DIALO2 + NO2 = NONE
DIAL + hv = 0.74 DIALO2 + 0.74 HO2 + 0.34 CO

FURANO2 + NO = NO2 + FURANONE + 0.81 HO2 + 0.19CH3O2
FURANONE + OH = 0.69 MALANHY + 0.66 HO2 + 0.34CH3O2 + 0.43CO

FURAN + O3 = NONE % not included
FURAN + NO3 = NONE % not included
%}

SpeciesToAdd = {...
'FURAN'; 'DIAL'; 'FURANO2'; ...
'DIALO2'; 'MALANHY'; ...
'FURANONE'; ...
NONE;};

AddSpecies

% -----------------------------------------------------------------------------------------------------------------------
% SIYUAN mechanism: lumped furans as furan. It seems that SIYUAN modified the yield from mefruan chemical mechanism
% The rate constants are from Coggon's work but siyuan didn't mention which value he used (shoot an email to Siyuan for details!!!!!!!!!!!!!).
% -----------------------------------------------------------------------------------------------------------------------
i=i+1;
Rnames{i} = 'FURAN + OH = 0.39DIAL + 0.49HO2 + 0.51FURANO2';
k(:,i) = 4.2e-11;
Gstr{i,1} = 'FURAN'; Gstr{i,2} = 'OH'; 
fFURAN(i)=fFURAN(i)-1; fOH(i)=fOH(i)-1; fDIAL(i)=fDIAL(i)+0.39; fHO2(i)=fHO2(i)+0.49; fFURANO2(i)=fFURANO2(i)+0.51; 

i=i+1;
Rnames{i} = 'DIAL + OH = DIALO2';
k(:,i) = 5.20e-11;
Gstr{i,1} = 'DIAL'; Gstr{i,2} = 'OH'; 
fDIAL(i)=fDIAL(i)-1; fOH(i)=fOH(i)-1; fDIALO2(i)=fDIALO2(i)+1; 

i=i+1;
Rnames{i} = 'DIALO2 + NO = NO2 + 0.49MALANHY + 0.96HO2 + 0.04MO2';
k(:,i) = KAPNO;
Gstr{i,1} = 'DIALO2'; Gstr{i,2} = 'NO'; 
fDIALO2(i)=fDIALO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fMALANHY(i)=fMALANHY(i)+0.49; fHO2(i)=fHO2(i)+0.96; fMO2(i)=fMO2(i)+0.04;

i=i+1;
Rnames{i} = 'DIALO2 + NO2 = NONE';
k(:,i) = KFPAN;
Gstr{i,1} = 'DIALO2'; Gstr{i,2} = 'NO2'; 
fDIALO2(i)=fDIALO2(i)-1; fNO2(i)=fNO2(i)-1; fNONE(i)=fNONE(i)+1; 

i=i+1;
Rnames{i} = 'DIAL + hv = 0.74DIALO2 + 0.74HO2 + 0.34CO';
k(:,i) = JNO2.*0.098;
Gstr{i,1} = 'DIAL';
fDIAL(i)=fDIAL(i)-1; fDIALO2(i)=fDIALO2(i)+0.74; fHO2(i)=fHO2(i)+0.74; fCO(i)=fCO(i)+0.34

i=i+1;
Rnames{i} = 'FURANO2 + NO = NO2 + FURANONE + 0.81HO2 + 0.19MO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'FURANO2'; Gstr{i,2} = 'NO'; 
fFURANO2(i)=fFURANO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fFURANONE(i)=fFURANONE(i)+1; fHO2(i)=fHO2(i)+0.81; fMO2(i)=fMO2(i)+0.19;

i=i+1;
Rnames{i} = 'FURANONE + OH = 0.69MALANHY + 0.66HO2 + 0.34MO2 + 0.43CO';
k(:,i) = 4.45E-11;
Gstr{i,1} = 'FURANONE'; Gstr{i,2} = 'OH'; 
fFURANONE(i)=fFURANONE(i)-1; fOH(i)=fOH(i)-1; fMALANHY(i)=fMALANHY(i)+0.69; fHO2(i)=fHO2(i)+0.66; fMO2(i)=fMO2(i)+0.34; fCO(i)=fCO(i)+0.43;

