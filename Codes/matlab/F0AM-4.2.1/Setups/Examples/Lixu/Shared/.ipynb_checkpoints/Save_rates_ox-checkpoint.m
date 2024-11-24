% --
% O3
% --
% O3
PlotRates('O3',S,1000,'sumEq',1, 'unit', 'ppb_h', 'saveout', 1, '_O3_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_O3_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

% ---
% Ox
% --
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

% Ox
OxGroups_tmp = {'Ox', 'O3', 'O', 'O1D', 'NO2', '2*NO3', '3*N2O5', 'HNO3', nHNO4}; % halogen is not included
OxGroups_Wang = cat(2, OxGroups_tmp, ANs_names', PNs_names');
PlotRates(OxGroups_Wang,S,1000,'sumEq',1, 'unit', 'ppb_h', 'saveout', 1, '_Ox_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_Ox_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

%{
% ---------------------------
% Ox production and loss rate
% ---------------------------
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
        % CRs
        CRs = SearchSMILES('criegee',S.Cnames,'v331'); %Criegee intermediates (produced from ozono-lysis of VOCs)
        iCRs    = CRs.index;
        CRs     = ExtractSpecies(iCRs,S);
        CRs_names = fieldnames(CRs);
        %HNO4
        nHNO4 = 'HO2NO2';
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        % PNs, including PAN
        PNs_names = {'MPN', 'BZPAN', 'INPB', 'INPD', 'MPAN', 'PAN', 'PPN'};
        PNs = ExtractSpecies(PNs_names,S);
        PNs_names = fieldnames(PNs);
        % ANs
        ANs_names = {'ETHLN', 'HONIT', ...
                     'ICN', 'IDN', 'IHN1', 'IHN2', 'IHN3', 'IPRNO3', 'ITCN', 'ITHN', ...
                     'MCRHN', 'MCRHNB', 'MENO3', 'MONITS', 'MONITU', 'MVKN', 'NPRNO3', ...
                     'PROPNN', 'R4N2'};
        ANs = ExtractSpecies(ANs_names,S);
        ANs_names = fieldnames(ANs);
        % CRs
        CRs_names = {'CH2OO', 'CH3CHOO'};
        CRs = ExtractSpecies(CRs_names,S);
        CRs_names = fieldnames(CRs);
        %HNO4
        nHNO4 = 'HNO4';
    case {'GCv13_MCM_missing'}
        % ------------------
        % PNs, including PAN
        % ------------------
        % combine MCM and GC to get PNs_names
        PNs_MCM = SearchSMILES('peroxyNitrate',S.Cnames,'v331'); %peroxy nitrates
        iPNs_MCM    = PNs_MCM.index;
        PNs_MCM     = ExtractSpecies(iPNs_MCM,S);
        PNs_names_MCM = fieldnames(PNs_MCM);
        PNs_names_GC = {'MPN', 'BZPAN', 'INPB', 'INPD'}; % 'MPAN', 'PAN', 'PPN' is not added as it is included in the MCM
        PNs_names = [PNs_names_MCM', PNs_names_GC];
        % extract the data based on the names and recreate the names 
        PNs = ExtractSpecies(PNs_names,S);
        PNs_names = fieldnames(PNs);
        % ---
        % ANs
        % ---
        ANs_MCM = SearchSMILES('alkylNitrate',S.Cnames,'v331'); %alkyl nitrates
        iANs_MCM    = ANs_MCM.index;
        ANs_MCM     = ExtractSpecies(iANs_MCM,S);
        ANs_names_MCM = fieldnames(ANs_MCM);
        ANs_names_GC = {'ETHLN', 'HONIT', ...
                        'ICN', 'IDN', 'IHN1', 'IHN2', 'IHN3', 'IPRNO3', 'ITCN', 'ITHN', ...
                        'MCRHN', 'MCRHNB', 'MENO3', 'MONITS', 'MONITU', 'MVKN', 'NPRNO3', ...
                        'PROPNN', 'R4N2'};
        ANs_names = [ANs_names_MCM', ANs_names_GC];
        % extract the data based on the names and recreate the names 
        ANs = ExtractSpecies(ANs_names,S);
        ANs_names = fieldnames(ANs);
        % ---
        % CRs
        % ---
        CRs_MCM = SearchSMILES('criegee',S.Cnames,'v331'); %Criegee intermediates (produced from ozono-lysis of VOCs)
        iCRs_MCM    = CRs_MCM.index;
        CRs_MCM     = ExtractSpecies(iCRs_MCM,S);
        CRs_names_MCM = fieldnames(CRs_MCM);        
        %CRs_names_GC = {'CH2OO', 'CH3CHOO'}; %Both are included in the GEOS-Chem
        CRs_names = CRs_names_MCM;
        % extract the data based on the names and recreate the names 
        CRs = ExtractSpecies(CRs_names,S);        
        CRs_names = fieldnames(CRs);
        % ----
        % HNO4
        % ----
        HNO4_names = {'HNO4', 'HO2NO2'};
        HNO4 = ExtractSpecies(HNO4_names,S);        
        HNO4_names = fieldnames(HNO4);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end


% ===
% Ox
% ===
OxGroups_tmp = {'Ox', 'O3', 'O', 'O1D', 'NO2', '2*NO3', '3*N2O5', 'HNO3', nHNO4}; % halogen is not included
OxGroups_Wang = cat(2, OxGroups_tmp, ANs_names', PNs_names');
OxGroups_Bate = cat(2, OxGroups_Wang, CRs_names');
% save out rates for Ox group
PlotRates(OxGroups_Bate,S,1000,'sumEq',1,'ptype','line', 'saveout', 1, 'unit', 'ppb_h', 'plotme', 0, 'O3_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_O3_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
disp('done, save out the production rate')
% save out rates for ANs and PNs
%}