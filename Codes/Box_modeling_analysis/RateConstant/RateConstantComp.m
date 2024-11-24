% MCM 
% HO2NO2 
TEMPERATURE = 300;
T = TEMPERATURE;
M = 2.5E19;
K100 = 4.10e-05.*M.*exp(-10650./T) ;
K10I = 6.0e+15.*exp(-11170./T) ;
KR10 = K100./K10I ;
FC10 = 0.4 ;
NC10 = 0.75-1.27.*(log10(FC10)) ;
F10 = 10.^(log10(FC10)./(1+(log10(KR10)./NC10).^2)) ;
krx = (K100.*K10I).*F10./(K100+K10I) ;
disp('HO2NO2');
disp(krx);


% H2 + O2-> HO2, MCM doesn't include it.




% GEOS-Chem
% HNO4
krx = GCJPLPR_abcabc(M,T, 9.05d-05, 3.4d0, -10900.0d0, 1.90d15, 0.3d0, -10900.0d0, 0.6d0);
disp('HO2NO2');
disp(krx);
