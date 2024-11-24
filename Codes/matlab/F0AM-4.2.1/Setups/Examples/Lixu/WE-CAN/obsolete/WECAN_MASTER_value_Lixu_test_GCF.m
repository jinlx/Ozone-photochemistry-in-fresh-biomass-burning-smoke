% This example is for the use of all available mechanisms.
%   Because some of the mechanisms use different names for species and J-values, there are some
%   switch-case statements that would not be needed if doing this with a single mechanism.
% 20220722, make the script masters most comprehensive VOCs we sampled in WE-CAN.

if length(dbstack)==1 %only execute if top-level (skip if called from ExampleSetup_MechCompare.m)
    clear
    MECHANISM = 'GCv13_base'; 
    %MECHANISM = 'GCv13_JINF'; 
    %MECHANISM = 'GCv13_JINF_HCOOH'; 

    %MECHANISM = 'MCMv331_base'; 
    %MECHANISM = 'MCMv331_GCvocs'; 
    %MECHANISM = 'MCMv331_GCvocsF'; 
    makeplots = 0; %flag 0 or 1 for making plots after run
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input names inconsistenc due to mechanisms (customized)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name_reorg;
disp('done, naming reorganization');

% choose the flight ID
% Flight_ID = 'RF07';

% choose the start point
starting_point = 1;

if Flight_ID == 'RF03'
    starting_point = 2;
end
if Flight_ID == 'RF07'
    starting_point = 2;
end

% choose the sensitivity test 
scale_factor = 1.0;
ScaleFacVOC = 1;
ScaleFacMet = 1;
ScaleFacNOx = 1;
ScaleFacHONO = ScaleFacNOx;

% ========================================================================================================
% load and read observations
% including meteorolgy, photolysis rates, plume age product, chemical compounds and bkg
% ========================================================================================================
%{
We will use observations taken on C130 and DC8 in the western US during 2018 WE-CAN and 2019 FIREX-AQ.
Data haven't been averaged to 1 minute and have been filtered for NaN/negatives (task holder later?). 
The time vector in this structure is "UTC_mid" and is in UTC seconds of day.
%}
met_obs = load(['/glade/work/lixujin/PYTHON/SciProj/Furans/F0AM_analysis_TS/WE-CAN/Model_inputs_prepared/output_data/mat/', Flight_ID, '_met.mat']);
bkg_obs = load(['/glade/work/lixujin/PYTHON/SciProj/Furans/F0AM_analysis_TS/WE-CAN/Model_inputs_prepared/output_data/mat/', Flight_ID, '_bkg.mat']);
smk_obs = load(['/glade/work/lixujin/PYTHON/SciProj/Furans/F0AM_analysis_TS/WE-CAN/Model_inputs_prepared/output_data/mat/', Flight_ID, '_smk.mat']);

% ==========
% MET
% ===========
Age_physical_avg_min = met_obs.Age_physical_avg_min;
PRESSURE = met_obs.PRESSURE;
TEMPERATURE = met_obs.TEMPERATURE;
RHUM = met_obs.RHUM;
SZA = met_obs.SZA;
JNO2_NO_O3P = met_obs.JNO2_NO_O3P;
JHNO2_OH_NO = met_obs.JHNO2_OH_NO;
JH2O2_2OH = met_obs.JH2O2_2OH;
JHNO3_OH_NO2 = met_obs.JHNO3_OH_NO2;
JO3_O2_O1D = met_obs.JO3_O2_O1D;
JCH2O_H_HCO = met_obs.JCH2O_H_HCO;
JCH2O_H2_CO = met_obs.JCH2O_H2_CO;
JNO3_NO_O2 = met_obs.JNO3_NO_O2;
JNO3_NO2_O_3P = met_obs.JNO3_NO2_O_3P;

Int_time = met_obs.Int_time(1);
kdil = met_obs.kdil(1); % Doesn't matter much for RF03

disp(kdil);
% remove bad data according to NOx
if Flight_ID == 'RF03'
    bad_point = 3;
else
    bad_point = [];
end
PRESSURE(:, bad_point) = [];
TEMPERATURE(:, bad_point) = [];
RHUM(:, bad_point) = [];
SZA(:, bad_point) = [];
JNO2_NO_O3P(:, bad_point) = [];
JHNO2_OH_NO(:, bad_point) = [];
JH2O2_2OH(:, bad_point) = [];
JHNO3_OH_NO2(:, bad_point) = [];
JO3_O2_O1D(:, bad_point) = [];
JCH2O_H_HCO(:, bad_point) = [];
JCH2O_H2_CO(:, bad_point) = [];
JNO3_NO_O2(:, bad_point) = [];
JNO3_NO2_O_3P(:, bad_point) = [];

%{
%kdil calculation using CO decay
smk_CO_QCL = smk_obs.smk_CO_QCL;
dCOdt        = diff(smk_CO_QCL)./diff(Age_physical_avg_min.*60); %loss rate
dCOdt(end+1) = dCOdt(end);
COmid        = (smk_CO_QCL + [smk_CO_QCL(2:end), smk_CO_QCL(end)])/2; %CO in middle of step
kdil         = -dCOdt./(COmid-min(bkg_obs.bkg_CO_QCL));
kdil(kdil < 0) = kdil(1);
%}

