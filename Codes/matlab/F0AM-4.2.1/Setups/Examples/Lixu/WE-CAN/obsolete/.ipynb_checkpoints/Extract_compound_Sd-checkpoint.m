% In order to speed up python analysis scripts, we want to extract compounds beforehand before dive into deeper analysis.
% The current version only works for MCMv331 mechanism.
% Load data
%MECHANISM  = 'MCMv331_extension';
MECHANISM = 'GCv13_base';
Flight_ID  = 'RF03';

%data = load(['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/WE-CAN/output_data/', 'WECAN_', MECHANISM, Flight_ID, '.mat']);
%S = data.S;
% ============
% Extract data
% ============
% -------------
% NOy compounds
% -------------
% This section is for compounds both exist in MCM and GEOS-Chem but with different names
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
        % PNs, including PAN
        PNs = SearchSMILES('peroxyNitrate',Sd.Cnames,'v331'); %peroxy nitrates
        iPNs    = PNs.index;
        PNs     = ExtractSpecies(iPNs,S);
        PNs_names = fieldnames(PNs);

        % ANs
        ANs = SearchSMILES('alkylNitrate',Sd.Cnames,'v331'); %alkyl nitrates
        iANs    = ANs.index;
        ANs     = ExtractSpecies(iANs,Sd);
        ANs_names = fieldnames(ANs);

        % otherNOy
        otherNOy_names = {'NO', 'NO2', 'NO3', 'N2O5', 'HONO', 'HNO3', 'HO2NO2'};
        otherNOy =  ExtractSpecies(otherNOy_names,Sd);
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        % PNs, including PAN
        PNs_names = {'BZPAN', 'ETHLN', ...
                     'HONIT', 'ICN', 'IDN', 'IHN1', 'IHN2', 'IHN3', 'INPB', 'INPD' ,'IPRNO3', 'ITCN', 'ITHN', ...
                     'MCRHN', 'MCRHNB', 'MENO3', 'MONITS', 'MONITU', 'MPAN', 'MVKN', 'NPRNO3', 'PAN', 'PPN'};
        PNs = ExtractSpecies(PNs_names,Sd);
        
        % ANs
        ANs_names = {'ETHLN', 'HONIT', ...
                     'ICN', 'IDN', 'IHN1', 'IHN2', 'IHN3', 'INPB', 'INPD', 'IPRNO3', 'ITCN', 'ITHN', ...
                     'MCRHN', 'MCRHNB', 'MENO3', 'MONITS', 'MONITU', 'MPAN', 'MVKN', 'NPRNO3', ...
                     'PAN', 'PPN', 'PROPNN', 'R4N2'};
        ANs = ExtractSpecies(ANs_names,Sd);

        % otherNOy
        otherNOy_names = {'NO', 'NO2', 'NO3', 'N2O5', 'HNO2', 'HNO3', 'HNO4'};
        otherNOy =  ExtractSpecies(otherNOy_names,Sd);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end


% --------------------------
% VOC OHR calcualtion
% --------------------------
% --------------------------
% Radicals
% --------------------------
% HOx radicals
HOx = ExtractSpecies({'OH', 'HO2'}, Sd);

% RO2 radicals, including CH3O2
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
        RO2spec = ExtractSpecies(Sd.iRO2,Sd);
        RO2_names  = fieldnames(RO2spec);
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        RO2_names = {'MO2', 'A3O2', 'AROMRO2', 'ATO2', 'BRO2', ...
                     'BZCO3', 'C4HVP1', 'C4HVP2', ...
                     'ETOO', 'ETO2', 'HPALD1OO', 'HPALD2OO', ...
                     'ICHOO', 'ICNOO', 'IDHNBOO', 'IDHNDOO1', 'IDHNDOO2', ... 
                     'IEPOXAOO', 'IEPOXBOO', 'IHOO1', 'IHOO4', 'IHPNBOO', 'IHPNDOO', ...
                     'IHPOO1', 'IHPOO2', 'IHPOO3', 'INO2B', 'INO2D', ...
                     'ISOPNOO1', 'ISOPNOO2', ...
                     'KO2', 'LIMO2', 'MACR1OO', ...
                     'MCROHOO', 'MVKOHOO', 'NRO2', ...
                     'OTHRO2', 'PIO2', 'PO2', 'PRN1', 'R4N1', 'R4O2', 'TRO2', 'XRO2'};
        RO2spec = ExtractSpecies(RO2_names, Sd);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end


% =============================
% Put into a similar structure
% =============================
%% NOy
Extract.PNs = PNs;
Extract.PNs_names = PNs_names;
Extract.ANs = ANs;
Extract.ANs_names = ANs_names;
Extract.otherNOy = otherNOy;
Extract.otherNOy_names = otherNOy_names;

% + magic_args="Data of interest"
Extract.Initcompounds = DataOfInterest;
Extract.Initcompounds_names = InitFields;

% + magic_args="HOx"
Extract.HOx = HOx;
Extract.HOx_names = {'OH', 'HO2'};

% + magic_args="RO2"
Extract.RO2 = RO2spec;
Extract.RO2_names = RO2_names;
% -

% ==================
% Save out the data
% ==================
fileoutput = ['./output_data/WECAN_extract_', MECHANISM, Flight_ID];
save(fileoutput,'Extract')

% Applied to other flights, mechanisms, and Sd as well.
