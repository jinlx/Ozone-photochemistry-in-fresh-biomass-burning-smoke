% ------------------------------------------------------------------------------------------------------------------------------------------
% L(HOx)/L(NOx)
% Reference
% - Sillman, Sanford, Jennifer A. Logan, and Steven C. Wofsy. "The sensitivity of ozone to nitrogen oxides and hydrocarbons in regional ozone episodes." Journal of Geophysical Research: Atmospheres 95.D2 (1990): 1837-1851.
% - Kleinman, Lawrence I. "Low and high NOx tropospheric photochemistry." Journal of Geophysical Research: Atmospheres 99.D8 (1994): 16831-16838.
% - Hu, Lu, et al. "Isoprene emissions and impacts over an ecological transition region in the US Upper Midwest inferred from tall tower measurements." Journal of Geophysical Research: Atmospheres 120.8 (2015): 3553-3571.
% ------------------------------------------------------------------------------------------------------------------------------------------
% NOx
NOxGroups = {'NOx_broad','NO','NO2', 'NO3', nHONO}; 
PlotRates(NOxGroups,S,1000,'sumEq',1,'unit','ppb_h','saveout', 1, '_NOx_broad_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_NOx_broad_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

% NOx
NOxGroups = {'NOxGroups','NO','NO2'}; 
PlotRates(NOxGroups,S,1000,'sumEq',1,'unit','ppb_h','saveout', 1, '_NOx_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_NOx_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

% ROx
ROxGroups = [{'ROx'};'OH';'HO2'; S.Cnames(S.Chem.iRO2)]; 
PlotRates(ROxGroups,S,1000,'sumEq',1,'unit','ppb_h','saveout', 1, '_ROx_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ROx_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

% DMS
PlotRates('DMS',S,1000,'sumEq',1,'unit','ppb_h','saveout', 1, '_DMS_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_DMS_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ------------------------------------------------------------------------------------------------------------------------------------------
% Ln/Q
% Reference
% - Kleinman, Lawrence I., et al. "Dependence of ozone production on NO and hydrocarbons in the troposphere." Geophysical Research Letters 24.18 (1997): 2299-2302.
% - Kleinman, Lawrence I. "The dependence of tropospheric ozone production rate on ozone precursors." Atmospheric Environment 39.3 (2005): 575-586.
% - Robinson, Michael A., et al. "Variability and time of day dependence of ozone photochemistry in western wildfire plumes." Environmental Science & Technology 55.15 (2021): 10280-10290.
% ------------------------------------------------------------------------------------------------------------------------------------------
% HNO3
PlotRates('HNO3',S,1000,'sumEq',1,'unit','ppb_h','saveout', 1, '_HNO3_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_HNO3_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% HNO4
PlotRates(nHNO4,S,1000,'sumEq',1,'unit','ppb_h','saveout', 1, '_HNO4_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_HNO4_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% PNs and ANs
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
ANsGroup = [{'Total ANs'}; ANs_names];
PNsGroup = [{'Total PNs'}; PNs_names];
PlotRates(PNsGroup,S,1000,'sumEq',1, 'unit', 'ppb_h', 'saveout', 1, '_PNs_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_PNs_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates(ANsGroup,S,1000,'sumEq',1, 'unit', 'ppb_h', 'saveout', 1, '_ANs_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ANs_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ------------------------------------------------------------------------------------------------------------------------------------------
% OPE
% Reference:
% 
% ------------------------------------------------------------------------------------------------------------------------------------------