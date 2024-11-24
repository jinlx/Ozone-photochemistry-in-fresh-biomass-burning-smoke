% %%%%%%%%%%%%%
% Load the data
% %%%%%%%%%%%%%
%S_FUR= load('FIREX_LGPlume_dilution_correctedMCMv331_baseP-3B.mat');
%S_noFUR = load('FIREX_LGPlume_dilution_correctedMCMv331_noFURP3B.mat');

%S_FUR= load('WECAN_dilution_correctedMCMv331_baseRF03.mat');
%S_noFUR = load('WECAN_dilution_correctedMCMv331_noFURRF03.mat');

S_FUR= load('FIREXAQ_dilution_correctedMCMv331_baseFN19.mat');
S_noFUR = load('FIREXAQ_dilution_correctedMCMv331_noFURFN19.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Provide the O3 budget for two different mechanisms 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Non-furans
FUR_HO2_conc   = S_FUR.Sd.Conc.HO2;
noFUR_HO2_conc = S_noFUR.Sd.Conc.HO2;


FUR_HO2_conc_TS = mean(FUR_HO2_conc);
noFUR_HO2_conc_TS = mean(noFUR_HO2_conc);

abs_diff = FUR_HO2_conc_TS - noFUR_HO2_conc_TS;
rel_diff = (FUR_HO2_conc_TS - noFUR_HO2_conc_TS)./noFUR_HO2_conc_TS*100;

disp(abs_diff);
disp(rel_diff);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the O3 production rates 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

