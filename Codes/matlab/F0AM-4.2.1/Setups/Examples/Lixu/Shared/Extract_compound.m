% In order to speed up python analysis scripts, we want to extract compounds beforehand before dive into deeper analysis.
% Note: Might want to have HYDFURANONE in the future, or might not.
% ============
% Extract data
% ============
% ---------------------------------------
% Furans, furfurals, and maleic anhydride
% ---------------------------------------
% This section is for compounds both exist in MCM and GEOS-Chem but with different names
switch MECHANISM
    case {'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        % Furanss
        Furans_names = {'Furans'};
        Furans = ExtractSpecies(Furans_names,S);
        Furans_names = fieldnames(Furans);
        
        % Furfurals
        Furfurals_names = {'Furfurals'};
        Furfurals = ExtractSpecies(Furfurals_names,S);
        Furfurals_names = fieldnames(Furfurals);
        
        % Maleic anhydride
        MALANHY_names = {'MALANHY'};
        MALANHY      = ExtractSpecies(MALANHY_names,S);
        MALANHY_names= fieldnames(MALANHY);
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        % Furans
        Furans_names = {'FURAN', 'M2FURAN', 'DIMEFURAN'};
        Furans = ExtractSpecies(Furans_names,S);
        Furans_names = fieldnames(Furans);
        
        % Furfurals
        Furfurals_names = {'FURFURAL', 'MEFURFURAL'};
        Furfurals = ExtractSpecies(Furfurals_names,S);
        Furfurals_names = fieldnames(Furfurals);

        % Maleic anhydride
        MALANHY_names = {'MALANHY'};
        MALANHY      = ExtractSpecies(MALANHY_names,S);
        MALANHY_names= fieldnames(MALANHY);

        % HYDFURANONE
        %HFURCO2H_names = {'MALDALCO2H', 'C5CO14OH'};
end


% -------------
% NOy compounds
% -------------
% This section is for compounds both exist in MCM and GEOS-Chem but with different names
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
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
% NOy
NOy_single = {'NO', 'NO2', 'NO3', nHONO, 'N2O5', 'HNO3', nHNO4}; 
NOy_names  = cat(2, NOy_single, ANs_names', PNs_names');
NOy = ExtractSpecies(NOy_names,S);
NOy_names = fieldnames(NOy);
% NOz
NOz_single = {'NO3', 'N2O5', nHONO, 'HNO3', nHNO4}; 
NOz_names =  cat(2, NOz_single, ANs_names', PNs_names');
NOz = ExtractSpecies(NOz_names,S);
NOz_names = fieldnames(NOz);
% NOx
NOx_names = {'NO', 'NO2'};
NOx = ExtractSpecies(NOx_names,S);

% -------------
% Criegees
% -------------
% This section is for compounds both exist in MCM and GEOS-Chem but with different names
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}        
        CRs       = SearchSMILES('criegee',S.Cnames,'v331'); %Criegee intermediates (produced from ozono-lysis of VOCs)
        iCRs      = CRs.index;
        CRs       = ExtractSpecies(iCRs,S);
        CRs_names = fieldnames(CRs);
        
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}        
        CRs_names = {'CH2OO', 'CH3CHOO'};
        CRs = ExtractSpecies(CRs_names,S);
        CRs_names = fieldnames(CRs);

    case {'GCv13_MCM_missing'}
        % MCM
        CRs_MCM = SearchSMILES('criegee',S.Cnames,'v331'); %Criegee intermediates (produced from ozono-lysis of VOCs)
        iCRs_MCM    = CRs_MCM.index;
        CRs_MCM     = ExtractSpecies(iCRs_MCM,S);
        CRs_names_MCM = fieldnames(CRs_MCM);
        
        % GEOS-Chem
        %CRs_names_GC = {'CH2OO', 'CH3CHOO'}; %Both are included in the GEOS-Chem
        CRs_names = CRs_names_MCM;
        % extract the data based on the names and recreate the names 
        CRs = ExtractSpecies(CRs_names,S);        
        CRs_names = fieldnames(CRs);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end

%{
% --------
% Xylenes
% --------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        XYLE_names = {'PXYL', 'OXYL', 'EBENZ'};
        XYLE = ExtractSpecies(XYLE_names,S);
        XYLE_names = fieldnames(XYLE);
        
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        XYLE_names = {'XYLE'};
        XYLE = ExtractSpecies(XYLE_names,S);
        XYLE_names = fieldnames(XYLE);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
% -------------------
% Lumped C>=3 alkenes
% -------------------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PRPE_names = {'C3H6', 'BUT1ENE', 'TBUT2ENE', 'CBUT2ENE', 'HEX1ENE'};
        PRPE = ExtractSpecies(PRPE_names,S);
        PRPE_names = fieldnames(PRPE);
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        PRPE_names = {'PRPE'};
        PRPE = ExtractSpecies(PRPE_names,S);
        PRPE_names = fieldnames(PRPE);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
% ------------------------------------------------------
% Lumped C>=4 alkanes
% Can fill in more in the MCM for a better understanding
% ------------------------------------------------------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        ALK4_names = {'IC4H10', 'NC5H12', 'IC5H12', 'NC6H14', 'M3PE', 'M22C4', 'NC7H16', 'NC8H18', 'NC9H20'};
        ALK4 = ExtractSpecies(ALK4_names,S);
        ALK4_names = fieldnames(ALK4);
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        ALK4_names = {'ALK4'};
        ALK4 = ExtractSpecies(ALK4_names,S);
        ALK4_names = fieldnames(ALK4);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
% ---------------------
% Lumped C>=3 aldehydes
% ---------------------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        RCHO_names = {'C2H5CHO', 'C3H7CHO', 'IPRCHO', 'BUT2CHO', 'C5H11CHO', 'C6H13CHO'};
        RCHO = ExtractSpecies(RCHO_names,S);
        RCHO_names = fieldnames(RCHO);
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_v2', 'GCv13_JINF_HCOOH'}
        RCHO_names = {'RCHO'};
        RCHO = ExtractSpecies(RCHO_names,S);
        RCHO_names = fieldnames(RCHO);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
% ---------------------
% Monoterpenes
% ---------------------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        MTPA_names = {'APINENE', 'BPINENE'};
        MTPA = ExtractSpecies(MTPA_names,S);
        MTPA_names = fieldnames(MTPA);
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        MTPA_names = {'MTPA'};
        MTPA = ExtractSpecies(MTPA_names,S);
        MTPA_names = fieldnames(MTPA);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
%}

% ----------------------------------------------------
% data of interest
% including data used to initialize the model
% ----------------------------------------------------
InitFields = fieldnames(S.InitConc);
DataOfInterest = ExtractSpecies(InitFields,S);
InitFields = fieldnames(DataOfInterest);

% --------------------------------------------------------------------------
% VOC OHR calcualtion
% Be careful about the main script to avoid including reactivity beyond NMHC
% VOCR misses two datapoints (ongoing...)
% --------------------------------------------------------------------------
% This run here just in case any changes in main script would impact the results.
PlotReactivity('OH',S,InitNMVOC_names,'cmapname', 'jet', 'saveout', 1, 'VOCR_', Flight_ID, MECHANISM, FixNOx_postfix);

name = 'VOCR_';
switch Flight_ID
    case {'RF03', 'RF07', 'RF09'}
        data_VOCR = load(['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/WE-CAN/output_data/Reactivity', name, MECHANISM, '_', FixNOx_postfix, Flight_ID]);
        VOCR = data_VOCR.OHR;
        VOCR_names = data_VOCR.lnames;
    case {'FN06', 'FN19'}
        data_VOCR = load(['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/output_data/Reactivity', name, MECHANISM, '_', FixNOx_postfix, Flight_ID]);
        VOCR = data_VOCR.OHR;
        VOCR_names = data_VOCR.lnames;
    case {'P3B'}
        data_VOCR = load(['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/P-3B/output_data/Reactivity', name, MECHANISM, '_', FixNOx_postfix, Flight_ID]);
        VOCR = data_VOCR.OHR;
        VOCR_names = data_VOCR.lnames;
    otherwise
        error(['Invalid flight "' flight '".'])
end

% --------------------------
% Radicals
% --------------------------
%% HOx radicals
HOx = ExtractSpecies({'OH', 'HO2'}, S);
HOx_names = fieldnames(HOx);

%% RO2 radicals, including CH3O2
RO2spec = ExtractSpecies(S.iRO2,S);
RO2_names  = fieldnames(RO2spec);

%% MO2
MO2 = ExtractSpecies({nMO2},S);
MO2_names  = fieldnames(MO2);

%% MCO3
MCO3 = ExtractSpecies({nMCO3},S);
MCO3_names  = fieldnames(MCO3);

% =============================
% Put into a similar structure
% =============================
%% Furans, Furfurals, and maleic anhydride (this is only when we used the GEOS-Chem + FUR)
% In test...
switch MECHANISM
    case {'GCv13_JINF', 'GCv13_JINF_HCOOH', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        % Furans
        Extract.Furans = Furans;
        Extract.Furans_names = Furans_names;
        
        % Furfurals
        Extract.Furfurals = Furfurals;
        Extract.Furfurals_names = Furfurals_names;     

        % Maleic anhydride
        Extract.MALANHY       = MALANHY;
        Extract.MALANHY_names = MALANHY_names;
end

%% NOy
Extract.PNs = PNs;
Extract.PNs_names = PNs_names;

Extract.ANs = ANs;
Extract.ANs_names = ANs_names;

Extract.NOy = NOy;
Extract.NOy_names = NOy_names;

Extract.NOz = NOz;
Extract.NOz_names = NOz_names;

Extract.NOx = NOx;
Extract.NOx_names = NOx_names;

%% criegee
Extract.CRs = CRs;
Extract.CRs_names = CRs_names;

%{
%% Xylenes
Extract.XYLE = XYLE;
Extract.XYLE_names = XYLE_names;
%% PRPE
Extract.PRPE = PRPE;
Extract.PRPE_names = PRPE_names;
%% ALK4
Extract.ALK4 = ALK4;
Extract.ALK4_names = ALK4_names;
%% RCHO
Extract.RCHO = RCHO;
Extract.RCHO_names = RCHO_names;
%% MTPA
Extract.MTPA = MTPA;
Extract.MTPA_names = MTPA_names;
%}


%% Data of interest
Extract.Initcompounds = DataOfInterest;
Extract.Initcompounds_names = InitFields;

%% VOCR
Extract.VOCR = VOCR;
Extract.VOCR_names = VOCR_names;

%% HOx
Extract.HOx = HOx;
Extract.HOx_names = HOx_names;

%% RO2
Extract.RO2 = RO2spec;
Extract.RO2_names = RO2_names;

%% MO2
Extract.MO2 = MO2;
Extract.MO2_names = MO2_names;

%% MCO3
Extract.MCO3 = MCO3;
Extract.MCO3_names = MCO3_names;

%% Time 
Extract.Time = S.Time;

% ==========================================================
% Calculate dilution-corrected conc for extract data
% ==========================================================
% calculate normalized excess mixing ratios: delta_X_dil = delta_X * delta_CO_source/delta_CO
% this is standard procedure for biomass burning plumes.
% We will also put these into a new structure compatible with F0AM plotting routines.
delta_CO = S.Conc.CO - S.BkgdConc.CO(1);
fCO = delta_CO(starting_point)./delta_CO;

% names, shared varaibles
%% Furans, Furfurals, and maleic anhydride (this is only when we used the GEOS-Chem + FUR)
switch MECHANISM
    case {'GCv13_JINF', 'GCv13_JINF_HCOOH', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        Extract_dil.Furans_names = Extract.Furans_names;
        Extract_dil.Furfurals_names = Extract.Furfurals_names;
        Extract_dil.MALANHY_names = Extract.MALANHY_names;
end

%% NOy
Extract_dil.PNs_names = Extract.PNs_names; 
Extract_dil.ANs_names = Extract.ANs_names;
Extract_dil.NOy_names = Extract.NOy_names;
Extract_dil.NOz_names = Extract.NOz_names;
Extract_dil.NOx_names = Extract.NOx_names;

%{
%% Lumped VOCs
Extract_dil.XYLE_names = Extract.XYLE_names;
Extract_dil.PRPE_names = Extract.PRPE_names;
Extract_dil.ALK4_names = Extract.ALK4_names;
Extract_dil.RCHO_names = Extract.RCHO_names;
Extract_dil.MTPA_names = Extract.MTPA_names;
%}


%% criegee
Extract_dil.CRs_names = Extract.CRs_names;

%% Data of interest, not sure why I set the value for initcompounds here.
%Extract_dil.Initcompounds = Extract.Initcompounds;
Extract_dil.Initcompounds_names = Extract.Initcompounds_names;

%% VOCR
%Extract_dil.VOCR = Extract.VOCR;
Extract_dil.VOCR_names = Extract.VOCR_names;


%% HOx
Extract_dil.HOx_names = Extract.HOx_names;

%% RO2
Extract_dil.RO2_names = Extract.RO2_names;

%% MO2
Extract_dil.MO2_names = Extract.MO2_names;

%% MCO3
Extract_dil.MCO3_names = Extract.MCO3_names;

%% Time
Extract_dil.Time = Extract.Time;

% concentrations, Loop to calcualte the dilution-corrected values
%% Furans, Furfurals, maleic anhydride (this is only when we used the GEOS-Chem + FUR)
switch MECHANISM
    case {'GCv13_JINF', 'GCv13_JINF_HCOOH', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        for i=1:length(Extract_dil.Furans_names)
            name = Extract_dil.Furans_names{i};
            if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
            else b = 0;
            end
            Extract_dil.Furans.(name) = (Extract.Furans.(name) - b).*fCO;
        end
        for i=1:length(Extract_dil.Furfurals_names)
            name = Extract_dil.Furfurals_names{i};
            if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
            else b = 0;
            end
            Extract_dil.Furfurals.(name) = (Extract.Furfurals.(name) - b).*fCO;
        end
        for i=1:length(Extract_dil.MALANHY_names)
            name = Extract_dil.MALANHY_names{i};
            if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
            else b = 0;
            end
            Extract_dil.MALANHY.(name) = (Extract.MALANHY.(name) - b).*fCO;
        end
end



% PNs
for i=1:length(Extract_dil.PNs_names)
    name = Extract_dil.PNs_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.PNs.(name) = (Extract.PNs.(name) - b).*fCO;
end
% ANs
for i=1:length(Extract_dil.ANs_names)
    name = Extract_dil.ANs_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.ANs.(name) = (Extract.ANs.(name) - b).*fCO;
end
% NOy
for i=1:length(Extract_dil.NOy_names)
    name = Extract_dil.NOy_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.NOy.(name) = (Extract.NOy.(name) - b).*fCO;
end


% NOz
for i=1:length(Extract_dil.NOz_names)
    name = Extract_dil.NOz_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.NOz.(name) = (Extract.NOz.(name) - b).*fCO;
end
% NOx
for i=1:length(Extract_dil.NOx_names)
    name = Extract_dil.NOx_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.NOx.(name) = (Extract.NOx.(name) - b).*fCO;
end

%{
% XYLE
for i=1:length(Extract_dil.XYLE_names)
    name = Extract_dil.XYLE_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.XYLE.(name) = (Extract.XYLE.(name) - b).*fCO;
end
% PRPE
for i=1:length(Extract_dil.PRPE_names)
    name = Extract_dil.PRPE_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.PRPE.(name) = (Extract.PRPE.(name) - b).*fCO;
end
% ALK4
for i=1:length(Extract_dil.ALK4_names)
    name = Extract_dil.ALK4_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.ALK4.(name) = (Extract.ALK4.(name) - b).*fCO;
end
% RCHO
for i=1:length(Extract_dil.RCHO_names)
    name = Extract_dil.RCHO_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.RCHO.(name) = (Extract.RCHO.(name) - b).*fCO;
end
% MTPA
for i=1:length(Extract_dil.MTPA_names)
    name = Extract_dil.MTPA_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.MTPA.(name) = (Extract.MTPA.(name) - b).*fCO;
end
%}

% criegees
for i=1:length(Extract_dil.CRs_names)
    name = Extract_dil.CRs_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.CRs.(name) = (Extract.CRs.(name) - b).*fCO;
end

% Data of interest
for i=1:length(Extract_dil.Initcompounds_names)
    name = Extract_dil.Initcompounds_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.Initcompounds.(name) = (Extract.Initcompounds.(name) - b).*fCO;
end


% VOCR
for i=1:length(Extract_dil.VOCR_names)
    name = Extract_dil.VOCR_names{i};
    %if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    %else b = 0;
    %end
    b = 0;
    Extract_dil.VOCR(:, i) = (Extract.VOCR(:, i)).*fCO; % Errors arise due to the inconsistent data size in fco and Extract.VOCR(:,1)
end

% HOx
for i=1:length(Extract_dil.HOx_names)
    name = Extract_dil.HOx_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.HOx.(name) = (Extract.HOx.(name) - b).*fCO;
end

% RO2
for i=1:length(Extract_dil.RO2_names)
    name = Extract_dil.RO2_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.RO2.(name) = (Extract.RO2.(name) - b).*fCO;
end

% MO2
for i=1:length(Extract_dil.MO2_names)
    name = Extract_dil.MO2_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.MO2.(name) = (Extract.MO2.(name) - b).*fCO;
end

% MCO3
for i=1:length(Extract_dil.MCO3_names)
    name = Extract_dil.MCO3_names{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Extract_dil.MCO3.(name) = (Extract.MCO3.(name) - b).*fCO;
end


% ==========================================================
% Calculate CO normalized
% ==========================================================
% calculate normalized excess mixing ratios: delta_X_co = delta_X/delta_CO
% this is standard procedure for biomass burning plumes.
% We will also put these into a new structure compatible with F0AM plotting routines.
fCO = 1./delta_CO;

% names, shared varaibles
%% Furans and Furfurals (this is only when we used the GEOS-Chem + FUR)
switch MECHANISM
    case {'GCv13_JINF', 'GCv13_JINF_HCOOH', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        Extract_conorm.Furans_names = Extract.Furans_names;
        Extract_conorm.Furfurals_names = Extract.Furfurals_names;
        Extract_conorm.MALANHY_names = Extract.MALANHY_names; 
end


%% NOy
Extract_conorm.PNs_names = Extract.PNs_names; 
Extract_conorm.ANs_names = Extract.ANs_names;
Extract_conorm.NOy_names = Extract.NOy_names;
Extract_conorm.NOz_names = Extract.NOz_names;
Extract_conorm.NOx_names = Extract.NOx_names;

%{
%% lumped VOCs
Extract_conorm.XYLE_names = Extract.XYLE_names; 
Extract_conorm.PRPE_names = Extract.PRPE_names; 
Extract_conorm.ALK4_names = Extract.ALK4_names; 
Extract_conorm.RCHO_names = Extract.RCHO_names; 
Extract_conorm.MTPA_names = Extract.MTPA_names; 
%}

%% criegee
Extract_conorm.CRs_names = Extract.CRs_names;

%% Data of interest, not sure why I set the value for initcompounds here.
%Extract_conorm.Initcompounds = Extract.Initcompounds;
Extract_conorm.Initcompounds_names = Extract.Initcompounds_names;

%% VOCR
%Extract_conorm.VOCR = Extract.VOCR;
Extract_conorm.VOCR_names = Extract.VOCR_names;


%% HOx
Extract_conorm.HOx_names = Extract.HOx_names;

%% RO2
Extract_conorm.RO2_names = Extract.RO2_names;

%% MO2
Extract_conorm.MO2_names = Extract.MO2_names;

%% MCO3
Extract_conorm.MCO3_names = Extract.MCO3_names;

%% Time
Extract_conorm.Time = Extract.Time;

% concentrations, Loop to calcualte the dilution-corrected values
%% Furans, Furfurals, and maleic anhydride (this is only when we used the GEOS-Chem + FUR)
switch MECHANISM
    case {'GCv13_JINF', 'GCv13_JINF_HCOOH', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        for i=1:length(Extract_conorm.Furans_names)
            name = Extract_conorm.Furans_names{i};
            Extract_conorm.Furans.(name) = (Extract.Furans.(name)).*fCO;
        end
        for i=1:length(Extract_conorm.Furfurals_names)
            name = Extract_conorm.Furfurals_names{i};
            Extract_conorm.Furfurals.(name) = (Extract.Furfurals.(name)).*fCO;
        end
        for i=1:length(Extract_conorm.MALANHY_names)
            name = Extract_conorm.MALANHY_names{i};
            Extract_conorm.MALANHY.(name) = (Extract.MALANHY.(name)).*fCO;
        end        
end

% PNs
for i=1:length(Extract_conorm.PNs_names)
    name = Extract_conorm.PNs_names{i};
    Extract_conorm.PNs.(name) = (Extract.PNs.(name)).*fCO;
end
% ANs
for i=1:length(Extract_conorm.ANs_names)
    name = Extract_conorm.ANs_names{i};
    Extract_conorm.ANs.(name) = (Extract.ANs.(name)).*fCO;
end
% NOy
for i=1:length(Extract_conorm.NOy_names)
    name = Extract_conorm.NOy_names{i};
    Extract_conorm.NOy.(name) = (Extract.NOy.(name)).*fCO;
end
% NOz
for i=1:length(Extract_conorm.NOz_names)
    name = Extract_conorm.NOz_names{i};
    Extract_conorm.NOz.(name) = (Extract.NOz.(name)).*fCO;
end
% NOx
for i=1:length(Extract_conorm.NOx_names)
    name = Extract_conorm.NOx_names{i};
    Extract_conorm.NOx.(name) = (Extract.NOx.(name)).*fCO;
end

%{
% XYLE
for i=1:length(Extract_conorm.XYLE_names)
    name = Extract_conorm.XYLE_names{i};
    Extract_conorm.XYLE.(name) = (Extract.XYLE.(name)).*fCO;
end
% PRPE
for i=1:length(Extract_conorm.PRPE_names)
    name = Extract_conorm.PRPE_names{i};
    Extract_conorm.PRPE.(name) = (Extract.PRPE.(name)).*fCO;
end
% ALK4
for i=1:length(Extract_conorm.ALK4_names)
    name = Extract_conorm.ALK4_names{i};
    Extract_conorm.ALK4.(name) = (Extract.ALK4.(name)).*fCO;
end
% RCHO
for i=1:length(Extract_conorm.RCHO_names)
    name = Extract_conorm.RCHO_names{i};
    Extract_conorm.RCHO.(name) = (Extract.RCHO.(name)).*fCO;
end
% MTPA
for i=1:length(Extract_conorm.MTPA_names)
    name = Extract_conorm.MTPA_names{i};
    Extract_conorm.MTPA.(name) = (Extract.MTPA.(name)).*fCO;
end
%}

% criegees
for i=1:length(Extract_conorm.CRs_names)
    name = Extract_conorm.CRs_names{i};
    Extract_conorm.CRs.(name) = (Extract.CRs.(name)).*fCO;
end

% Data of interest
for i=1:length(Extract_conorm.Initcompounds_names)
    name = Extract_conorm.Initcompounds_names{i};
    Extract_conorm.Initcompounds.(name) = (Extract.Initcompounds.(name)).*fCO;
end

% VOCR
for i=1:length(Extract_conorm.VOCR_names)
    name = Extract_conorm.VOCR_names{i};
    Extract_conorm.VOCR(:, i) = (Extract.VOCR(:, i)).*fCO;
end

% HOx
for i=1:length(Extract_conorm.HOx_names)
    name = Extract_conorm.HOx_names{i};
    Extract_conorm.HOx.(name) = (Extract.HOx.(name)).*fCO;
end

% RO2
for i=1:length(Extract_conorm.RO2_names)
    name = Extract_conorm.RO2_names{i};
    Extract_conorm.RO2.(name) = (Extract.RO2.(name)).*fCO;
end

% MO2
for i=1:length(Extract_conorm.MO2_names)
    name = Extract_conorm.MO2_names{i};
    Extract_conorm.MO2.(name) = (Extract.MO2.(name)).*fCO;
end

% MCO3
for i=1:length(Extract_conorm.MCO3_names)
    name = Extract_conorm.MCO3_names{i};
    Extract_conorm.MCO3.(name) = (Extract.MCO3.(name)).*fCO;
end

% ==================
% Save out the data
% ==================
switch Flight_ID
    case {'RF03', 'RF07', 'RF09'}
        % Extract
        fileoutput = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/WE-CAN/output_data/WECAN_extract_', MECHANISM, '_', FixNOx_postfix, Flight_ID];
        save(fileoutput,'Extract')
        % Extract dilution
        fileoutput = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/WE-CAN/output_data/WECAN_dilution_corrected_extract_', MECHANISM, '_', FixNOx_postfix, Flight_ID];
        save(fileoutput,'Extract_dil')
        % Extract CO normalized
        fileoutput = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/WE-CAN/output_data/WECAN_co_normalized_corrected_extract_', MECHANISM, '_', FixNOx_postfix, Flight_ID];
        save(fileoutput,'Extract_conorm')

    case {'FN06', 'FN19'}
        % Extract
        fileoutput = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/output_data/FIREXAQ_extract_', MECHANISM, '_', FixNOx_postfix, Flight_ID];
        save(fileoutput,'Extract')
        % Extract dilution
        fileoutput = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/output_data/FIREXAQ_dilution_corrected_extract_', MECHANISM, '_', FixNOx_postfix, Flight_ID];
        save(fileoutput,'Extract_dil')
        % Extract CO normalized
        fileoutput = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/output_data/FIREXAQ_co_normalized_corrected_extract_', MECHANISM, '_', FixNOx_postfix, Flight_ID];
        save(fileoutput,'Extract_conorm')
        
    case {'P3B'}
        % Extract
        fileoutput = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/P-3B/output_data/FIREX_LGPlume_extract_', MECHANISM, '_', FixNOx_postfix, Flight_ID];
        save(fileoutput,'Extract')
        % Extract dilution
        fileoutput = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/P-3B/output_data/FIREX_LGPlume_dilution_corrected_extract_', MECHANISM, '_', FixNOx_postfix, Flight_ID];
        save(fileoutput,'Extract_dil')
        % Extract CO normalized
        fileoutput = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/P-3B/output_data/FIREX_LGPlume_co_normalized_corrected_extract_', MECHANISM, '_', FixNOx_postfix, Flight_ID];
        save(fileoutput,'Extract_conorm')
    otherwise
        error(['Invalid flight "' flight '".'])
end




