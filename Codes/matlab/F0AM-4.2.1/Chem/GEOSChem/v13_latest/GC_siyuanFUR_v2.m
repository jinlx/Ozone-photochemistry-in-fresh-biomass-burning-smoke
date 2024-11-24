%{
The following reactions are from Siyuan Wang's 2021 JGR paper.
Link: https://agupubs.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1029%2F2021JD035203&file=2021JD035203-sup-0001-Supporting+Information+SI-S01.pdf
This is based on coggon's analysis not sure why they are different from published version.
%}

SpeciesToAdd = {...
'FURAN'; 'DIAL'; 'FURANO2'; 'DIKET'; 'FURANPROD'; ...
'DIALO2'; 'MALANHY'; 'DIALPAN'; 'DIALOOH';  ...
'LBZFUONE'; 'FURANONE'; ...
'FURANOOH';};

AddSpecies

% -----------------------------------------------------------------------------------------------------------------------
% SIYUAN mechanism: lumped furans as furan. It seems that SIYUAN modified the yield from mefruan chemical mechanism
% The rate constants are from Coggon's work but siyuan didn't mention which value he used (shoot an email to Siyuan for details!!!!!!!!!!!!!).
% -----------------------------------------------------------------------------------------------------------------------
i=i+1;
Rnames{i} = 'FURAN + OH = 0.39DIAL + 0.49HO2 + 0.51FURANO2 + 0.02DIKET + 0.08FURANPROD';
k(:,i) = 5.01E-11;
Gstr{i,1} = 'FURAN'; Gstr{i,2} = 'OH'; 
fFURAN(i)=fFURAN(i)-1; fOH(i)=fOH(i)-1; fDIAL(i)=fDIAL(i)+0.39; fHO2(i)=fHO2(i)+0.49; fFURANO2(i)=fFURANO2(i)+0.51; fDIKET(i)=fDIKET(i)+0.02; fFURANPROD(i)=fFURANPROD(i)+0.08;

i=i+1;
Rnames{i} = 'DIAL + OH = DIALO2';
k(:,i) = 5.20e-11;
Gstr{i,1} = 'DIAL'; Gstr{i,2} = 'OH'; 
fDIAL(i)=fDIAL(i)-1; fOH(i)=fOH(i)-1; fDIALO2(i)=fDIALO2(i)+1; 

i=i+1;
Rnames{i} = 'DIALO2 + NO = NO2 + 0.49MALANHY + 0.72GLYX + 0.96HO2 + 0.04MO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'DIALO2'; Gstr{i,2} = 'NO'; 
fDIALO2(i)=fDIALO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fMALANHY(i)=fMALANHY(i)+0.49; fGLYX(i)=fGLYX(i)+0.72; fHO2(i)=fHO2(i)+0.96; fMO2(i)=fMO2(i)+0.04;

i=i+1;
Rnames{i} = 'DIALO2 + NO2 = DIALPAN';
k(:,i) = KFPAN;
Gstr{i,1} = 'DIALO2'; Gstr{i,2} = 'NO2'; 
fDIALO2(i)=fDIALO2(i)-1; fNO2(i)=fNO2(i)-1; fDIALPAN(i)=fDIALPAN(i)+1; 

i=i+1;
Rnames{i} = 'DIALO2 + HO2 = DIALOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'DIALO2'; Gstr{i,2} = 'HO2'; 
fDIALO2(i)=fDIALO2(i)-1; fHO2(i)=fHO2(i)-1; fDIALOOH(i)=fDIALOOH(i)+1; 

i=i+1;
Rnames{i} = 'DIALOOH + hv = 0.49MALANHY + 0.72GLYX + 0.96HO2 + 0.04MO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'DIALOOH';
fDIALOOH(i)=fDIALOOH(i)-1; fMALANHY(i)=fMALANHY(i)+0.49; fGLYX(i)=fGLYX(i)+0.72; fHO2(i)=fHO2(i)+0.96; fMO2(i)=fMO2(i)+0.04;

i=i+1;
Rnames{i} = 'DIALOOH + OH = DIALO2';
k(:,i) = 4.00E-11;
Gstr{i,1} = 'DIALOOH'; Gstr{i,2} = 'OH';
fDIALOOH(i)=fDIALOOH(i)-1; fOH(i)=fOH(i)-1; fDIALO2(i)=fDIALO2(i)+1;

i=i+1;
Rnames{i} = 'DIALPAN = DIALO2 + NO2';
k(:,i) = KBPAN;
Gstr{i,1} = 'DIALPAN';
fDIALPAN(i)=fDIALPAN(i)-1; fDIALO2(i)=fDIALO2(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'DIAL + hv = 0.74DIALO2 + 0.74HO2 + 0.26LBZFUONE + 0.34CO';
k(:,i) = JNO2.*0.098;
Gstr{i,1} = 'DIAL';
fDIAL(i)=fDIAL(i)-1; fDIALO2(i)=fDIALO2(i)+0.74; fHO2(i)=fHO2(i)+0.74; fLBZFUONE(i)=fLBZFUONE(i)+0.26; fCO(i)=fCO(i)+0.34

i=i+1;
Rnames{i} = 'FURANO2 + NO = NO2 + LBZFUONE + 0.81HO2 + 0.19MO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'FURANO2'; Gstr{i,2} = 'NO'; 
fFURANO2(i)=fFURANO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fLBZFUONE(i)=fLBZFUONE(i)+1; fHO2(i)=fHO2(i)+0.81; fMO2(i)=fMO2(i)+0.19;

i=i+1;
Rnames{i} = 'FURANO2 + HO2 = FURANOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'FURANO2'; Gstr{i,2} = 'HO2'; 
fFURANO2(i)=fFURANO2(i)-1; fHO2(i)=fHO2(i)-1; fFURANOOH(i)=fFURANOOH(i)+1;

i=i+1;
Rnames{i} = 'FURANOOH + hv = FURANONE + 0.81HO2 + 0.19MO2';
k(:,i) = JNO2;
Gstr{i,1} = 'FURANOOH';
fFURANOOH(i)=fFURANOOH(i)-1; fFURANONE(i)=fFURANONE(i)+1; fHO2(i)=fHO2(i)+0.81; fMO2(i)=fMO2(i)+0.19;

i=i+1;
Rnames{i} = 'FURANOOH + OH = FURANO2';
k(:,i) = 4.00E-11;
Gstr{i,1} = 'FURANOOH'; Gstr{i,2} = 'OH';
fFURANOOH(i)=fFURANOOH(i)-1; fOH(i)=fOH(i)-1; fFURANO2(i)=fFURANO2(i)+1;

i=i+1;
Rnames{i} = 'FURANONE + OH = 0.69MALANHY + 0.31GLYX + 0.66HO2 + 0.34MO2 + 0.43CO';
k(:,i) = 4.40E-11;
Gstr{i,1} = 'FURANOOH'; Gstr{i,2} = 'OH';
fFURANOOH(i)=fFURANOOH(i)-1; fOH(i)=fOH(i)-1; fMALANHY(i)=fMALANHY(i)+0.69; fGLYX(i)=fGLYX(i)+0.31; fHO2(i)=fHO2(i)+0.66; fMO2(i)=fMO2(i)+0.34; fCO5(i)=fCO(i)+0.43;