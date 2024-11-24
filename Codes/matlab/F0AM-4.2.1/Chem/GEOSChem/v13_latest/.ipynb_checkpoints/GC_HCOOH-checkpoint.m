%{
Supporting information
Wang, Sainan, et al. "Aromatic photo-oxidation, a new source of atmospheric acidity." Environmental Science & Technology 54.13 (2020): 7798-7806.
See Table S3
%}
% ---- Begin F0AM Add Compounds code ----
%% Compound list
SpeciesToAdd = {'BRO2'; 'BROOH'; 'DIAL'; 'KETENOL'; 'DIALCO2H'; 'M1O2A'; 'M1O2B'; 'LBZFUONE'; 'MALANHYO2'; 'ACR'; 'KETENAL';};
AddSpecies

% ---------------------------------------------------
% JIN HCOOH mechanism, Based on WANG et al., 2020
% ---------------------------------------------------
%{
BRO2           = IGNORE; {C6H7O5; Peroxy radical from BENZ oxidation}
BROOH          = IGNORE; {C6H8O5; oxidation production from BRO2 reacts with HO2}
DIAL           = IGNORE; {Generic aldehdye products from furans oxidation including MALDIAL, C5DICARB, and C5DIALCO}
KETENOL        = IGNORE; {ketene-enol}
DIALCO2H       = IGNORE; {Generic organic acid products from furans oxidation including MALDALCO2H and C5CO14OH}
MALANHYO2      = IGNORE; {Oxidation product from MALANHY}
M1O2A          = IGNORE; {Check with Sainan}
M1O2B          = IGNORE; {Check with Sainan}
%}
i=i+1;
Rnames{i} = 'BRO2 + HO2 = BROOH';
k(:,i) = KRO2HO2.*0.770;
Gstr{i,1} = 'BRO2'; Gstr{i,2} = 'HO2'; 
fBRO2(i)=fBRO2(i)-1; fHO2(i)=fHO2(i)-1; fBROOH(i)=fBROOH(i)+1; 

i=i+1;
Rnames{i} = 'BROOH + hv = GLYX + 0.29DIAL + 0.37KETENOL + HO2 + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'BROOH'; 
fBROOH(i)=fBROOH(i)-1; fGLYX(i)=fGLYX(i)+1; fDIAL(i)=fDIAL(i)+0.29; fKETENOL(i)=fKETENOL(i)+0.37; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'DIAL + hv = 0.6LBZFUONE + 0.2MALANHYO2 + 0.2HO2 + 0.2ACR + 0.2CO';
k(:,i) = JNO2.*0.14;
Gstr{i,1} = 'DIAL'; 
fDIAL(i)=fDIAL(i)-1; fLBZFUONE(i)=fLBZFUONE(i)+0.6; fMALANHYO2(i)=fMALANHYO2(i)+0.2; fHO2(i)=fHO2(i)+0.2; fACR(i)=fACR(i)+0.2; fCO(i)=fCO(i)+0.2

i=i+1;
Rnames{i} = 'KETENOL + OH = 0.67DIALCO2H + 0.33HCOOH + 0.33KETENAL + 0.67HO2 + 0.33OH';
k(:,i) = 1.17E-10;
Gstr{i,1} = 'KETENOL'; Gstr{i,2} = 'OH'; 
fKETENOL(i)=fKETENOL(i)-1; fOH(i)=fOH(i)-1; fDIALCO2H (i)=fDIALCO2H (i)+0.67; fHCOOH(i)=fHCOOH(i)+0.33; fKETENAL(i)=fKETENAL(i)+0.33; fHO2(i)=fHO2(i)+0.67; fOH(i)=fOH(i)+0.33;

i=i+1;
Rnames{i} = 'KETENOL + O3 = 0.84GLYX + 0.84HCOOH + 0.16KETENAL + 0.84CO';
k(:,i) = 1.80E-15;
Gstr{i,1} = 'KETENOL'; Gstr{i,2} = 'O3'; 
fKETENOL(i)=fKETENOL(i)-1; fO3(i)=fO3(i)-1; fGLYX(i)=fGLYX(i)+0.84; fHCOOH(i)=fHCOOH(i)+0.84; fKETENAL(i)=fKETENAL(i)+0.16; fCO(i)=fCO(i)+0.84; 

i=i+1;
Rnames{i} = 'DIALCO2H + OH = 0.5M1O2A + 0.5M1O2B';
k(:,i) = 2.29E-11;
Gstr{i,1} = 'DIALCO2H'; Gstr{i,2} = 'OH'; 
fDIALCO2H(i)=fDIALCO2H(i)-1; fOH(i)=fOH(i)-1; fM1O2A(i)=fM1O2A(i)+0.5; fM1O2B(i)=fM1O2B(i)+0.5;

i=i+1;
Rnames{i} = 'M1O2B + NO = HCOOH + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'M1O2B'; Gstr{i,2} = 'NO'; 
fM1O2B(i)=fM1O2B(i)-1; fNO(i)=fNO(i)-1; fHCOOH(i)=fHCOOH(i)+1; fHO2(i)=fHO2(i)+1; 