% Available smoke plume OH measurements are closer to 1E7 in Hobbs et al 2003, Yokelson et al 2009, Akagi et al 2012.
smk_OH  = 4.0e-4;% Assuming ~2e6/1e8 molec cm-3 for OH and HO2 (see Stone et al., 2012; Liao et al., 2021); convert into ppb by dividing 2.46e10 (http://tinyurl.com/ac-cheat2)
smk_HO2 = 4.07e-3;
OH_holder = 0;

% ===============
% bkg data
% ===============
% inorganic
bkg_CO_QCL = bkg_obs.bkg_CO_QCL;
bkg_CO2_PICARRO_ppb = bkg_obs.bkg_CO2_PICARRO_ppb;
bkg_NO = bkg_obs.bkg_NO;
bkg_NO2 = bkg_obs.bkg_NO2;

bkg_HONO_UWCIMS = bkg_obs.bkg_HONO_UWCIMS;
bkg_HONO_HNO2_PTR = bkg_obs.bkg_HONO_HNO2_PTR;

bkg_O3 = bkg_obs.bkg_O3;
bkg_SO2_UWCIMS = bkg_obs.bkg_SO2_UWCIMS;
bkg_PAN = bkg_obs.bkg_PAN;
bkg_HCl_UWCIMS = bkg_obs.bkg_HCl_UWCIMS;
bkg_HNO3_UWCIMS = bkg_obs.bkg_HNO3_UWCIMS;

% CxHyXz
bkg_Methane_PICARRO = bkg_obs.bkg_Methane_PICARRO;
bkg_CH3Cl_TOGA = bkg_obs.bkg_CH3Cl_TOGA;
bkg_CH3Br_TOGA = bkg_obs.bkg_CH3Br_TOGA;
bkg_CH3I_TOGA = bkg_obs.bkg_CH3I_TOGA;
bkg_CH2Cl2_TOGA = bkg_obs.bkg_CH2Cl2_TOGA;
bkg_CH2Br2_TOGA = bkg_obs.bkg_CH2Br2_TOGA;
bkg_CHCl3_TOGA = bkg_obs.bkg_CHCl3_TOGA;
bkg_CHBr3_TOGA = bkg_obs.bkg_CHBr3_TOGA;
bkg_CH3CCl3_TOGA = bkg_obs.bkg_CH3CCl3_TOGA;

bkg_Ethyne_AWAS = bkg_obs.bkg_Ethyne_AWAS;
bkg_ethene_C2H4_PTR = bkg_obs.bkg_ethene_C2H4_PTR;
bkg_Ethene_AWAS = bkg_obs.bkg_Ethene_AWAS;
bkg_Ethane_AWAS = bkg_obs.bkg_Ethane_AWAS;
bkg_PROPYNE_C3H4_PTR = bkg_obs.bkg_PROPYNE_C3H4_PTR;

bkg_propene_C3H6_PTR = bkg_obs.bkg_propene_C3H6_PTR;
bkg_1_BUTENE_PTR = bkg_obs.bkg_1_BUTENE_PTR;
bkg_iButene1Butene_TOGA = bkg_obs.bkg_iButene1Butene_TOGA;
bkg_x1Butene_AWAS = bkg_obs.bkg_x1Butene_AWAS;
bkg_transx2butene_AWAS = bkg_obs.bkg_transx2butene_AWAS;
bkg_cisx2butene_AWAS = bkg_obs.bkg_cisx2butene_AWAS;
bkg_pentene_C5H10_PTR = bkg_obs.bkg_pentene_C5H10_PTR;


bkg_x1Hexene_AWAS = bkg_obs.bkg_x1Hexene_AWAS;

bkg_Ethane_AWAS = bkg_obs.bkg_Ethane_AWAS;
bkg_Propane_TOGA = bkg_obs.bkg_Propane_TOGA;
bkg_Propane_AWAS = bkg_obs.bkg_Propane_AWAS;

bkg_nButane_TOGA = bkg_obs.bkg_nButane_TOGA;
bkg_iButane_TOGA = bkg_obs.bkg_iButane_TOGA;
bkg_N_butane_AWAS = bkg_obs.bkg_N_butane_AWAS;
bkg_Isobutane_AWAS = bkg_obs.bkg_Isobutane_AWAS;
bkg_iPentane_TOGA = bkg_obs.bkg_iPentane_TOGA;
bkg_nPentane_TOGA = bkg_obs.bkg_nPentane_TOGA;
bkg_Isopentane_AWAS = bkg_obs.bkg_Isopentane_AWAS;
bkg_nPentane_AWAS = bkg_obs.bkg_nPentane_AWAS;

bkg_nHexane_TOGA = bkg_obs.bkg_nHexane_TOGA;
bkg_Hexane_AWAS = bkg_obs.bkg_Hexane_AWAS;
bkg_x2MePentane_TOGA = bkg_obs.bkg_x2MePentane_TOGA;
bkg_x3MePentane_TOGA = bkg_obs.bkg_x3MePentane_TOGA;
bkg_x3Methylpentane_AWAS = bkg_obs.bkg_x3Methylpentane_AWAS;
bkg_x22Dimethylbutane_AWAS = bkg_obs.bkg_x22Dimethylbutane_AWAS;

bkg_nHeptane_TOGA = bkg_obs.bkg_nHeptane_TOGA;
bkg_nHeptan_CHB_AWAS = bkg_obs.bkg_nHeptan_CHB_AWAS;
bkg_x24Dimethylpentane_AWAS = bkg_obs.bkg_x24Dimethylpentane_AWAS;
bkg_x23Dimethylpentane_AWAS = bkg_obs.bkg_x23Dimethylpentane_AWAS;
bkg_x2Methylhexane_AWAS = bkg_obs.bkg_x2Methylhexane_AWAS;
bkg_x3Methylhexane_AWAS = bkg_obs.bkg_x3Methylhexane_AWAS;

bkg_nOctane_TOGA = bkg_obs.bkg_nOctane_TOGA;
bkg_nOctane_AWAS = bkg_obs.bkg_nOctane_AWAS;

bkg_x234Trimethylpentane_AWAS = bkg_obs.bkg_x234Trimethylpentane_AWAS;
bkg_x2Methylheptane_AWAS = bkg_obs.bkg_x2Methylheptane_AWAS;
bkg_x3Methylheptane_AWAS = bkg_obs.bkg_x3Methylheptane_AWAS;
bkg_x234Trimethylpentane_AWAS = bkg_obs.bkg_x234Trimethylpentane_AWAS;

bkg_nNonane_AWAS = bkg_obs.bkg_nNonane_AWAS;
bkg_nDecane_AWAS = bkg_obs.bkg_nDecane_AWAS;
bkg_Undecane_AWAS = bkg_obs.bkg_Undecane_AWAS;

% Aldehdyes 
bkg_formaldehyde_CH2O_PTR = bkg_obs.bkg_formaldehyde_CH2O_PTR;
bkg_CH2O_TOGA = bkg_obs.bkg_CH2O_TOGA;
bkg_ACETALDEHYDE_C2H4O_PTR = bkg_obs.bkg_ACETALDEHYDE_C2H4O_PTR;
bkg_CH3CHO_TOGA = bkg_obs.bkg_CH3CHO_TOGA;
bkg_Acetaldehyde_AWAS = bkg_obs.bkg_Acetaldehyde_AWAS;

bkg_Propanal_C3H6O_PTR = bkg_obs.bkg_ACETONE_C3H6O_PTR.*0.17;
bkg_Propanal_TOGA = bkg_obs.bkg_Propanal_TOGA;
bkg_Butanal_C4H8O_PTR = bkg_obs.bkg_MEK_C4H8O_PTR.*0.01;
bkg_Butanal_TOGA = bkg_obs.bkg_Butanal_TOGA;
bkg_2_Methylpropanal_C4H8O_PTR = bkg_obs.bkg_MEK_C4H8O_PTR.*0.14;

bkg_2_Methylbutanal_PTR = bkg_obs.bkg_3_methyl_2_butanone_C5H10O_PTR.*0.04;
bkg_glyoxal_C2H2O2_PTR = bkg_obs.bkg_glyoxal_C2H2O2_PTR;

% Aromatics
bkg_BENZENE_C6H6_PTR = bkg_obs.bkg_BENZENE_C6H6_PTR;
bkg_Benzene_TOGA = bkg_obs.bkg_Benzene_TOGA;
bkg_Benzene_CHB_AWAS = bkg_obs.bkg_Benzene_CHB_AWAS;

bkg_TOLUENE_C7H8_PTR = bkg_obs.bkg_TOLUENE_C7H8_PTR;
bkg_Toluene_TOGA = bkg_obs.bkg_Toluene_TOGA;
bkg_Toluene_AWAS = bkg_obs.bkg_Toluene_AWAS;

bkg_Ethyl_benzene_C8H10_PTR = bkg_obs.bkg_C8_AROMATICS_C8H10_PTR.*0.36;
bkg_mpXylenes_C8H10_PTR = bkg_obs.bkg_C8_AROMATICS_C8H10_PTR.*0.46;
bkg_oXylene_C8H10_PTR = bkg_obs.bkg_C8_AROMATICS_C8H10_PTR.*0.18;
bkg_oXylene_TOGA = bkg_obs.bkg_oXylene_TOGA;
bkg_mpXylene_TOGA = bkg_obs.bkg_mpXylene_TOGA;


bkg_oXylene_AWAS = bkg_obs.bkg_oXylene_AWAS;
bkg_mpXylene_AWAS = bkg_obs.bkg_mpXylene_AWAS;
bkg_Ethylbenzene_AWAS = bkg_obs.bkg_Ethylbenzene_AWAS;

% Formic acid
bkg_formic_acid_CH2O2_PTR = bkg_obs.bkg_formic_acid_CH2O2_PTR;
bkg_CH2O2_UWCIMS = bkg_obs.bkg_CH2O2_UWCIMS;

bkg_Acetic_acid_C2H4O2_PTR = bkg_obs.bkg_acetic_acid_C2H4O2_PTR.*0.67; % noted

% Biogenic VOCs
bkg_ISOPRENE_C5H8_PTR = bkg_obs.bkg_ISOPRENE_C5H8_PTR;
bkg_Isoprene_TOGA = bkg_obs.bkg_Isoprene_TOGA;
bkg_Isoprene_AWAS = bkg_obs.bkg_Isoprene_AWAS;


bkg_apinene_C10H16_PTR = bkg_obs.bkg_MONOTERPENES_C10H16_PTR.*0.33;
bkg_aPinene_TOGA = bkg_obs.bkg_aPinene_TOGA;


bkg_bpinene_C10H16_PTR = bkg_obs.bkg_MONOTERPENES_C10H16_PTR.*0.21;
bkg_bPineneMyrcene_TOGA = bkg_obs.bkg_bPineneMyrcene_TOGA;

bkg_MVK_C4H6O_PTR = bkg_obs.bkg_MACR_MVK_C4H6O_PTR.*0.60;
bkg_MVK_TOGA = bkg_obs.bkg_MVK_TOGA;
bkg_MVK_AWAS = bkg_obs.bkg_MVK_AWAS;

bkg_MACR_C4H6O_PTR = bkg_obs.bkg_MACR_MVK_C4H6O_PTR.*0.28;
bkg_MAC_TOGA = bkg_obs.bkg_MAC_TOGA;
bkg_MACR_AWAS = bkg_obs.bkg_MACR_AWAS;


% alcohols
bkg_METHANOL_CH3OH_PTR = bkg_obs.bkg_METHANOL_CH3OH_PTR;
bkg_CH3OH_TOGA = bkg_obs.bkg_CH3OH_TOGA;

bkg_ETHANOL_C2H6O_PTR = bkg_obs.bkg_ETHANOL_C2H6O_PTR;
bkg_C2H5OH_TOGA = bkg_obs.bkg_C2H5OH_TOGA;
bkg_iPropanol_TOGA = bkg_obs.bkg_iPropanol_TOGA;


% ketones
bkg_Acetone_C3H6O_PTR = bkg_obs.bkg_ACETONE_C3H6O_PTR.*0.83;
bkg_Acetone_TOGA  = bkg_obs.bkg_Acetone_TOGA;
bkg_Acetone_AWAS = bkg_obs.bkg_Acetone_AWAS;

bkg_mek_C4H8O_PTR = bkg_obs.bkg_MEK_C4H8O_PTR.*0.85;
bkg_MEK_TOGA = bkg_obs.bkg_MEK_TOGA;
bkg_MEK_AWAS = bkg_obs.bkg_MEK_AWAS;

% furans
bkg_FURAN_C4H4O_PTR = bkg_obs.bkg_FURAN_C4H4O_PTR;
bkg_Furan_TOGA = bkg_obs.bkg_Furan_TOGA;

bkg_2_Methylfuran_C5H6O_PTR = bkg_obs.bkg_2_METHYLFURAN_C5H6O_PTR.*0.84;
bkg_x3MeFuran_TOGA = bkg_obs.bkg_x3MeFuran_TOGA;
bkg_3_Methylfuran_C5H6O_PTR = bkg_obs.bkg_2_METHYLFURAN_C5H6O_PTR.*0.16;
bkg_x3MeFuran_TOGA = bkg_obs.bkg_x3MeFuran_TOGA;

bkg_2_5_dimethyl_furan_C6H8O = bkg_obs.bkg_2_5_dimethyl_furan_C6H8O;

bkg_2_FURALDEHYDE_C5H4O2_PTR = bkg_obs.bkg_2_FURALDEHYDE_C5H4O2_PTR;

bkg_5_Methylfurfural_C6H6O2_PTR = bkg_obs.bkg_5_METHYLFURFURAL_C6H6O2_PTR.*0.5;

bkg_2_3H_furanone_C4H4O2_PTR = bkg_obs.bkg_2_3H_furanone_C4H4O2_PTR;
% others
bkg_glycolaldehyde_C2H4O2_PTR = bkg_obs.bkg_acetic_acid_C2H4O2_PTR.*0.33;

bkg_DMS_PTR = bkg_obs.bkg_DMS_PTR;
bkg_DMS_TOGA = bkg_obs.bkg_DMS_TOGA;
bkg_DMS_AWAS = bkg_obs.bkg_DMS_AWAS;
bkg_acrolein_C3H4O_PTR = bkg_obs.bkg_acrolein_C3H4O_PTR;
bkg_Acrolein_TOGA = bkg_obs.bkg_Acrolein_TOGA;
bkg_methyl_glyoxal_C3H4O2_PTR = bkg_obs.bkg_methyl_glyoxal_C3H4O2_PTR;

bkg_PPN = bkg_obs.bkg_PPN;
bkg_Hydroxyacetone_C3H6O2_PTR = bkg_obs.bkg_hydroxyacetone_C3H6O2_PTR.*0.51;
bkg_Methyl_acetate_C3H6O2_PTR = bkg_obs.bkg_hydroxyacetone_C3H6O2_PTR.*0.35;
bkg_Ethyl_formate_C3H6O2_PTR = bkg_obs.bkg_hydroxyacetone_C3H6O2_PTR.*0.14;

bkg_iPropONO2_TOGA = bkg_obs.bkg_iPropONO2_TOGA;
bkg_nPropONO2_TOGA = bkg_obs.bkg_nPropONO2_TOGA;

bkg_maleic_anhydride_C4H2O3_PTR = bkg_obs.bkg_maleic_anhydride_C4H2O3_PTR;
bkg_butadiene_C4H6_PTR = bkg_obs.bkg_butadiene_C4H6_PTR;
bkg_2_Butenal_C4H6O_PTR = bkg_obs.bkg_MACR_MVK_C4H6O_PTR.*0.13;
bkg_2_3_butanedione_C4H6O2_PTR = bkg_obs.bkg_2_3_butanedione_C4H6O2_PTR;

bkg_iBuONO2_TOGA = bkg_obs.bkg_iBuONO2and2BuONO2_TOGA.*0.5;
bkg_nBuONO2_TOGA = bkg_obs.bkg_iBuONO2and2BuONO2_TOGA.*0.5;

bkg_C5H9O4N_UWCIMS = bkg_obs.bkg_C5H9O4N_UWCIMS;

bkg_MBO_C5H10O_PTR = bkg_obs.bkg_3_methyl_2_butanone_C5H10O_PTR.*0.43;
bkg_MBO_TOGA = bkg_obs.bkg_MBO_TOGA; 
bkg_2_Pentanone_C5H10O_PTR = bkg_obs.bkg_3_methyl_2_butanone_C5H10O_PTR.*0.23;
bkg_3_Pentanone_C5H10O_PTR = bkg_obs.bkg_3_methyl_2_butanone_C5H10O_PTR.*0.21;
bkg_C5H10O3_UWCIMS = bkg_obs.bkg_C5H10O3_UWCIMS;

bkg_phenol_C6H6O_PTR = bkg_obs.bkg_phenol_C6H6O_PTR;
bkg_C6H6O_UWCIMS = bkg_obs.bkg_C6H6O_UWCIMS;
bkg_Catechol_C6H6O2_PTR = bkg_obs.bkg_5_METHYLFURFURAL_C6H6O2_PTR.*0.5;

bkg_Hexanones_C6H12O_PTR = bkg_obs.bkg_3_HEXANONE_C6H12O_PTR.*0.53;
bkg_Hexanal_C6H12O_PTR = bkg_obs.bkg_3_HEXANONE_C6H12O_PTR.*0.47;

bkg_benzaldehyde_C7H6O_PTR = bkg_obs.bkg_benzaldehyde_C7H6O_PTR;
bkg_o_cresol_C7H8O_PTR = bkg_obs.bkg_o_cresol_C7H8O_PTR;
bkg_guaiacol_C7H8O2_PTR = bkg_obs.bkg_guaiacol_C7H8O2_PTR;

bkg_Heptanal_C7H14O_PTR = bkg_obs.bkg_heptanal_C7H14O_PTR.*0.63;
bkg_heptanone_C7H14O_PTR = bkg_obs.bkg_heptanal_C7H14O_PTR.*0.37;

bkg_styrene_C8H8_PTR = bkg_obs.bkg_styrene_C8H8_PTR;
bkg_Styrene_TOGA = bkg_obs.bkg_Styrene_TOGA;

bkg_tolualdehyde_C8H8O_PTR = bkg_obs.bkg_tolualdehyde_C8H8O_PTR;

bkg_creosol_C8H10O2_PTR = bkg_obs.bkg_creosol_C8H10O2_PTR;
bkg_syringol_C8H10O3_PTR = bkg_obs.bkg_syringol_C8H10O3_PTR;
bkg_3_methylacetophenone_C9H10O_PTR = bkg_obs.bkg_3_methylacetophenone_C9H10O_PTR;

bkg_Isopropylbenzene_AWAS = bkg_obs.bkg_Isopropylbenzene_AWAS;
bkg_nPropylbenzene_AWAS = bkg_obs.bkg_nPropylbenzene_AWAS;
bkg_x123Trimethylbenzene_AWAS = bkg_obs.bkg_x123Trimethylbenzene_AWAS;
bkg_x124Trimethylbenzene_AWAS = bkg_obs.bkg_x124Trimethylbenzene_AWAS;
bkg_x135Trimethylbenzene_AWAS = bkg_obs.bkg_x135Trimethylbenzene_AWAS;
bkg_x2Ethyltoluene_AWAS = bkg_obs.bkg_x2Ethyltoluene_AWAS;
bkg_x3Ethyltoluene_AWAS = bkg_obs.bkg_x3Ethyltoluene_AWAS;
bkg_x4Ethyltoluene_AWAS = bkg_obs.bkg_x4Ethyltoluene_AWAS;

bkg_C9H14O4_UWCIMS = bkg_obs.bkg_C9H14O4_UWCIMS;
bkg_C10H16O3_UWCIMS = bkg_obs.bkg_C10H16O3_UWCIMS;

bkg_C10_AROMATICS_C10H14_PTR = bkg_obs.bkg_C10_AROMATICS_C10H14_PTR;
bkg_x13Diethylbenzene_AWAS = bkg_obs.bkg_x13Diethylbenzene_AWAS;
bkg_x14Diethylbenzene_AWAS = bkg_obs.bkg_x14Diethylbenzene_AWAS;

bkg_sesquiterpenes_C15H24_PTR = bkg_obs.bkg_sesquiterpenes_C15H24_PTR;


% ===============
% smk data
% ===============
% inorganic
smk_CO_QCL = smk_obs.smk_CO_QCL;
smk_CO2_PICARRO_ppb = smk_obs.smk_CO2_PICARRO_ppb;
smk_NO = smk_obs.smk_NO;
smk_NO2 = smk_obs.smk_NO2;
smk_HONO_UWCIMS = smk_obs.smk_HONO_UWCIMS;
smk_HONO_HNO2_PTR = smk_obs.smk_HONO_HNO2_PTR;
smk_O3 = smk_obs.smk_O3;
smk_SO2_UWCIMS = smk_obs.smk_SO2_UWCIMS;
smk_PAN = smk_obs.smk_PAN;
smk_HCl_UWCIMS = smk_obs.smk_HCl_UWCIMS;
smk_HNO3_UWCIMS = smk_obs.smk_HNO3_UWCIMS;

% + magic_args="remove bad data according to NOx"
smk_CO_QCL(:, bad_point) = [];
smk_CO2_PICARRO_ppb(:, bad_point) = [];
smk_NO(:, bad_point) = [];
smk_NO2(:, bad_point) = [];
smk_HONO_UWCIMS(:, bad_point) = [];
smk_HONO_HNO2_PTR(:, bad_point) = [];
smk_O3(:, bad_point) = [];
smk_SO2_UWCIMS(:, bad_point) = [];
smk_PAN(:, bad_point) = [];
smk_HCl_UWCIMS(:, bad_point) = [];
smk_HNO3_UWCIMS(:, bad_point) = [];
% -


% CxHyXz
smk_Methane_PICARRO = smk_obs.smk_Methane_PICARRO;
smk_CH3Cl_TOGA = smk_obs.smk_CH3Cl_TOGA;
smk_CH3Br_TOGA = smk_obs.smk_CH3Br_TOGA;
smk_CH3I_TOGA = smk_obs.smk_CH3I_TOGA;
smk_CH2Cl2_TOGA = smk_obs.smk_CH2Cl2_TOGA;
smk_CH2Br2_TOGA = smk_obs.smk_CH2Br2_TOGA;
smk_CHCl3_TOGA = smk_obs.smk_CHCl3_TOGA;
smk_CHBr3_TOGA = smk_obs.smk_CHBr3_TOGA;
smk_CH3CCl3_TOGA = smk_obs.smk_CH3CCl3_TOGA;

smk_Ethyne_AWAS = smk_obs.smk_Ethyne_AWAS;
smk_ethene_C2H4_PTR = smk_obs.smk_ethene_C2H4_PTR;
smk_Ethene_AWAS = smk_obs.smk_Ethene_AWAS;
smk_Ethane_AWAS = smk_obs.smk_Ethane_AWAS;
smk_PROPYNE_C3H4_PTR = smk_obs.smk_PROPYNE_C3H4_PTR;

smk_propene_C3H6_PTR = smk_obs.smk_propene_C3H6_PTR;
smk_Propylene_AWAS = smk_obs.smk_Propylene_AWAS;
smk_1_BUTENE_PTR = smk_obs.smk_1_BUTENE_PTR;
smk_iButene1Butene_TOGA = smk_obs.smk_iButene1Butene_TOGA;
smk_x1Butene_AWAS = smk_obs.smk_x1Butene_AWAS;
smk_transx2butene_AWAS = smk_obs.smk_transx2butene_AWAS;
smk_cisx2butene_AWAS = smk_obs.smk_cisx2butene_AWAS;
smk_pentene_C5H10_PTR = smk_obs.smk_pentene_C5H10_PTR;


smk_x1Hexene_AWAS = smk_obs.smk_x1Hexene_AWAS;

smk_Ethane_AWAS = smk_obs.smk_Ethane_AWAS;
smk_Propane_TOGA = smk_obs.smk_Propane_TOGA;
smk_Propane_AWAS = smk_obs.smk_Propane_AWAS;

smk_nButane_TOGA = smk_obs.smk_nButane_TOGA;
smk_iButane_TOGA = smk_obs.smk_iButane_TOGA;
smk_N_butane_AWAS = smk_obs.smk_N_butane_AWAS;
smk_Isobutane_AWAS = smk_obs.smk_Isobutane_AWAS;
smk_iPentane_TOGA = smk_obs.smk_iPentane_TOGA;
smk_nPentane_TOGA = smk_obs.smk_nPentane_TOGA;
smk_Isopentane_AWAS = smk_obs.smk_Isopentane_AWAS;
smk_nPentane_AWAS = smk_obs.smk_nPentane_AWAS;

smk_nHexane_TOGA = smk_obs.smk_nHexane_TOGA;
smk_Hexane_AWAS = smk_obs.smk_Hexane_AWAS;
smk_x2MePentane_TOGA = smk_obs.smk_x2MePentane_TOGA;
smk_x3MePentane_TOGA = smk_obs.smk_x3MePentane_TOGA;
smk_x3Methylpentane_AWAS = smk_obs.smk_x3Methylpentane_AWAS;
smk_x22Dimethylbutane_AWAS = smk_obs.smk_x22Dimethylbutane_AWAS;

smk_nHeptane_TOGA = smk_obs.smk_nHeptane_TOGA;
smk_nHeptan_CHB_AWAS = smk_obs.smk_nHeptan_CHB_AWAS;
smk_x24Dimethylpentane_AWAS = smk_obs.smk_x24Dimethylpentane_AWAS;
smk_x23Dimethylpentane_AWAS = smk_obs.smk_x23Dimethylpentane_AWAS;
smk_x2Methylhexane_AWAS = smk_obs.smk_x2Methylhexane_AWAS;
smk_x3Methylhexane_AWAS = smk_obs.smk_x3Methylhexane_AWAS;

smk_nOctane_TOGA = smk_obs.smk_nOctane_TOGA;
smk_nOctane_AWAS = smk_obs.smk_nOctane_AWAS;

smk_x234Trimethylpentane_AWAS = smk_obs.smk_x234Trimethylpentane_AWAS;
smk_x2Methylheptane_AWAS = smk_obs.smk_x2Methylheptane_AWAS;
smk_x3Methylheptane_AWAS = smk_obs.smk_x3Methylheptane_AWAS;
smk_x234Trimethylpentane_AWAS = smk_obs.smk_x234Trimethylpentane_AWAS;

smk_nNonane_AWAS = smk_obs.smk_nNonane_AWAS;
smk_nDecane_AWAS = smk_obs.smk_nDecane_AWAS;
smk_Undecane_AWAS = smk_obs.smk_Undecane_AWAS;

% + magic_args="remove bad data according to NOx"
smk_Methane_PICARRO(:, bad_point) = [];
smk_CH3Cl_TOGA(:, bad_point) = [];
smk_CH3Br_TOGA(:, bad_point) = [];
smk_CH3I_TOGA(:, bad_point) = [];
smk_CH2Cl2_TOGA(:, bad_point) = [];
smk_CH2Br2_TOGA(:, bad_point) = [];
smk_CHCl3_TOGA(:, bad_point) = [];
smk_CHBr3_TOGA(:, bad_point) = [];
smk_CH3CCl3_TOGA(:, bad_point) = [];
smk_Ethyne_AWAS(:, bad_point) = [];
smk_ethene_C2H4_PTR(:, bad_point) = [];
smk_Ethene_AWAS(:, bad_point) = [];
smk_Ethane_AWAS(:, bad_point) = [];
smk_PROPYNE_C3H4_PTR(:, bad_point) = [];
smk_propene_C3H6_PTR(:, bad_point) = [];
smk_Propylene_AWAS(:, bad_point) = [];
smk_1_BUTENE_PTR(:, bad_point) = [];
smk_iButene1Butene_TOGA(:, bad_point) = [];
smk_x1Butene_AWAS(:, bad_point) = [];
smk_transx2butene_AWAS(:, bad_point) = [];
smk_cisx2butene_AWAS(:, bad_point) = [];
smk_pentene_C5H10_PTR(:, bad_point) = [];
smk_x1Hexene_AWAS(:, bad_point) = [];
smk_Ethane_AWAS(:, bad_point) = [];
smk_Propane_TOGA(:, bad_point) = [];
smk_Propane_AWAS(:, bad_point) = [];
smk_nButane_TOGA(:, bad_point) = [];
smk_iButane_TOGA(:, bad_point) = [];
smk_N_butane_AWAS(:, bad_point) = [];
smk_Isobutane_AWAS(:, bad_point) = [];
smk_iPentane_TOGA(:, bad_point) = [];
smk_nPentane_TOGA(:, bad_point) = [];
smk_Isopentane_AWAS(:, bad_point) = [];
smk_nPentane_AWAS(:, bad_point) = [];
smk_nHexane_TOGA(:, bad_point) = [];
smk_Hexane_AWAS(:, bad_point) = [];
smk_x2MePentane_TOGA(:, bad_point) = [];
smk_x3MePentane_TOGA(:, bad_point) = [];
smk_x3Methylpentane_AWAS(:, bad_point) = [];
smk_x22Dimethylbutane_AWAS(:, bad_point) = [];
smk_nHeptane_TOGA(:, bad_point) = [];
smk_nHeptan_CHB_AWAS(:, bad_point) = [];
smk_x24Dimethylpentane_AWAS(:, bad_point) = [];
smk_x23Dimethylpentane_AWAS(:, bad_point) = [];
smk_x2Methylhexane_AWAS(:, bad_point) = [];
smk_x3Methylhexane_AWAS(:, bad_point) = [];
smk_nOctane_TOGA(:, bad_point) = [];
smk_nOctane_AWAS(:, bad_point) = [];
smk_x234Trimethylpentane_AWAS(:, bad_point) = [];
smk_x2Methylheptane_AWAS(:, bad_point) = [];
smk_x3Methylheptane_AWAS(:, bad_point) = [];
smk_x234Trimethylpentane_AWAS(:, bad_point) = [];
smk_nNonane_AWAS(:, bad_point) = [];
smk_nDecane_AWAS(:, bad_point) = [];
smk_Undecane_AWAS(:, bad_point) = [];
% -



% Aldehdyes 
smk_formaldehyde_CH2O_PTR = smk_obs.smk_formaldehyde_CH2O_PTR;
smk_CH2O_TOGA = smk_obs.smk_CH2O_TOGA;
smk_ACETALDEHYDE_C2H4O_PTR = smk_obs.smk_ACETALDEHYDE_C2H4O_PTR;
smk_CH3CHO_TOGA = smk_obs.smk_CH3CHO_TOGA;
smk_Acetaldehyde_AWAS = smk_obs.smk_Acetaldehyde_AWAS;

smk_Propanal_C3H6O_PTR = smk_obs.smk_ACETONE_C3H6O_PTR.*0.17;
smk_Propanal_TOGA = smk_obs.smk_Propanal_TOGA;
smk_Butanal_C4H8O_PTR = smk_obs.smk_MEK_C4H8O_PTR.*0.01;
smk_Butanal_TOGA = smk_obs.smk_Butanal_TOGA;
smk_2_Methylpropanal_C4H8O_PTR = smk_obs.smk_MEK_C4H8O_PTR.*0.14;

smk_2_Methylbutanal_PTR = smk_obs.smk_3_methyl_2_butanone_C5H10O_PTR.*0.04;
smk_glyoxal_C2H2O2_PTR = smk_obs.smk_glyoxal_C2H2O2_PTR;


% + magic_args="remove bad data according to NOx"
smk_formaldehyde_CH2O_PTR(:, bad_point) = [];
smk_CH2O_TOGA(:, bad_point) = [];
smk_ACETALDEHYDE_C2H4O_PTR(:, bad_point) = [];
smk_CH3CHO_TOGA(:, bad_point) = [];
smk_Acetaldehyde_AWAS(:, bad_point) = [];
smk_Propanal_C3H6O_PTR(:, bad_point) = [];
smk_Propanal_TOGA(:, bad_point) = [];
smk_Butanal_C4H8O_PTR(:, bad_point) = [];
smk_Butanal_TOGA(:, bad_point) = [];
smk_2_Methylpropanal_C4H8O_PTR(:, bad_point) = [];
smk_2_Methylbutanal_PTR(:, bad_point) = [];
smk_glyoxal_C2H2O2_PTR(:, bad_point) = [];
% -

% Aromatics
smk_BENZENE_C6H6_PTR = smk_obs.smk_BENZENE_C6H6_PTR;
smk_Benzene_TOGA = smk_obs.smk_Benzene_TOGA;
smk_Benzene_CHB_AWAS = smk_obs.smk_Benzene_CHB_AWAS;

smk_TOLUENE_C7H8_PTR = smk_obs.smk_TOLUENE_C7H8_PTR;
smk_Toluene_TOGA = smk_obs.smk_Toluene_TOGA;
smk_Toluene_AWAS = smk_obs.smk_Toluene_AWAS;

smk_C8_AROMATICS_C8H10_PTR = smk_obs.smk_C8_AROMATICS_C8H10_PTR;
smk_Ethyl_benzene_C8H10_PTR = smk_C8_AROMATICS_C8H10_PTR.*0.36;
smk_mpXylenes_C8H10_PTR = smk_C8_AROMATICS_C8H10_PTR.*0.46;
smk_oXylene_C8H10_PTR = smk_C8_AROMATICS_C8H10_PTR.*0.18;
smk_oXylene_TOGA = smk_obs.smk_oXylene_TOGA;
smk_mpXylene_TOGA = smk_obs.smk_mpXylene_TOGA;

smk_oXylene_AWAS = smk_obs.smk_oXylene_AWAS;
smk_mpXylene_AWAS = smk_obs.smk_mpXylene_AWAS;
smk_Ethylbenzene_AWAS = smk_obs.smk_Ethylbenzene_AWAS;

% + magic_args="remove bad data according to NOx"
smk_BENZENE_C6H6_PTR(:, bad_point) = [];
smk_Benzene_TOGA(:, bad_point) = [];
smk_Benzene_CHB_AWAS(:, bad_point) = [];
smk_TOLUENE_C7H8_PTR(:, bad_point) = [];
smk_Toluene_TOGA(:, bad_point) = [];
smk_Toluene_AWAS(:, bad_point) = [];
smk_C8_AROMATICS_C8H10_PTR(:, bad_point) = [];
smk_Ethyl_benzene_C8H10_PTR(:, bad_point) = [];
smk_mpXylenes_C8H10_PTR(:, bad_point) = [];
smk_oXylene_C8H10_PTR(:, bad_point) = [];
smk_oXylene_TOGA(:, bad_point) = [];
smk_mpXylene_TOGA(:, bad_point) = [];
smk_oXylene_AWAS(:, bad_point) = [];
smk_mpXylene_AWAS(:, bad_point) = [];
smk_Ethylbenzene_AWAS(:, bad_point) = [];
% -

% Formic acid
smk_formic_acid_CH2O2_PTR = smk_obs.smk_formic_acid_CH2O2_PTR;
smk_CH2O2_UWCIMS = smk_obs.smk_CH2O2_UWCIMS;
smk_Acetic_acid_C2H4O2_PTR = smk_obs.smk_acetic_acid_C2H4O2_PTR.*0.67;
%% remove bad data according to NOx
smk_formic_acid_CH2O2_PTR(:, bad_point) = [];
smk_CH2O2_UWCIMS(:, bad_point) = [];
smk_Acetic_acid_C2H4O2_PTR(:, bad_point) = [];

% Biogenic VOCs
smk_ISOPRENE_C5H8_PTR = smk_obs.smk_ISOPRENE_C5H8_PTR;
smk_Isoprene_TOGA = smk_obs.smk_Isoprene_TOGA;
smk_Isoprene_AWAS = smk_obs.smk_Isoprene_AWAS;

smk_apinene_C10H16_PTR = smk_obs.smk_MONOTERPENES_C10H16_PTR.*0.33;
smk_aPinene_TOGA = smk_obs.smk_aPinene_TOGA;

smk_bpinene_C10H16_PTR = smk_obs.smk_MONOTERPENES_C10H16_PTR.*0.21;
smk_bPineneMyrcene_TOGA = smk_obs.smk_bPineneMyrcene_TOGA;

smk_MVK_C4H6O_PTR = smk_obs.smk_MACR_MVK_C4H6O_PTR.*0.60;
smk_MVK_TOGA = smk_obs.smk_MVK_TOGA;
smk_MVK_AWAS = smk_obs.smk_MVK_AWAS;

smk_MACR_C4H6O_PTR = smk_obs.smk_MACR_MVK_C4H6O_PTR.*0.28;
smk_MAC_TOGA = smk_obs.smk_MAC_TOGA;
smk_MACR_AWAS = smk_obs.smk_MACR_AWAS;

% + magic_args="remove bad data according to NOx"
smk_ISOPRENE_C5H8_PTR(:, bad_point) = [];
smk_Isoprene_TOGA(:, bad_point) = [];
smk_Isoprene_AWAS(:, bad_point) = [];
smk_apinene_C10H16_PTR(:, bad_point) = [];
smk_aPinene_TOGA(:, bad_point) = [];
smk_bpinene_C10H16_PTR(:, bad_point) = [];
smk_bPineneMyrcene_TOGA(:, bad_point) = [];
smk_MVK_C4H6O_PTR(:, bad_point) = [];
smk_MVK_TOGA(:, bad_point) = [];
smk_MVK_AWAS(:, bad_point) = [];
smk_MACR_C4H6O_PTR(:, bad_point) = [];
smk_MAC_TOGA(:, bad_point) = [];
smk_MACR_AWAS(:, bad_point) = [];
% -

% alcohols
smk_METHANOL_CH3OH_PTR = smk_obs.smk_METHANOL_CH3OH_PTR;
smk_CH3OH_TOGA = smk_obs.smk_CH3OH_TOGA;

smk_ETHANOL_C2H6O_PTR = smk_obs.smk_ETHANOL_C2H6O_PTR;
smk_C2H5OH_TOGA = smk_obs.smk_C2H5OH_TOGA;
smk_iPropanol_TOGA = smk_obs.smk_iPropanol_TOGA;

% + magic_args="remove bad data according to NOx"
smk_METHANOL_CH3OH_PTR(:, bad_point) = [];
smk_CH3OH_TOGA(:, bad_point) = [];
smk_ETHANOL_C2H6O_PTR(:, bad_point) = [];
smk_C2H5OH_TOGA(:, bad_point) = [];
smk_iPropanol_TOGA(:, bad_point) = [];
% -

% ketones
smk_Acetone_C3H6O_PTR = smk_obs.smk_ACETONE_C3H6O_PTR.*0.83;
smk_Acetone_TOGA  = smk_obs.smk_Acetone_TOGA;
smk_Acetone_AWAS = smk_obs.smk_Acetone_AWAS;

smk_mek_C4H8O_PTR = smk_obs.smk_MEK_C4H8O_PTR.*0.85;
smk_MEK_TOGA = smk_obs.smk_MEK_TOGA;
smk_MEK_AWAS = smk_obs.smk_MEK_AWAS;

% + magic_args="remove bad data according to NOx"
smk_Acetone_C3H6O_PTR(:, bad_point) = [];
smk_Acetone_TOGA(:, bad_point) = [];
smk_Acetone_AWAS(:, bad_point) = [];
smk_mek_C4H8O_PTR(:, bad_point) = [];
smk_MEK_TOGA(:, bad_point) = [];
smk_MEK_AWAS(:, bad_point) = [];
% -

% furans
smk_FURAN_C4H4O_PTR = smk_obs.smk_FURAN_C4H4O_PTR;
smk_Furan_TOGA = smk_obs.smk_Furan_TOGA;

smk_2_Methylfuran_C5H6O_PTR = smk_obs.smk_2_METHYLFURAN_C5H6O_PTR.*0.84;
smk_x3MeFuran_TOGA = smk_obs.smk_x3MeFuran_TOGA;
smk_3_Methylfuran_C5H6O_PTR = smk_obs.smk_2_METHYLFURAN_C5H6O_PTR.*0.16;
smk_x3MeFuran_TOGA = smk_obs.smk_x3MeFuran_TOGA;

smk_2_5_dimethyl_furan_C6H8O = smk_obs.smk_2_5_dimethyl_furan_C6H8O;

smk_2_FURALDEHYDE_C5H4O2_PTR = smk_obs.smk_2_FURALDEHYDE_C5H4O2_PTR;

smk_5_Methylfurfural_C6H6O2_PTR = smk_obs.smk_5_METHYLFURFURAL_C6H6O2_PTR.*0.5;

smk_2_3H_furanone_C4H4O2_PTR = smk_obs.smk_2_3H_furanone_C4H4O2_PTR;

% + magic_args="remove bad data according to NOx"
smk_FURAN_C4H4O_PTR(:, bad_point) = [];
smk_Furan_TOGA(:, bad_point) = [];
smk_2_Methylfuran_C5H6O_PTR(:, bad_point) = [];
smk_x3MeFuran_TOGA(:, bad_point) = [];
smk_3_Methylfuran_C5H6O_PTR(:, bad_point) = [];
smk_x3MeFuran_TOGA(:, bad_point) = [];
smk_2_5_dimethyl_furan_C6H8O(:, bad_point) = [];
smk_2_FURALDEHYDE_C5H4O2_PTR(:, bad_point) = [];
smk_5_Methylfurfural_C6H6O2_PTR(:, bad_point) = [];
smk_2_3H_furanone_C4H4O2_PTR(:, bad_point) = [];
% -

% others
smk_glycolaldehyde_C2H4O2_PTR = smk_obs.smk_acetic_acid_C2H4O2_PTR.*0.33;

smk_DMS_PTR = smk_obs.smk_DMS_PTR;
smk_DMS_TOGA = smk_obs.smk_DMS_TOGA;
smk_DMS_AWAS = smk_obs.smk_DMS_AWAS;
smk_acrolein_C3H4O_PTR = smk_obs.smk_acrolein_C3H4O_PTR;
smk_Acrolein_TOGA = smk_obs.smk_Acrolein_TOGA;
smk_methyl_glyoxal_C3H4O2_PTR = smk_obs.smk_methyl_glyoxal_C3H4O2_PTR;

smk_PPN = smk_obs.smk_PPN;
smk_Hydroxyacetone_C3H6O2_PTR = smk_obs.smk_hydroxyacetone_C3H6O2_PTR.*0.51;
smk_Methyl_acetate_C3H6O2_PTR = smk_obs.smk_hydroxyacetone_C3H6O2_PTR.*0.35;
smk_Ethyl_formate_C3H6O2_PTR = smk_obs.smk_hydroxyacetone_C3H6O2_PTR.*0.14;

smk_iPropONO2_TOGA = smk_obs.smk_iPropONO2_TOGA;
smk_nPropONO2_TOGA = smk_obs.smk_nPropONO2_TOGA;

smk_maleic_anhydride_C4H2O3_PTR = smk_obs.smk_maleic_anhydride_C4H2O3_PTR;
smk_butadiene_C4H6_PTR = smk_obs.smk_butadiene_C4H6_PTR;
smk_2_Butenal_C4H6O_PTR = smk_obs.smk_MACR_MVK_C4H6O_PTR.*0.13;
smk_2_3_butanedione_C4H6O2_PTR = smk_obs.smk_2_3_butanedione_C4H6O2_PTR;

smk_iBuONO2_TOGA = smk_obs.smk_iBuONO2and2BuONO2_TOGA.*0.5;
smk_nBuONO2_TOGA = smk_obs.smk_iBuONO2and2BuONO2_TOGA.*0.5;

smk_C5H9O4N_UWCIMS = smk_obs.smk_C5H9O4N_UWCIMS;

smk_MBO_C5H10O_PTR = smk_obs.smk_3_methyl_2_butanone_C5H10O_PTR.*0.43;
smk_MBO_TOGA = smk_obs.smk_MBO_TOGA; 
smk_2_Pentanone_C5H10O_PTR = smk_obs.smk_3_methyl_2_butanone_C5H10O_PTR.*0.23;
smk_3_Pentanone_C5H10O_PTR = smk_obs.smk_3_methyl_2_butanone_C5H10O_PTR.*0.21;
smk_C5H10O3_UWCIMS = smk_obs.smk_C5H10O3_UWCIMS;

smk_phenol_C6H6O_PTR = smk_obs.smk_phenol_C6H6O_PTR;
smk_C6H6O_UWCIMS = smk_obs.smk_C6H6O_UWCIMS;
smk_Catechol_C6H6O2_PTR = smk_obs.smk_5_METHYLFURFURAL_C6H6O2_PTR.*0.5;

smk_Hexanones_C6H12O_PTR = smk_obs.smk_3_HEXANONE_C6H12O_PTR.*0.53;
smk_Hexanal_C6H12O_PTR = smk_obs.smk_3_HEXANONE_C6H12O_PTR.*0.47;

smk_benzaldehyde_C7H6O_PTR = smk_obs.smk_benzaldehyde_C7H6O_PTR;
smk_o_cresol_C7H8O_PTR = smk_obs.smk_o_cresol_C7H8O_PTR;
smk_guaiacol_C7H8O2_PTR = smk_obs.smk_guaiacol_C7H8O2_PTR;

smk_Heptanal_C7H14O_PTR = smk_obs.smk_heptanal_C7H14O_PTR.*0.63;
smk_heptanone_C7H14O_PTR = smk_obs.smk_heptanal_C7H14O_PTR.*0.37;

smk_styrene_C8H8_PTR = smk_obs.smk_styrene_C8H8_PTR;
smk_Styrene_TOGA = smk_obs.smk_Styrene_TOGA;

smk_tolualdehyde_C8H8O_PTR = smk_obs.smk_tolualdehyde_C8H8O_PTR;

smk_creosol_C8H10O2_PTR = smk_obs.smk_creosol_C8H10O2_PTR;
smk_syringol_C8H10O3_PTR = smk_obs.smk_syringol_C8H10O3_PTR;
smk_3_methylacetophenone_C9H10O_PTR = smk_obs.smk_3_methylacetophenone_C9H10O_PTR;

smk_Isopropylbenzene_AWAS = smk_obs.smk_Isopropylbenzene_AWAS;
smk_nPropylbenzene_AWAS = smk_obs.smk_nPropylbenzene_AWAS;
smk_x123Trimethylbenzene_AWAS = smk_obs.smk_x123Trimethylbenzene_AWAS;
smk_x124Trimethylbenzene_AWAS = smk_obs.smk_x124Trimethylbenzene_AWAS;
smk_x135Trimethylbenzene_AWAS = smk_obs.smk_x135Trimethylbenzene_AWAS;
smk_x2Ethyltoluene_AWAS = smk_obs.smk_x2Ethyltoluene_AWAS;
smk_x3Ethyltoluene_AWAS = smk_obs.smk_x3Ethyltoluene_AWAS;
smk_x4Ethyltoluene_AWAS = smk_obs.smk_x4Ethyltoluene_AWAS;

smk_C9H14O4_UWCIMS = smk_obs.smk_C9H14O4_UWCIMS;
smk_C10H16O3_UWCIMS = smk_obs.smk_C10H16O3_UWCIMS;

smk_C10_AROMATICS_C10H14_PTR = smk_obs.smk_C10_AROMATICS_C10H14_PTR;
smk_x13Diethylbenzene_AWAS = smk_obs.smk_x13Diethylbenzene_AWAS;
smk_x14Diethylbenzene_AWAS = smk_obs.smk_x14Diethylbenzene_AWAS;

smk_sesquiterpenes_C15H24_PTR = smk_obs.smk_sesquiterpenes_C15H24_PTR;

% + magic_args="remove bad data according to NOx"
smk_glycolaldehyde_C2H4O2_PTR(:, bad_point) = [];
smk_DMS_PTR(:, bad_point) = [];
smk_DMS_TOGA(:, bad_point) = [];
smk_DMS_AWAS(:, bad_point) = [];
smk_acrolein_C3H4O_PTR(:, bad_point) = [];
smk_Acrolein_TOGA(:, bad_point) = [];
smk_methyl_glyoxal_C3H4O2_PTR(:, bad_point) = [];
smk_PPN(:, bad_point) = [];
smk_Hydroxyacetone_C3H6O2_PTR(:, bad_point) = [];
smk_Methyl_acetate_C3H6O2_PTR(:, bad_point) = [];
smk_Ethyl_formate_C3H6O2_PTR(:, bad_point) = [];
smk_iPropONO2_TOGA(:, bad_point) = [];
smk_nPropONO2_TOGA(:, bad_point) = [];
smk_maleic_anhydride_C4H2O3_PTR(:, bad_point) = [];
smk_butadiene_C4H6_PTR(:, bad_point) = [];
smk_2_Butenal_C4H6O_PTR(:, bad_point) = [];
smk_2_3_butanedione_C4H6O2_PTR(:, bad_point) = [];
smk_iBuONO2_TOGA(:, bad_point) = [];
smk_nBuONO2_TOGA(:, bad_point) = [];
smk_C5H9O4N_UWCIMS(:, bad_point) = [];
smk_MBO_C5H10O_PTR(:, bad_point) = [];
smk_MBO_TOGA(:, bad_point) = [];
smk_2_Pentanone_C5H10O_PTR(:, bad_point) = [];
smk_3_Pentanone_C5H10O_PTR(:, bad_point) = [];
smk_C5H10O3_UWCIMS(:, bad_point) = [];
smk_phenol_C6H6O_PTR(:, bad_point) = [];
smk_C6H6O_UWCIMS(:, bad_point) = [];
smk_Catechol_C6H6O2_PTR(:, bad_point) = [];
smk_Hexanones_C6H12O_PTR(:, bad_point) = [];
smk_Hexanal_C6H12O_PTR(:, bad_point) = [];
smk_benzaldehyde_C7H6O_PTR(:, bad_point) = [];
smk_o_cresol_C7H8O_PTR(:, bad_point) = [];
smk_guaiacol_C7H8O2_PTR(:, bad_point) = [];
smk_Heptanal_C7H14O_PTR(:, bad_point) = [];
smk_heptanone_C7H14O_PTR(:, bad_point) = [];
smk_styrene_C8H8_PTR(:, bad_point) = [];
smk_Styrene_TOGA(:, bad_point) = [];
smk_tolualdehyde_C8H8O_PTR(:, bad_point) = [];
smk_creosol_C8H10O2_PTR(:, bad_point) = [];
smk_syringol_C8H10O3_PTR(:, bad_point) = [];
smk_3_methylacetophenone_C9H10O_PTR(:, bad_point) = [];
smk_Isopropylbenzene_AWAS(:, bad_point) = [];
smk_nPropylbenzene_AWAS(:, bad_point) = [];
smk_x123Trimethylbenzene_AWAS(:, bad_point) = [];
smk_x124Trimethylbenzene_AWAS(:, bad_point) = [];
smk_x135Trimethylbenzene_AWAS(:, bad_point) = [];
smk_x2Ethyltoluene_AWAS(:, bad_point) = [];
smk_x3Ethyltoluene_AWAS(:, bad_point) = [];
smk_x4Ethyltoluene_AWAS(:, bad_point) = [];
smk_C9H14O4_UWCIMS(:, bad_point) = [];
smk_C10H16O3_UWCIMS(:, bad_point) = [];
smk_C10_AROMATICS_C10H14_PTR(:, bad_point) = [];
smk_x13Diethylbenzene_AWAS(:, bad_point) = [];
smk_x14Diethylbenzene_AWAS(:, bad_point) = [];
smk_sesquiterpenes_C15H24_PTR(:, bad_point) = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Met data
% Note: tranpose may need to be conducted for model run
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Met input
Met = {...
    'P'             PRESSURE(starting_point:end)';...%pressure, mbar
    'T'             TEMPERATURE(starting_point:end)';...    %Temperature, K
    'RH'            RHUM(starting_point:end)';...    %Relative Humidity, percent    
    'kdil'          kdil;...    %dilution, /s kdil
    %%{
    'SZA'           SZA(starting_point:end)';... %solar zenith angle, missing!
    %%}
    %'SZA'           90;... %solar zenith angle, missing!
    };
% -
% This is used to check the high bias of isoprene decay in model simulations
% % GEOS-Chem
% disp(mean(GC_ISO1(TEMPERATURE, 1.7E-11, 3.90E2, 9.33E-2, 5.05E15, -1.22E4, 1.79E14, -8.830E3)));
% disp(mean(GC_ISO1(TEMPERATURE, 1.0E-11, 3.90E2, 2.26E-1, 2.22E9, -7.160E3, 1.75E14, -9.054E3)));
% disp(mean(GC_ISO2(TEMPERATURE, 1.7E-11, 3.90E2, 9.33E-2, 5.05E15, -1.22E4, 1.79E14, -8.830E3)));
% disp(mean(GC_ISO2(TEMPERATURE, 1.0E-11, 3.90E2, 2.26E-1, 2.22E9, -7.160E3, 1.75E14, -9.054E3)));
% disp(mean(GCARR_ac(TEMPERATURE, 2.95E-12, 450.0))); % kNO3 is biased high by one or two magnitude in the GEOS-Chem
% % MCM
% disp(mean(2.70e-11.*exp(390./TEMPERATURE)));
% disp(mean(1.03e-14.*exp(-1995./TEMPERATURE)));
% disp(mean(3.15e-12.*exp(-450./TEMPERATURE))); %MCM is good

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chemical compounds input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
InitConc = {...
%   names               conc(ppb)               HoldMe 
    %Inorganics
    'CO'                 smk_CO_QCL(starting_point).*scale_factor                0;...          % Peng
    %NOy 
    'NO'                 smk_NO(starting_point:end).*ScaleFacNOx                      0;...          % Peng
    'NO2'                smk_NO2(starting_point:end).*ScaleFacNOx                     0;...          % Peng
    'NO3'               0                                          0;...

    'O3'                 smk_O3(starting_point)                    0;...          % Peng
    'SO2'                smk_SO2_UWCIMS(starting_point)            0;...          % Peng
    'PAN'                smk_PAN(starting_point)                   0;...          % Peng
    'HNO3'               smk_HNO3_UWCIMS(starting_point)           0;...          % Peng, here we only include gas phase of HNO3 but Peng only includes particulate phase.

    'OH'                 smk_OH                                    OH_holder;...  % Peng
    'HO2'                smk_HO2                                   0;... %Lixu
    'H2O2'               0                                                                  0;... %OH source option #1

    % CxHy
    'CH4'                smk_Methane_PICARRO(starting_point).*scale_factor          0;... %Lixu
    'C2H2'               smk_CO_QCL(starting_point).*scale_factor.*3.50/1000.0     0;... %Lixu, 10/15/2022 checked, there is no values in AWAS, double check with Wade!!!
    'C2H6'              smk_CO_QCL(starting_point).*scale_factor.*10.3/1000.0       0;... %Lixu
        

    % Furans    
    'Furans'             smk_FURAN_C4H4O_PTR(starting_point).*scale_factor                                   0;... %Peng
    'Furfurals'          smk_2_FURALDEHYDE_C5H4O2_PTR(starting_point).*scale_factor                          0;... %Pen
};
disp('done, provide initial data');
InitNMVOC_names = InitConc(14:end, 1);

%%%%%%%%%%%%%%%%%
% chemistry
%%%%%%%%%%%%%%%%%
chemistry_provider;
disp('done, provide chemistry mechanism');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BKG concentration
% Task holder for custom data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DILUTION CONCENTRATIONS
% Background concentrations are taken from observations just outside the plume.
BkgdConc = {...
%   names               values
    'DEFAULT'           0                                  ;... %0 for all zeros, 1 to use InitConc
    
     %Inorganics
    'CO'                min(bkg_CO_QCL)                         ;...
    
    %NOy
    'NO'                min(bkg_NO)                             ;... 
    'NO2'               min(bkg_NO2)                            ;...
    
    'O3'                min(bkg_O3)                             ;... 
    'SO2'               min(bkg_SO2_UWCIMS)                     ;... 
    'PAN'               min(bkg_PAN)                            ;... 
    'HNO3'              min(bkg_HNO3_UWCIMS)                    ;...
    
    %'OH'               4.07e-5                            ;...  % Assuming 1e6/1e8 molec cm-3 for OH and HO2 (see Stone et al., 2012; convert into ppb by dividing 2.46e10 (http://tinyurl.com/ac-cheat2 
    %'HO2'              4.07e-3                            ;... % check with F0AM developer
    %'H2O2'             4e-4                               ;... 

    % CxHy
    'CH4'               min(bkg_Methane_PICARRO)                ;...
    
    'C2H2'              min(bkg_Ethyne_AWAS)                    ;...% 
};

disp('done, provide background values for dilution');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model options and model run
% IntTime and SavePath need to be customized 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS
%{
"Verbose" can be set from 0-3; this just affects the level of detail printed to the command
  window regarding model progress.
"EndPointsOnly" is set to 0 because we want output to include all concentrations along each model step.
"LinkSteps" is set to 1 because each step is connected.
"IntTime" is the integration time for each step. The average for constraints is 250s.
"SavePath" is just a filename, which will be saved by default in the \Runs\ folder.
%}
ModelOptions.Verbose = 1;         %flag for verbose output
ModelOptions.EndPointsOnly = 0;   %flag for concentration and rate outputs
ModelOptions.LinkSteps = 1;       %flag for using end-points of one run to initialize next run
ModelOptions.FixNOx = 1;                        %to be consistent with Rickly et al. (2022) Colorado front range study.
ModelOptions.IntTime = Int_time;       %integration time for each step, seconds. This needs to be customized
%prefix = '/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/WE-CAN/'; %dummy for plotting
prefix = '';
ModelOptions.SavePath = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/WE-CAN/output_data/WECAN_', MECHANISM, Flight_ID];
disp('done, provide model options.');

% + magic_args="MODEL RUN"
% Now we call the model. Note this may take several minutes to run, depending on your system.
% Output will be saved in the "SavePath" above and will also be written to the structure S.
% Let's also throw away the inputs (don't worry, they are saved in the output structure).
S = F0AM_ModelCore(Met,InitConc,ChemFiles,BkgdConc,ModelOptions);
disp('done, finish the run of the model.');

exit()

% save out the lifetime
result = lifetime_all(S, 1, Flight_ID, MECHANISM);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting and data analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set some needed variables for plotting
% Time
obs_time = Age_physical_avg_min.*60 - Age_physical_avg_min(starting_point).*60;
mod_time = S.Time;
smk_CO = smk_CO_QCL;
smk_O3 = smk_O3;
smk_NO = smk_NO;
smk_NO2= smk_NO2;

%plotting_comp;
disp('done, finish the figure plotting.');

%{
% PNs, including PAN
PNs = SearchSMILES('peroxyNitrate',S.Cnames,'v331'); %peroxy nitrates
iPNs    = PNs.index;
PNs     = ExtractSpecies(iPNs,S);
PNs_names = fieldnames(PNs);
disp(length(PNs_names));

% ANs
ANs = SearchSMILES('alkylNitrate',S.Cnames,'v331'); %alkyl nitrates
iANs    = ANs.index;
ANs     = ExtractSpecies(iANs,S);
ANs_names = fieldnames(ANs);
disp(length(ANs_names));
%}
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Checking init. NOx
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Init NOx
disp('This is init NOx conc!')
disp(smk_NO(starting_point) + smk_NO2(starting_point));
% Init OHR
PlotReactivity('OH',S,InitNMVOC_names,'cmapname', 'jet', 'saveout', 1, 'VOCR_', Flight_ID, MECHANISM);
% Init CO
disp('This is init CO conc!')
disp(smk_CO(starting_point));

%%%%%%%%%%%%%%%%
% Reaction rates
%%%%%%%%%%%%%%%%
% ---
% test
% ---
%{
PlotRates(nFURAN,S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'Furan_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_Furan_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates(nM2FURAN,S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'M2FURAN_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_M2FURAN_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates(nDIMEFURAN,S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'DIMEFURAN_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_DIMEFURAN_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates(nFURFURAL,S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'Furfural_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_Furfural_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

PlotRatesAvg(nFURAN,S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_Fuan_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg(nM2FURAN,S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_Fuan_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg(nDIMEFURAN,S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_Fuan_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg(nFURFURAL,S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_Fuan_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
%}
%{
PlotRates('MALDIAL',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'MALDIAL_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_MALDIAL_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates('C5DICARB',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'C5DICARB_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_C5DICARB_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates('C4DBDIKET',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'C4DBDIKET_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_C4DBDIKET_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

PlotRatesAvg('MALDIAL',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_MALDIAL_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('C5DICARB',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_C5DICARB_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('C4DBDIKET',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_C4DBDIKET_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
%}

%{
PlotRates('HYDFURANO2',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'HYDFURANO2_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_HYDFURANO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates('HYDMEFURANO2',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'HYDMEFURANO2_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_HYDMEFURANO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates('C5DICARBO2',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'C5DICARBO2_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_C5DICARBO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates('HYDDIMEFURANO2',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'HYDDIMEFURANO2_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_HYDDIMEFURANO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

PlotRatesAvg('HYDFURANO2',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_HYDFURANO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('HYDMEFURANO2',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_HYDMEFURANO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('C5DICARBO2',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_C5DICARBO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('HYDDIMEFURANO2',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_HYDDIMEFURANO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
%}
%{
PlotRates('BZFUONE',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'BZFUONE_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_BZFUONE_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates('TLFUONE',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'TLFUONE_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_TLFUONE_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

PlotRatesAvg('BZFUONE',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_BZFUONE_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('TLFUONE',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_TLFUONE_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
%}
%{
PlotRates('MALDIALCO3',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'MALDIALCO3_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_MALDIALCO3_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates('C5CO14O2',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'C5CO14O2_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_C5CO14O2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

PlotRatesAvg('MALDIALCO3',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_MALDIALCO3_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('C5CO14O2',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_C5CO14O2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
%}
%{
PlotRates('MALDALCO2H',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'MALDALCO2H_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_MALDALCO2H_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates('C5CO14OH',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'C5CO14OH_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_C5CO14OH_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

PlotRatesAvg('MALDALCO2H',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_MALDALCO2H_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('C5CO14OH',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_C5CO14OH_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
%}
%{
PlotRates('BZFUO2',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'BZFUO2_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_BZFUO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRates('TLFUO2',S,1000,'sumEq',1,'scale',1, 'saveout', 1, 'TLFUO2_rates_', Flight_ID, MECHANISM)
fileoutput = [prefix, 'figures/', Flight_ID, '_TLFUO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('BZFUO2',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_BZFUO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
PlotRatesAvg('TLFUO2',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_TLFUO2_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
%}




% Test...
PlotRatesAvg('HCOCOHCO3',S,5)
fileoutput = [prefix, 'figures/', Flight_ID, '_HCOCOHCO3_rates_', MECHANISM, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed


exit()

Save_rates;
