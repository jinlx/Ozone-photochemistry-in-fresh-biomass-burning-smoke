% %%%%%%%%%%%%%
% Load the data
% %%%%%%%%%%%%%
%S_noFUR = load('pltrateOxGoups_MCMv331_noFURP3B.mat');
%S_FUR = load('pltrateOxGoups_MCMv331_baseP3B.mat');

%S_noFUR = load('pltrateOxGoups_MCMv331_noFURRF03.mat');
%S_FUR = load('pltrateOxGoups_MCMv331_baseRF03.mat');

%S_noFUR = load('pltrateOxGoups_MCMv331_noFURRF07.mat');
%S_FUR = load('pltrateOxGoups_MCMv331_baseRF07.mat');

S_noFUR = load('pltrateOxGoups_MCMv331_noFURRF09.mat');
S_FUR = load('pltrateOxGoups_MCMv331_baseRF09.mat');

%S_noFUR = load('pltrateOxGoups_MCMv331_noFURFN06.mat');
%S_FUR = load('pltrateOxGoups_MCMv331_baseFN06.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Provide the O3 budget for two different mechanisms 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Non-furans
disp(S_noFUR.Pnames');
disp(mean(S_noFUR.Prod,1));
Prate_noFUR = sum(mean(S_noFUR.Prod,1));
disp(Prate_noFUR);

disp(S_noFUR.Lnames');
disp(mean(S_noFUR.Loss,1));
Lrate_noFUR = sum(mean(S_noFUR.Loss,1));
disp(Lrate_noFUR);

% Furans
disp(S_FUR.Pnames');
disp(mean(S_FUR.Prod,1));
Prate_FUR = sum(mean(S_FUR.Prod,1));
disp(Prate_FUR);

disp(S_FUR.Lnames');
disp(mean(S_FUR.Loss,1));
Lrate_FUR = sum(mean(S_FUR.Loss,1));
disp(Lrate_FUR);

disp(['O3 production rate change (ppb/s) is ', num2str((Prate_FUR-Prate_noFUR)/Prate_noFUR.*100)]);
disp(['O3 loss rate change (ppb/s) is ', num2str((Lrate_FUR-Lrate_noFUR)/Lrate_noFUR.*100)]);
disp(['The net production (ppb/s) is ', num2str(Prate_FUR + Lrate_FUR)]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the O3 production rates 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

