% %%%%%%%%%%%%%%%%%%%
% save the rxt rates
% %%%%%%%%%%%%%%%%%%%

% ========
% Radicals
% ========
% ---
% HO2
% ---
PlotRates('HO2',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'HO2_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_HO2_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ---
% OH
% ---
PlotRates('OH',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'OH_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_OH_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ---
% HOx
% ---
PlotRates({'HOx','OH','HO2'},S,1000,'sumEq',1,'ptype','line', 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'HOx_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_HOx_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ------------------------------
% RO2 radicals, including CH3O2
% ------------------------------
RO2_names = [{'allRO2'}; S.Cnames(S.Chem.iRO2)];
PlotRates(RO2_names,S,1000,'sumEq',1,'ptype','line', 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'RO2_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_RO2_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput); % do not forget to save out the figure otherwise it cannot be displayed

% -----
% CH3O2
% -----
PlotRates(nMO2,S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'MO2_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_MO2_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed