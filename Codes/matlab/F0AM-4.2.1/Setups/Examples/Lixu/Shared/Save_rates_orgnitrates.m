% %%%%%%%%%%%%%%%%%%%
% save the rxt rates
% %%%%%%%%%%%%%%%%%%%
% -----------
% PNs and ANs
% -----------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        % PNs, including PAN
        PNs = SearchSMILES('peroxyNitrate',S.Cnames,'v331'); %peroxy nitrates
        iPNs    = PNs.index;
        PNs     = ExtractSpecies(iPNs,S);
        PNs_names = fieldnames(PNs);
        % ANs
        ANs = SearchSMILES('alkylNitrate',S.Cnames,'v331'); %alkyl nitrates
        iANs    = ANs.index;
        ANs     = ExtractSpecies(iANs,S);
        ANs_names = fieldnames(ANs);
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_v2', 'GCv13_JINF_HCOOH'}
        % PNs, including PAN
        PNs_names = {'MPN'; 'BZPAN'; 'INPB'; 'INPD'; 'MPAN'; 'PAN'; 'PPN'};
        PNs = ExtractSpecies(PNs_names,S);
        PNs_names = fieldnames(PNs);
        % ANs
        ANs_names = {'ETHLN'; 'HONIT'; ...
                     'ICN'; 'IDN'; 'IHN1'; 'IHN2'; 'IHN3'; 'IPRNO3'; 'ITCN'; 'ITHN'; ...
                     'MCRHN'; 'MCRHNB'; 'MENO3'; 'MONITS'; 'MONITU'; 'MVKN'; 'NPRNO3'; ...
                     'PROPNN'; 'R4N2'};
        ANs = ExtractSpecies(ANs_names,S);
        ANs_names = fieldnames(ANs);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
ANsGroup = [{'ANs'}; ANs_names];
PNsGroup = [{'PNs'}; PNs_names];
% save out rates for PNs and ANs group
% PNs
PlotRates(PNsGroup,S,1000,'sumEq',1,'ptype','line', 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'PNs_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_PNs_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ANs
PlotRates(ANsGroup,S,1000,'sumEq',1,'ptype','line', 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'ANs_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ANs_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

% ---
% PAN
% ---
PlotRates('PAN',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'PAN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_PAN_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

PlotRates(nMCO3,S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'CH3CO3_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_CH3CO3_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

% ---
% PPN
% ---
PlotRates('PPN',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'PPN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_PPN_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed


% --------------------------------------------------
% NOy
% NO, NO2, NO3, N2O5, HNO3, HNO4, PAN, PPN, PNs, ANs
% --------------------------------------------------
NOy_single = {'NOy', 'NO', 'NO2', 'NO3', 'HNO3', nHNO4}; % halogen is not included
NOy_total  = cat(2, NOy_single, ANs_names', PNs_names');
% save out rates for Ox group
PlotRates(NOy_total,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'NOy_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_NOy_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed


% ------------------------------------------
% NOz
% NO3, N2O5, HNO3, HNO4, PAN, PPN, PNs, ANs
% -----------------------------------------
NOz_single = {'NOz', 'NO3', 'HNO3', nHNO4}; % halogen is not included
NOz_total  = cat(2, NOy_single, ANs_names', PNs_names');
% save out rates for Ox group
PlotRates(NOz_total,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'NOz_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_NOz_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

% ---------------------
% other important PNs
% in fresh smoke plumes
% ---------------------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PlotRates('CH3O2NO2',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'MPN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_MPN_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        
        PlotRates('ACRPAN',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'ACRPAN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_ACRPAN_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        
        PlotRates('PHAN',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'PHAN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_PHAN_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        
        PlotRates('MALDIALPAN',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'MALDIALPAN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_PPN_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    otherwise
        % No action for mechanisms not listed above
end



