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
disp(GCARR_abc(T, 9.10E-15, 0.0, -2580.0)); % C2H4
disp('C2H6');
disp('PRPE');
disp(GCARR_ac(T, 5.50E-15, -1880.0)); % PRPE
disp('C3H8');
disp('ALK4');

disp('CH2O');
disp('ALD2');
disp('RCHO');
disp('GLYX');
disp('BENZ');
disp('TOLU');
disp('XYLE');
disp('HCOOH');
disp('Acetic acid');

% Isoprene, the total is supposed to be equal with ISOP
disp('Isoprene');
disp(1.3E-17); % ISOP
disp('MTPA');
disp(GCARR_ac(T, 5.00E-16, -530.0)); % MTPA
disp('MACR');
disp(GCARR_ac(T, 1.40E-15, -2100.0)); % MACR
disp('MVK');
disp(GCARR_ac(T, 8.50E-16, -1520.0)); % MVK
disp('MOH');
disp('EOH');
disp('ACET');
disp('MEK');

% ===
% MCM
% ===
disp('MCM rate constants:')
disp('CH4');
disp('C2H2');
disp('C2H4');
disp(9.1e-15.*exp(-2580./T)); % C2H4
disp('C2H6');
disp('C3H6');
disp(5.5e-15.*exp(-1880./T)); % C3H6
disp(3.55e-15.*exp(-1745./T)); % BUT1ENE
disp(6.64e-15.*exp(-1059./T)); % TBUT1ENE
disp(3.22e-15.*exp(-968./T)); % CBUT2ENE
disp(1.00e-17); % PENT1ENE 
disp(1.10e-17); % HEX1ENE

disp('C3H8');

disp('ALK4')

disp('CH2O');
disp('ALD2');
disp('RCHO');
disp('GLYX');
disp('BENZ');
disp('TOLU');
disp('XYLE');

disp('Formic acid');
disp(4.5e-13); % HCOOH
disp('Acetic acid');

disp('Isoprene');
disp(1.03e-14.*exp(-1995./T)); % ISOP

disp('MTPA');
disp(8.05e-16.*exp(-640./T)); % APINENE
disp(1.35e-15.*exp(-1270./T)); % BPINENE

disp('MACR');
disp(1.4e-15.*exp(-2100./T)); % MACR
disp('MVK');
disp(8.5e-16.*exp(-1520./T)); % MVK
disp('MOH');
disp('EOH');

disp('ACET');
disp('MEK');
