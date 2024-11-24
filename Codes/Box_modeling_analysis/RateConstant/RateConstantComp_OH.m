TEMPERATURE = 300;
T = TEMPERATURE;
M = 2.5E19;
% =========
% GEOS-Chem
% =========
disp('GEOS-Chem rate constants:')
disp('NO');
disp(GCJPLPR_abab(M, T, 7.00E-31, 2.6E+00, 3.60E-11, 0.1E0, 0.6E0));
disp('NO2');
disp(GCJPLPR_aba(M, T, 1.80E-30, 3.0E+00, 2.8E-11, 0.6E0));

disp('CH4');
disp(GCARR_ac(T, 2.45E-12, -1775.0)); % CH4
disp('C2H2');
disp(GCJPLPR_abab(M, T, 5.50E-30, 0.0, 8.3E-13, -2.0, 0.5)); % C2H2
disp('C2H4');
disp(GCJPLPR_abab(M, T, 1.10E-28, 3.5E+00, 8.4E-12, 1.75, 0.5)); % C2H4
disp('C2H6');
disp(GCARR_ac(T, 7.66E-12, -1020.0)); % C2H6

disp('PRPE');
disp(GCJPLPR_abab(M, T, 4.60E-27, 4.0, 2.6E-11, 1.3, 0.5)); % PRPE

disp('C3H8');
disp(GC_TBRANCH_2_acabc(T, 7.60E-12, -585.0, 5.87, 0.64, -816.0)); % C3H8
disp(GC_TBRANCH_2_acabc(T, 7.60E-12, -585.0, 1.7E-1, -0.64, 816.0)); % C3H8

disp('ALK4');
disp(GCARR_ac(T, 9.10E-12, -405.0)); % ALK4

disp('CH2O');
disp(GCARR_ac(T, 5.50E-12, 125.0)); % CH2O
disp('ALD2');
disp(GCARR_ac(T, 4.63E-12, 350.0)); % CH3CHO/ALD2
disp('RCHO');
disp(GCARR_ac(T, 6.00E-12, 410.0)); % RCHO

disp('GLYX');
disp(GCARR_ac(T, 3.10E-12, 340.0)); % GLYX

disp('BENZ');
disp(GCARR_abc(T, 2.3E-12, 0.0, -193.0)); % BENZ
disp('TOLU');
disp(GCARR_abc(T, 1.8E-12, 0.0, 340.0)); % TOLU
disp('XYLE');
disp(1.7E-11); % XYLE

disp('HCOOH');
disp(4.00E-13); % HCOOH
disp('Acetic acid');
disp(GCARR_ac(T, 3.15E-14, 920.0)); % ACTA

% Isoprene, the total is supposed to be equal with ISOP
disp('Isoprene');
disp(GC_ISO1(T, 1.7E-11, 3.90E2, 9.33E-2, 5.05E15, -1.22E4, 1.79E14, -8.830E3)); % ISOP
disp(GC_ISO1(T, 1.0E-11, 3.90E2, 2.26E-1, 2.22E9, -7.160E3, 1.75E14, -9.054E3)); % ISOP
disp(GC_ISO2(T, 1.7E-11, 3.90E2, 9.33E-2, 5.05E15, -1.22E4, 1.79E14, -8.830E3)); % ISOP
disp(GC_ISO2(T, 1.0E-11, 3.90E2, 2.26E-1, 2.22E9, -7.160E3, 1.75E14, -9.054E3)); % ISOP

disp('MTPA');
disp(GCARR_ac(T, 1.21E-11, 440.0)); % MTPA

disp('MACR');
disp(GCARR_ac(T, 4.40E-12, 380.0)); % MACR
disp('MVK');
disp(GCARR_ac(T, 2.60E-12, 610.0)); % MVK
disp('MOH');
disp(GCARR_ac(T, 2.90E-12, -345.0)); % MOH
disp('EOH');
disp(3.35E-12); % EOH
disp('ACET');
disp(1.33E-13 + 3.82E-11.*exp(-2000./T)); % ACET
disp('MEK');
disp(GCARR_ac(T, 1.30E-12, -25.0)); % MEK


disp('GLYC');
disp(GC_GLYCOH_A_a(T, 8.00E-12) + GC_GLYCOH_B_a(T, 8.00E-12));
disp('DMS');
disp(GCARR_ac(T, 1.20E-11, -280.0));
disp('HAC');
disp(GC_HACOH_A_ac(T, 2.15E-12, 305.0) + GC_HACOH_B_ac(T, 2.15E-12, 305.0))



disp('BALD');
disp(GCARR_abc(T, 5.90E-12, 0.0, 225.0));

disp('PHEN');
disp(GCARR_abc(T, 4.70E-13, 0.0, 1220.0));

% ===
% MCM
% ===
disp('MCM rate constants:')

disp('NO');
K70 = 7.4e-31.*M.*(T./300).^-2.4 ;
K7I = 3.3e-11.*(T./300).^-0.3 ;
KR7 = K70./K7I ;
FC7 = 0.81 ;
NC7 = 0.75-1.27.*(log10(FC7)) ;
F7 = 10.^(log10(FC7)./(1+(log10(KR7)./NC7).^2)) ;
KMT07 = (K70.*K7I).*F7./(K70+K7I) ;
disp(KMT07);

