% Supporting Information for Nighttime aircraft intercepts of biomass burning plumes: observations and box model analysis
% Newland, Mike J., et al. "Photochemistry of 2-butenedial and 4-oxo-2-pentenal under atmospheric boundary layer conditions." Physical Chemistry Chemical Physics 21.3 (2019): 1160-1171.
% Wang, Sainan, et al. "Aromatic photo-oxidation, a new source of atmospheric acidity." Environmental Science & Technology 54.13 (2020): 7798-7806.
% See Table S3
% Wang, Sainan, et al. "Aromatic photo-oxidation, a new source of atmospheric acidity." Environmental Science & Technology 54.13 (2020): 7798-7806
% Bates, Kelvin H., et al. "Development and evaluation of a new compact mechanism for aromatic oxidation in atmospheric models." Atmospheric Chemistry and Physics 21.24 (2021): 18351-18374.

% Paulot, F., et al. "Isoprene photooxidation: new insights into the production of acids and organic nitrates." Atmospheric Chemistry and Physics 9.4 (2009): 1479-1501.


% ---- Begin F0AM Add Compounds code ----
%% Compound list
SpeciesToAdd = {...
'KETENOL'; 'KETB'; 'KETENAL'; 'M1O2A'; 'M1C2O2'; 'M1O2B';'MALANHYONO2'; 'CO2'};


RO2ToAdd = {...
 };
 
AddSpecies
 
