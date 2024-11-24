% -*- coding: utf-8 -*-
TEMPERATURE = 300;
T = TEMPERATURE;
M = 2.5E19;
% =========
% GEOS-Chem
% =========
disp('GEOS-Chem rate constants:')
disp('CH4');
disp('C2H2');
disp('C2H4');
disp('C2H6');
disp(1.40E-18); % C2H6

disp('PRPE');
disp(GCARR_ac(T, 4.59E-13, -1156.0)); % PRPE

disp('C3H8');

disp('ALK4');
disp(GCARR_ac(T, 2.80E-12, -3280.0)); % ALK4

disp('CH2O');
disp(5.80E-16);
disp('ALD2');
disp(GCARR_ac(T, 1.40E-12, -1900.0)); % CH3CHO/ALD2
disp('RCHO');
disp(6.50E-15); % RCHO

disp('GLYX');
disp(GC_GLYXNO3_ac(M,T, 1.40E-12, -1860.0)); % GLYX

disp('BENZ');
disp('TOLU');
disp('XYLE');

disp('HCOOH');
disp('Acetic acid');

% Isoprene, the total is supposed to be equal with ISOP
disp('Isoprene');
disp(GCARR_ac(T, 2.95E-12, 450.0)); % ISOP

disp('MTPA');
disp(GCARR_ac(T, 8.33E-13, 490.0)); % MTPA

disp('MACR');
disp(GCARR_ac(T, 1.80E-13, -1190.0)); % MACR
disp('MVK');
disp('MOH');
disp('EOH');
disp('ACET');
disp('MEK');
disp(8.00E-16); % MEK

disp('MGLY')
disp(GCARR_ac(T, 3.36E-12, -1860.0E0))
disp('PPN')
disp('HAC')
disp('IHN')

% ===
% MCM
% ===
disp('MCM rate constants:')
disp('CH4');
disp('C2H2');
disp('C2H4');
disp(3.3e-12.*exp(-2880./T)); % C2H4
disp('C2H6')

disp('C3H6');
disp(4.6e-13.*exp(-1155./T)); % C3H6

disp(3.2e-13.*exp(-950./T)); % BUT2ENE
disp(3.90e-13); % TBUT2ENE
disp(3.50e-13); % CBUT2ENE
disp(1.20e-14); % PENT1ENE 
disp(1.20e-14); % HEX1ENE

disp('C3H8');
disp('ALK4');

disp('CH2O');
disp(5.5e-16); % CH2O
disp('ALD2');
disp(1.4e-12.*exp(-1860./T)); % CH3CHO

disp('RCHO');
disp(3.24e-12.*exp(-1860./T)); % C2H5CHO
disp(1.7e-12.*exp(-1500./T)); % C3H7CHO
disp(1.67e-12.*exp(-1460./T)); % IPRCHO
disp(1.4e-12.*exp(-1860./T).*8.5); % BUT2CHO 
disp(1.4e-12.*exp(-1860./T).*5.5); % C5H11CHO
disp(1.4e-12.*exp(-1860./T).*5.5); % C6H13CHO

disp('GLYX');
disp(1.4e-12.*exp(-1860./T)); % GLYOX

disp('BENZ');
disp('TOLU');

disp('XYLE');
disp(4.10e-16); % OXYL
disp(2.60e-16); % MXYL
disp(1.20e-16); % EBENZ

disp('Formic acid');
disp('Acetic acid');

disp('Isoprene');
disp(3.15e-12.*exp(-450./T)); % ISOP

disp('MTPA');
disp(1.2e-12.*exp(490./T)); % APINENE
disp(2.51e-12); % BPINENE

disp('MACR');
disp(3.4e-15); % MACR
disp('MVK');
disp('MOH');
disp('EOH');

disp('ACET');
disp(2.60e-16); % ACET
disp('MEK');