disp('NO2');
K80 = 3.2e-30.*M.*(T./300).^-4.5 ;
K8I = 3e-11 ;
KR8 = K80./K8I ;
FC8 = 0.41 ;
NC8 = 0.75-1.27.*(log10(FC8)) ;
F8 = 10.^(log10(FC8)./(1+(log10(KR8)./NC8).^2));
KMT08 = (K80.*K8I).*F8./(K80+K8I) ;
disp(KMT08);

disp('CH4');
disp(1.85e-12.*exp(-1690./TEMPERATURE)); % CH4
disp('C2H2');
K170 = 5.0e-30.*M.*(T./300).^-1.5 ;
K17I = 1.0e-12 ;
KR17 = K170./K17I ;
FC17 = 0.17.*exp(-51./T)+exp(-T./204) ;
NC17 = 0.75-1.27.*(log10(FC17)) ;
F17 = 10.^(log10(FC17)./(1.0+(log10(KR17)./NC17).^2)) ;
KMT17 = (K170.*K17I.*F17)./(K170+K17I);
disp(KMT17);

% C2H2
disp('C2H4');
K150 = 8.6e-29.*M.*(T./300).^-3.1 ;
K15I = 9.0e-12.*(T./300).^-0.85 ;
KR15 = K150./K15I ;
FC15 = 0.48 ;
NC15 = 0.75-1.27.*(log10(FC15)) ;
F15 = 10.^(log10(FC15)./(1+(log10(KR15)./NC15).^2)) ;
KMT15 = (K150.*K15I).*F15./(K150+K15I) ;
disp(KMT15); % C2H4

disp('C2H6')
disp(6.9e-12.*exp(-1000./T)); % C2H6

disp('C3H6');
K160 = 8e-27.*M.*(T./300).^-3.5 ;
K16I = 3.0e-11.*(T./300).^-1 ;
KR16 = K160./K16I ;
FC16 = 0.5 ;
NC16 = 0.75-1.27.*(log10(FC16)) ;
F16 = 10.^(log10(FC16)./(1+(log10(KR16)./NC16).^2)) ;
KMT16 = (K160.*K16I).*F16./(K160+K16I) ;
disp(KMT16); % C3H6

disp(6.6e-12.*exp(465./T)); % BUT1ENE
disp(1.01e-11.*exp(550./T)); % TBUT1ENE
disp(1.10e-11.*exp(487./T)); % CBUT2ENE
disp(5.86e-12.*exp(500./T)); % PENT1ENE 
disp(3.70e-11); % HEX1ENE

disp('C3H8');
disp(7.6e-12.*exp(-585./T)); % C3H8

disp('ALK4')
disp(9.8e-12.*exp(-425./T)); % NC4H10
disp(1.16e-17.*T.^2.*exp(225./T)); % IC4H10
disp(2.44e-17.*T.^2.*exp(183./T)); % NC5H12
disp(3.70e-12); % IC5H12
disp(1.53e-17.*T.^2.*exp(414./T)); % NC6H14
disp(5.40e-12); % M3PE
disp(3.22e-11.*exp(-781./T)); % M22C4
disp(1.59e-17.*T.^2.*exp(478./T)); % NC7H16
disp(2.76e-17.*T.^2.*exp(378./T)); % NC8H18
disp(2.51e-17.*T.^2.*exp(447./T)); % NC9H20
disp(3.13e-17.*T.^2.*exp(416./T)); % NC10H22
disp(1.29e-11); % NC11H24

disp('CH2O');
disp(5.4e-12.*exp(135./T)); % CH2O
disp('ALD2');
disp(4.7e-12.*exp(345./T)); % CH3CHO

disp('RCHO');
disp(4.9e-12.*exp(405./T)); % C2H5CHO
disp(6.0e-12.*exp(410./T)); % C3H7CHO
disp(6.8e-12.*exp(410./T)); % IPRCHO
disp(2.69e-11); % BUT2CHO 
disp(2.88e-11); % C5H11CHO
disp(3.05e-11); % C6H13CHO

disp('GLYX');
disp(3.1e-12.*exp(340./T)); % GLYOX

disp('BENZ');
disp(2.3e-12.*exp(-190./T)); % BENZENE
disp('TOLU');
disp(1.8e-12.*exp(340./T)); % TOLUENE

disp('XYLE');
disp(1.36e-11); % OXYL
disp(2.31e-11); % MXYL
disp(7.00e-12); % EBENZ

disp('Formic acid');
disp(4.5e-13); % HCOOH
disp('Acetic acid');
disp(8.00e-13); % CH3COOH

disp('Isoprene');
disp(2.70e-11.*exp(390./T)); % ISOP

disp('MTPA');
disp(1.2e-11.*exp(440./T)); % APINENE
disp(2.38e-11.*exp(357./T)); % BPINENE

disp('MACR');
disp(8.0e-12.*exp(380./T)); % MACR
disp('MVK');
disp(2.6e-12.*exp(610./T)); % MVK
disp('MOH');
disp(2.85e-12.*exp(-345./T)); % MOH
disp('EOH');
disp(3.0e-12.*exp(20./T)); % EOH

disp('ACET');
disp(5.7e-12.*exp(-215./T)); % ACET
disp('MEK');
disp(1.5e-12.*exp(-90./T)); % MEK