%% Reactions list
i=i+1;
Rnames{i} = 'BZBIPERO = GLYOX + KETENOL + HO2';
k(:,i) = KDEC.*0.37;
Gstr{i,1} = 'BZBIPERO'; 
fBZBIPERO(i)=fBZBIPERO(i)-1; fGLYOX(i)=fGLYOX(i)+1; fKETENOL(i)=fKETENOL(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'BZBIPERO = GLYOX + MALDIAL + HO2';
k(:,i) = KDEC.*0.63;
Gstr{i,1} = 'BZBIPERO'; 
fBZBIPERO(i)=fBZBIPERO(i)-1; fGLYOX(i)=fGLYOX(i)+1; fMALDIAL(i)=fMALDIAL(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIAL + hv = 0.8KETENOL + 0.2CO + 0.2ACR';
k(:,i) = J4.*0.14;
Gstr{i,1} = 'MALDIAL'; 
fMALDIAL(i)=fMALDIAL(i)-1; fKETENOL(i)=fKETENOL(i)+0.8; fCO(i)=fCO(i)+0.2; fACR(i)=fACR(i)+0.2; 

i=i+1;
Rnames{i} = 'KETENOL = BZFUONE';
k(:,i) = 2.9E-3;
Gstr{i,1} = 'KETENOL'; 
fKETENOL(i)=fKETENOL(i)-1; fBZFUONE(i)=fBZFUONE(i)+1;

i=i+1;
Rnames{i} = 'KETENOL = KETB';
k(:,i) = 0.9E-3;
Gstr{i,1} = 'KETENOL'; 
fKETENOL(i)=fKETENOL(i)-1; fKETB(i)=fKETB(i)+1;

i=i+1;
Rnames{i} = 'MALANHYO2 + HO2 = MALANHY + HO2 + OH ';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'MALANHYO2'; Gstr{i,2} = 'HO2'; 
fMALANHYO2(i)=fMALANHYO2(i)-1; fHO2(i)=fHO2(i)-1; fMALANHY(i)=fMALANHY(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MALANHYO2 + NO = 0.85MALANHY + 0.85NO2 + 0.85HO2 + 0.15MALANHYONO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'MALANHYO2'; Gstr{i,2} = 'NO'; 
fMALANHYO2(i)=fMALANHYO2(i)-1; fNO(i)=fNO(i)-1; fMALANHY(i)=fMALANHY(i)+0.85; fNO2(i)=fNO2(i)+0.85; fHO2(i)=fHO2(i)+0.85; fMALANHYONO2(i)=fMALANHYONO2(i)+0.15;

% assuming rate constant is K14ISOM1, double check!!!!
i=i+1;
Rnames{i} = 'MALANHYO2 = MALANHY + HO2';
k(:,i) = K14ISOM1;
Gstr{i,1} = 'MALANHYO2'; 
fMALANHYO2(i)=fMALANHYO2(i)-1; fMALANHY(i)=fMALANHY(i)+1; fHO2(i) = fHO2(i)+1;

i=i+1;
Rnames{i} = 'KETENOL + OH = MALDALCO2H + HO2';
k(:,i) = 7.52E-11;
Gstr{i,1} = 'KETENOL'; Gstr{i,2} = 'OH'; 
fKETENOL(i)=fKETENOL(i)-1; fOH(i)=fOH(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fHO2(i) = fHO2(i)+1;

i=i+1;
Rnames{i} = 'KETENOL + OH = HCOOH + KETENAL + OH';
k(:,i) = 4.27E-11;
Gstr{i,1} = 'KETENOL'; Gstr{i,2} = 'OH'; 
fKETENOL(i)=fKETENOL(i)-1; fOH(i)=fOH(i)-1; fHCOOH(i)=fHCOOH(i)+1; fKETENAL(i) = fKETENAL(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'KETENOL + O3 = KETENAL + OH + HO2';
k(:,i) = 1.8E-15*0.13;
Gstr{i,1} = 'KETENOL'; Gstr{i,2} = 'O3'; 
fKETENOL(i)=fKETENOL(i)-1; fO3(i)=fO3(i)-1; fKETENAL(i)=fKETENAL(i)+1; fOH(i) = fOH(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'KETENOL + O3 = GLYOX + CO + HCOOH';
k(:,i) = 1.8E-15*0.69;
Gstr{i,1} = 'KETENOL'; Gstr{i,2} = 'O3'; 
fKETENOL(i)=fKETENOL(i)-1; fO3(i)=fO3(i)-1; fGLYOX(i)=fGLYOX(i)+1; fCO(i) = fCO(i)+1; fHCOOH(i)=fHCOOH(i)+1;

i=i+1;
Rnames{i} = 'KETENOL + O3 = KETENAL + OH + HO2';
k(:,i) = 1.8E-15*0.03;
Gstr{i,1} = 'KETENOL'; Gstr{i,2} = 'O3'; 
fKETENOL(i)=fKETENOL(i)-1; fO3(i)=fO3(i)-1; fKETENAL(i)=fKETENAL(i)+1; fOH(i) = fOH(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'KETENOL + O3 = HCOOH + GLYOX + CO';
k(:,i) = 1.8E-15*0.15;
Gstr{i,1} = 'KETENOL'; Gstr{i,2} = 'O3'; 
fKETENOL(i)=fKETENOL(i)-1; fO3(i)=fO3(i)-1; fHCOOH(i)=fHCOOH(i)+1; fGLYOX(i) = fGLYOX(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'KETENAL + OH = GLYOX + OH';
k(:,i) = 1.0E-12;
Gstr{i,1} = 'KETENAL'; Gstr{i,2} = 'OH'; 
fKETENAL(i)=fKETENAL(i)-1; fOH(i)=fOH(i)-1; fGLYOX(i)=fGLYOX(i)+1; fOH(i) = fOH(i)+1;

% where is M1O2B? Double check!!!
i=i+1;
Rnames{i} = 'MALDALCO2H + OH = M1O2A';
k(:,i) = 3.7E-11*0.62;
Gstr{i,1} = 'MALDALCO2H'; Gstr{i,2} = 'OH'; 
fMALDALCO2H(i)=fMALDALCO2H(i)-1; fOH(i)=fOH(i)-1; fM1O2A(i)=fM1O2A(i)+1; 

i=i+1;
Rnames{i} = 'MALDALCO2H + OH = C32OH13CO + OH';
k(:,i) = 3.7E-11*0.38;
Gstr{i,1} = 'MALDALCO2H'; Gstr{i,2} = 'OH'; 
fMALDALCO2H(i)=fMALDALCO2H(i)-1; fOH(i)=fOH(i)-1; fC32OH13CO(i)=fC32OH13CO(i)+1; fOH(i)=fOH(i)+1;

% replaced M1C2O2 to HCOOH + OH, double check!!!
i=i+1;
Rnames{i} = 'M1O2A + NO = GLYOX + HO2 + HCOOH + OH';
k(:,i) = KRO2NO;
Gstr{i,1} = 'M1O2A'; Gstr{i,2} = 'NO'; 
fM1O2A(i)=fM1O2A(i)-1; fNO(i)=fNO(i)-1; fGLYOX(i)=fGLYOX(i)+1; fHO2(i)=fHO2(i)+1; fHCOOH(i)=fHCOOH(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'M1O2B + NO = HCOOH + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'M1O2B'; Gstr{i,2} = 'NO'; 
fM1O2B(i)=fM1O2B(i)-1; fNO(i)=fNO(i)-1; fHCOOH(i)=fHCOOH(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'HOCH2CHO + OH = 0.732HCHO + 0.361CO2 + 0.505CO + 0.227OH + 0.773HO2 + 0.134GLYOX + 0.134HCOOH';
k(:,i) = GC_GLYCOH_A_a(T, 8.00E-12);
Gstr{i,1} = 'HOCH2CHO'; Gstr{i,2} = 'OH'; 
fHOCH2CHO(i)=fHOCH2CHO(i)-1; fOH(i)=fOH(i)-1; fHCHO(i)=fHCHO(i)+0.732; fCO2(i)=fCO2(i)+0.361; fCO(i)=fCO(i)+0.505; fOH(i)=fOH(i)+0.227; fHO2(i)=fHO2(i)+0.773; fGLYOX(i)=fGLYOX(i)+0.134; fHCOOH(i)=fHCOOH(i)+0.134; 

i=i+1;
Rnames{i} = 'ACETOL + OH = 0.500HCOOH + OH + 0.500CH3CO2H + 0.500CO2 + 0.500CO + 0.500CH3O2';
k(:,i) = GC_HACOH_B_ac(T, 2.15E-12, 305.0);
Gstr{i,1} = 'ACETOL'; Gstr{i,2} = 'OH'; 
fACETOL(i)=fACETOL(i)-1; fOH(i)=fOH(i)-1; fHCOOH(i)=fHCOOH(i)+0.500; fOH(i)=fOH(i)+1; fCH3CO2H(i)=fCH3CO2H(i)+0.500; fCO2(i)=fCO2(i)+0.500; fCO(i)=fCO(i)+0.500; fCH3O2(i)=fCH3O2(i)+0.500;


%END OF REACTION LIST
