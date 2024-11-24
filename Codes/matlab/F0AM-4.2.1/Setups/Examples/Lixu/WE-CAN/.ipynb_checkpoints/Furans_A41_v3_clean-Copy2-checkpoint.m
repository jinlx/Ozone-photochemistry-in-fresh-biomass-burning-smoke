% This example is for the use of all available mechanisms.
%   Because some of the mechanisms use different names for species and J-values, there are some
%   switch-case statements that would not be needed if doing this with a single mechanism.
clear
if length(dbstack)==1 %only execute if top-level (skip if called from ExampleSetup_MechCompare.m)
    clear
    MECHANISM = 'GCv13_base'; 
    %MECHANISM = 'GCv13_JINF'; 
    MECHANISM = 'GCv13_SIYUANF'; 
    %MECHANISM = 'MCMv331_base'; 
    %MECHANISM = 'MCMv331_GCvocs'; 
    %MECHANISM = 'MCMv331_GCvocsF'; 
    % choices are GCv13_base, GCv13_JINF, MCMv331_base, MCMv331_GCvocs 
    makeplots = 0; %flag 0 or 1 for making plots after run
end
MECHANISM = 'GCv13_base'; 
%MECHANISM = 'GCv13_JINF'; 
%MECHANISM = 'GCv13_JINF_HCOOH'; 

%MECHANISM = 'MCMv331_base'; 
%MECHANISM = 'MCMv331_GCvocs'; 
%MECHANISM = 'MCMv331_GCvocsF'; 

% Task holder: one run for all flights.
% ========================================================================================================
% load and read observations
% including meteorolgy, photolysis rates, plume age product, chemical compounds and bkg
% ========================================================================================================
%{
We will use observations taken on C130 and DC8 in the western US during 2018 WE-CAN and 2019 FIREX-AQ.
Data haven't been averaged to 1 minute and have been filtered for NaN/negatives (task holder later?). 
The time vector in this structure is "UTC_mid" and is in UTC seconds of day.
%}
% load data
% ==========
% MET
% ===========
Flight_ID = 'RF03'
met_obs = load(['/glade/work/lixujin/PYTHON/F0AM/Dataprocess/output_data/mat/', Flight_ID, '_met.mat']);

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
kdil = met_obs.kdul(1);

% ===============
% background data
% ===============
bkg_obs = load(['/glade/work/lixujin/PYTHON/F0AM/Dataprocess/output_data/mat/', Flight_ID, '_bkg.mat']);
% inorganic
bkg_NO = bkg_obs.bkg_NO;
bkg_NO2 = bkg_obs.bkg_NO2;
bkg_O3 = bkg_obs.bkg_O3;
bkg_HONO_UWCIMS = bkg_obs.bkg_HONO_UWCIMS;
bkg_HONO_HNO2_PTR = bkg_obs.bkg_HONO_HNO2_PTR; % not sure what it is...
bkg_CO_QCL = bkg_obs.bkg_CO_QCL;
bkg_PAN_ppb = bkg_obs.bkg_PAN_ppb;
bkg_HCN_UWCIMS = bkg_obs.bkg_HCN_UWCIMS;
bkg_Methane_PICARRO = bkg_obs.bkg_Methane_PICARRO;
%{
Missing data
PICARRO： CO2, CO
CIMS： HNO3, HCl
orgN
NO3_AMS
PPN
SO2
%}

% CxHy 
% ethane missing
% missing AWAS data: Ethyne_AWAS, Ethane_AWAS, Propane_AWAS, Isobutane_AWAS, nPentane_AWAS, Hexane_AWAS,
% x24Dimethylpentane_AWAS, Ethene_AWAS, Propylene_AWAS, x1Butene_AWAS, transx2butene_AWAS, cisx2butene_AWAS

bkg_propane_PTR = bkg_obs.bkg_propane_PTR;
bkg_ethene_C2H4_PTR = bkg_obs.bkg_ethene_C2H4_PTR;
bkg_propene_C3H6_PTR = bkg_obs.bkg_propene_C3H6_PTR;
bkg_1_BUTENE_PTR = bkg_obs.bkg_1_BUTENE_PTR;
bkg_pentene_C5H10_PTR = bkg_obs.bkg_pentene_C5H10_PTR;

% Aldehdyes, MISSING bkg_heptanal_C7H14O_PTR, bkg_decanal_C10H20O_PTR
bkg_formaldehyde_CH2O_PTR = bkg_obs.bkg_formaldehyde_CH2O_PTR;
bkg_ACETALDEHYDE_C2H4O_PTR = bkg_obs.bkg_ACETALDEHYDE_C2H4O_PTR;
bkg_PROPANAL_C3H6O_PTR = bkg_obs.bkg_ACETONE_C3H6O_PTR.*0.22; % 22/78 propanal and acetone
bkg_BUTANAL_C4H8O_PTR = bkg_obs.bkg_MEK_C4H8O_PTR.*0.2; %20/80 butanal and MEK
bkg_pentanal_C5H10O_PTR = bkg_obs.bkg_3_methyl_2_butanone_C5H10O_PTR.*0.2; % assuming 20/80 as well, ask Wade, missing pentanal
bkg_butenal_C4H6O_PTR = bkg_obs.bkg_MACR_MVK_C4H6O_PTR.*0.12;
bkg_glyoxal_C2H2O2_PTR = bkg_obs.bkg_glyoxal_C2H2O2_PTR;

% Aldehyde or isomer
bkg_acetic_anhydride_C4H6O3_PTR = bkg_obs.bkg_acetic_anhydride_C4H6O3_PTR;
bkg_methyl_methacrylate_C5H8O2_PTR = bkg_obs.bkg_methyl_methacrylate_C5H8O2_PTR;
bkg_2_5_dihydroxymethyl_dihydrofurfural_C5H8O3_PTR = bkg_obs.bkg_2_5_dihydroxymethyl_dihydrofurfural_C5H8O3_PTR;

% Aromatics
bkg_BENZENE_C6H6_PTR = bkg_obs.bkg_BENZENE_C6H6_PTR;
bkg_TOLUENE_C7H8_PTR = bkg_obs.bkg_TOLUENE_C7H8_PTR;
bkg_C8_AROMATICS_C8H10_PTR = bkg_obs.bkg_C8_AROMATICS_C8H10_PTR;
bkg_mpXYLENES_C8H10_PTR = bkg_obs.bkg_C8_AROMATICS_C8H10_PTR*0.47;
bkg_oXYLENES_C8H10_PTR = bkg_obs.bkg_C8_AROMATICS_C8H10_PTR*0.18;
bkg_etBENZENE_C8H10_PTR = bkg_obs.bkg_C8_AROMATICS_C8H10_PTR*0.35;
bkg_C9_AROMATICS_C9H12_PTR = bkg_obs.bkg_C9_AROMATICS_C9H12_PTR;
bkg_C10_AROMATICS_C10H14_PTR = bkg_obs.bkg_C10_AROMATICS_C10H14_PTR;
bkg_C11_aromatics_C11H16_PTR = bkg_obs.bkg_C11_aromatics_C11H16_PTR;
bkg_C12_aromatics_C12H18_PTR = bkg_obs.bkg_C12_aromatics_C12H18_PTR;
bkg_benzaldehyde_C7H6O_PTR = bkg_obs.bkg_benzaldehyde_C7H6O_PTR;

% Phenols
bkg_C6H6O_UWCIMS = bkg_obs.bkg_C6H6O_UWCIMS; % phenol
bkg_guaiacol_C7H8O2_PTR = bkg_obs.bkg_guaiacol_C7H8O2_PTR;
bkg_o_cresol_C7H8O_PTR = bkg_obs.bkg_o_cresol_C7H8O_PTR;
bkg_creosol_C8H10O2_PTR = bkg_obs.bkg_creosol_C8H10O2_PTR; 

bkg_phenol_C6H6O_PTR = bkg_obs.bkg_phenol_C6H6O_PTR;
bkg_5_hydroxymethyl_2_furfural_C6H6O3_PTR = bkg_obs.bkg_5_hydroxymethyl_2_furfural_C6H6O3_PTR;
bkg_syringol_C8H10O3_PTR = bkg_obs.bkg_syringol_C8H10O3_PTR;
bkg_styrene_C8H8_PTR = bkg_obs.bkg_styrene_C8H8_PTR;

% Furan related
bkg_FURAN_C4H4O_PTR = bkg_obs.bkg_FURAN_C4H4O_PTR;
bkg_2_METHYLFURAN_C5H6O_PTR = bkg_obs.bkg_2_METHYLFURAN_C5H6O_PTR;
bkg_2_5_dimethyl_furan_C6H8O = bkg_obs.bkg_2_5_dimethyl_furan_C6H8O;
bkg_2_FURALDEHYDE_C5H4O2_PTR = bkg_obs.bkg_2_FURALDEHYDE_C5H4O2_PTR; % missing furfural? % Missing M3F as well
bkg_5_METHYLFURFURAL_C6H6O2_PTR = bkg_obs.bkg_5_METHYLFURFURAL_C6H6O2_PTR; % discussed needed for catechol/methylfurfural distribution, missing

bkg_maleic_anhydride_C4H2O3_PTR = bkg_obs.bkg_maleic_anhydride_C4H2O3_PTR;

bkg_2_3H_furanone_C4H4O2_PTR = bkg_obs.bkg_2_3H_furanone_C4H4O2_PTR;
bkg_dihydro_furandione_C4H4O3_PTR = bkg_obs.bkg_dihydro_furandione_C4H4O3_PTR;
bkg_2_furanmethanol_C5H6O2_PTR = bkg_obs.bkg_2_furanmethanol_C5H6O2_PTR;
bkg_5_hydroxymethyl_2_3H_furanone_C5H6O3_PTR = bkg_obs.bkg_5_hydroxymethyl_2_3H_furanone_C5H6O3_PTR;
bkg_2_hydroxy_3_methyl_2_cyclopenten_1_one_C6H8O2_PTR = bkg_obs.bkg_2_hydroxy_3_methyl_2_cyclopenten_1_one_C6H8O2_PTR;

% Biogenic VOCs
bkg_ISOPRENE_C5H8_PTR = bkg_obs.bkg_ISOPRENE_C5H8_PTR;

bkg_MVK_C4H6O_PTR = bkg_obs.bkg_MACR_MVK_C4H6O_PTR.*0.58;
bkg_MACR_C4H6O_PTR = bkg_obs.bkg_MACR_MVK_C4H6O_PTR.*0.29;

bkg_MONOTERPENES_C10H16_PTR = bkg_obs.bkg_MONOTERPENES_C10H16_PTR;
bkg_camphene_C10H16_PTR = bkg_obs.bkg_MONOTERPENES_C10H16_PTR.*0.37;
bkg_apinene_C10H16_PTR = bkg_obs.bkg_MONOTERPENES_C10H16_PTR.*0.32;
bkg_bpinene_C10H16_PTR = bkg_obs.bkg_MONOTERPENES_C10H16_PTR.*0.21;
bkg_tricyclene_C10H16_PTR = bkg_obs.bkg_MONOTERPENES_C10H16_PTR.*0.06;

bkg_sesquiterpenes_C15H24_PTR = bkg_obs.bkg_sesquiterpenes_C15H24_PTR;
bkg_cyclopentanone_C5H8O_PTR = bkg_obs.bkg_cyclopentanone_C5H8O_PTR;

% Alcohols
bkg_METHANOL_CH3OH_PTR = bkg_obs.bkg_METHANOL_CH3OH_PTR;
bkg_ETHANOL_C2H6O_PTR = bkg_obs.bkg_ETHANOL_C2H6O_PTR;

% Organic acids
bkg_CH2O2_UWCIMS = bkg_obs.bkg_CH2O2_UWCIMS; % formic acid
bkg_formic_acid_CH2O2_PTR = bkg_obs.bkg_formic_acid_CH2O2_PTR;
bkg_acetic_acid_C2H4O2_PTR = bkg_obs.bkg_acetic_acid_C2H4O2_PTR; %  glycolaldehyde (GLYC) and acetic acid distribution, GLYC needs to be added later, missing!

bkg_propiolic_acid_C3H2O2_PTR = bkg_obs.bkg_propiolic_acid_C3H2O2_PTR;
bkg_isocyanic_acid_HNCO_PTR = bkg_obs.bkg_isocyanic_acid_HNCO_PTR;
bkg_methyl_benzoic_acid_C8H8O2_PTR = bkg_obs.bkg_methyl_benzoic_acid_C8H8O2_PTR;

% Ketone
bkg_ACETONE_C3H6O_PTR = bkg_obs.bkg_ACETONE_C3H6O_PTR.*0.78; % 22/78 propanal and acetone
bkg_MEK_C4H8O_PTR = bkg_obs.bkg_MEK_C4H8O_PTR.*0.8; %20/80 butanal and MEK
bkg_3_HEXANONE_C6H12O_PTR = bkg_obs.bkg_3_HEXANONE_C6H12O_PTR;

% C3-C5 reactive VOCs beyond above
bkg_butadiene_C4H6_PTR = bkg_obs.bkg_butadiene_C4H6_PTR;
bkg_acrolein_C3H4O_PTR = bkg_obs.bkg_acrolein_C3H4O_PTR;
bkg_hydroxyacetone_C3H6O2_PTR = bkg_obs.bkg_hydroxyacetone_C3H6O2_PTR; % HAC
bkg_methyl_glyoxal_C3H4O2_PTR = bkg_obs.bkg_methyl_glyoxal_C3H4O2_PTR;
bkg_pyruvic_acid_C3H4O3_PTR = bkg_obs.bkg_pyruvic_acid_C3H4O3_PTR;
bkg_2_3_butanedione_C4H6O2_PTR = bkg_obs.bkg_2_3_butanedione_C4H6O2_PTR; % ketone (dicarbonyl)
bkg_methyl_propanoate_C4H8O2_PTR = bkg_obs.bkg_methyl_propanoate_C4H8O2_PTR;

% missing UWCIMS measurement PPN, C5H10O3, C5H9O4N, C9H14O4, C10H16O3, C6H10O5
% ===============
% smoke data
% ===============
smk_obs = load(['/glade/work/lixujin/PYTHON/F0AM/Dataprocess/output_data/mat/', Flight_ID, '_smk.mat']);
% inorganic
smk_NO = smk_obs.smk_NO;
smk_NO2 = smk_obs.smk_NO2;
smk_O3 = smk_obs.smk_O3;
smk_HONO_UWCIMS = smk_obs.smk_HONO_UWCIMS;
smk_HONO_HNO2_PTR = smk_obs.smk_HONO_HNO2_PTR; % not sure what it is...
smk_CO_QCL = smk_obs.smk_CO_QCL;
smk_PAN_ppb = smk_obs.smk_PAN_ppb;
smk_HCN_UWCIMS = smk_obs.smk_HCN_UWCIMS;
smk_Methane_PICARRO = smk_obs.smk_Methane_PICARRO;
%{
Missing data
PICARRO： CO2, CO
CIMS： HNO3, HCl
orgN
NO3_AMS
PPN
SO2
%}

% CxHy 
% ethane missing
smk_propane_PTR = smk_obs.smk_propane_PTR;
smk_ethene_C2H4_PTR = smk_obs.smk_ethene_C2H4_PTR;
smk_propene_C3H6_PTR = smk_obs.smk_propene_C3H6_PTR;
smk_1_BUTENE_PTR = smk_obs.smk_1_BUTENE_PTR;
smk_pentene_C5H10_PTR = smk_obs.smk_pentene_C5H10_PTR;

% Aldehdyes, MISSING smk_heptanal_C7H14O_PTR, smk_decanal_C10H20O_PTR
smk_formaldehyde_CH2O_PTR = smk_obs.smk_formaldehyde_CH2O_PTR;
smk_ACETALDEHYDE_C2H4O_PTR = smk_obs.smk_ACETALDEHYDE_C2H4O_PTR;
smk_PROPANAL_C3H6O_PTR = smk_obs.smk_ACETONE_C3H6O_PTR.*0.22; % 22/78 propanal and acetone
smk_BUTANAL_C4H8O_PTR = smk_obs.smk_MEK_C4H8O_PTR.*0.2; %20/80 butanal and MEK
smk_pentanal_C5H10O_PTR = smk_obs.smk_3_methyl_2_butanone_C5H10O_PTR.*0.2; % assuming 20/80 as well, ask Wade, missing pentanal
smk_butenal_C4H6O_PTR = smk_obs.smk_MACR_MVK_C4H6O_PTR.*0.12;
smk_glyoxal_C2H2O2_PTR = smk_obs.smk_glyoxal_C2H2O2_PTR;

% Aldehyde or isomer
smk_acetic_anhydride_C4H6O3_PTR = smk_obs.smk_acetic_anhydride_C4H6O3_PTR;
smk_methyl_methacrylate_C5H8O2_PTR = smk_obs.smk_methyl_methacrylate_C5H8O2_PTR;
smk_2_5_dihydroxymethyl_dihydrofurfural_C5H8O3_PTR = smk_obs.smk_2_5_dihydroxymethyl_dihydrofurfural_C5H8O3_PTR;

% Aromatics
smk_BENZENE_C6H6_PTR = smk_obs.smk_BENZENE_C6H6_PTR;
smk_TOLUENE_C7H8_PTR = smk_obs.smk_TOLUENE_C7H8_PTR;
smk_C8_AROMATICS_C8H10_PTR = smk_obs.smk_C8_AROMATICS_C8H10_PTR;
smk_mpXYLENES_C8H10_PTR = smk_obs.smk_C8_AROMATICS_C8H10_PTR*0.47;
smk_oXYLENES_C8H10_PTR = smk_obs.smk_C8_AROMATICS_C8H10_PTR*0.18;
smk_etBENZENE_C8H10_PTR = smk_obs.smk_C8_AROMATICS_C8H10_PTR*0.35;
smk_C9_AROMATICS_C9H12_PTR = smk_obs.smk_C9_AROMATICS_C9H12_PTR;
smk_C10_AROMATICS_C10H14_PTR = smk_obs.smk_C10_AROMATICS_C10H14_PTR;
smk_C11_aromatics_C11H16_PTR = smk_obs.smk_C11_aromatics_C11H16_PTR;
smk_C12_aromatics_C12H18_PTR = smk_obs.smk_C12_aromatics_C12H18_PTR;
smk_benzaldehyde_C7H6O_PTR = smk_obs.smk_benzaldehyde_C7H6O_PTR;

% Phenols
smk_C6H6O_UWCIMS = smk_obs.smk_C6H6O_UWCIMS; % phenol
smk_guaiacol_C7H8O2_PTR = smk_obs.smk_guaiacol_C7H8O2_PTR;
smk_o_cresol_C7H8O_PTR = smk_obs.smk_o_cresol_C7H8O_PTR;
smk_creosol_C8H10O2_PTR = smk_obs.smk_creosol_C8H10O2_PTR; 

smk_phenol_C6H6O_PTR = smk_obs.smk_phenol_C6H6O_PTR;
smk_5_hydroxymethyl_2_furfural_C6H6O3_PTR = smk_obs.smk_5_hydroxymethyl_2_furfural_C6H6O3_PTR;
smk_syringol_C8H10O3_PTR = smk_obs.smk_syringol_C8H10O3_PTR;
smk_styrene_C8H8_PTR = smk_obs.smk_styrene_C8H8_PTR;

% Furan related
smk_FURAN_C4H4O_PTR = smk_obs.smk_FURAN_C4H4O_PTR;
smk_2_METHYLFURAN_C5H6O_PTR = smk_obs.smk_2_METHYLFURAN_C5H6O_PTR;
smk_2_5_dimethyl_furan_C6H8O = smk_obs.smk_2_5_dimethyl_furan_C6H8O;
smk_2_FURALDEHYDE_C5H4O2_PTR = smk_obs.smk_2_FURALDEHYDE_C5H4O2_PTR; % missing furfural? % Missing M3F as well
smk_5_METHYLFURFURAL_C6H6O2_PTR = smk_obs.smk_5_METHYLFURFURAL_C6H6O2_PTR; % discussed needed for catechol/methylfurfural distribution, missing

smk_maleic_anhydride_C4H2O3_PTR = smk_obs.smk_maleic_anhydride_C4H2O3_PTR;

smk_2_3H_furanone_C4H4O2_PTR = smk_obs.smk_2_3H_furanone_C4H4O2_PTR;
smk_dihydro_furandione_C4H4O3_PTR = smk_obs.smk_dihydro_furandione_C4H4O3_PTR;
smk_2_furanmethanol_C5H6O2_PTR = smk_obs.smk_2_furanmethanol_C5H6O2_PTR;
smk_5_hydroxymethyl_2_3H_furanone_C5H6O3_PTR = smk_obs.smk_5_hydroxymethyl_2_3H_furanone_C5H6O3_PTR;
smk_2_hydroxy_3_methyl_2_cyclopenten_1_one_C6H8O2_PTR = smk_obs.smk_2_hydroxy_3_methyl_2_cyclopenten_1_one_C6H8O2_PTR;

% Biogenic VOCs
smk_ISOPRENE_C5H8_PTR = smk_obs.smk_ISOPRENE_C5H8_PTR;

smk_MVK_C4H6O_PTR = smk_obs.smk_MACR_MVK_C4H6O_PTR.*0.58;
smk_MACR_C4H6O_PTR = smk_obs.smk_MACR_MVK_C4H6O_PTR.*0.29;

smk_MONOTERPENES_C10H16_PTR = smk_obs.smk_MONOTERPENES_C10H16_PTR;
smk_camphene_C10H16_PTR = smk_obs.smk_MONOTERPENES_C10H16_PTR.*0.37;
smk_apinene_C10H16_PTR = smk_obs.smk_MONOTERPENES_C10H16_PTR.*0.32;
smk_bpinene_C10H16_PTR = smk_obs.smk_MONOTERPENES_C10H16_PTR.*0.21;
smk_tricyclene_C10H16_PTR = smk_obs.smk_MONOTERPENES_C10H16_PTR.*0.06;

smk_sesquiterpenes_C15H24_PTR = smk_obs.smk_sesquiterpenes_C15H24_PTR;
smk_cyclopentanone_C5H8O_PTR = smk_obs.smk_cyclopentanone_C5H8O_PTR;

% Alcohols
smk_METHANOL_CH3OH_PTR = smk_obs.smk_METHANOL_CH3OH_PTR;
smk_ETHANOL_C2H6O_PTR = smk_obs.smk_ETHANOL_C2H6O_PTR;

% Organic acids
smk_CH2O2_UWCIMS = smk_obs.smk_CH2O2_UWCIMS; % formic acid
smk_formic_acid_CH2O2_PTR = smk_obs.smk_formic_acid_CH2O2_PTR;
smk_acetic_acid_C2H4O2_PTR = smk_obs.smk_acetic_acid_C2H4O2_PTR; %  glycolaldehyde (GLYC) and acetic acid distribution, GLYC needs to be added later, missing!

smk_propiolic_acid_C3H2O2_PTR = smk_obs.smk_propiolic_acid_C3H2O2_PTR;
smk_isocyanic_acid_HNCO_PTR = smk_obs.smk_isocyanic_acid_HNCO_PTR;
smk_methyl_benzoic_acid_C8H8O2_PTR = smk_obs.smk_methyl_benzoic_acid_C8H8O2_PTR;

% Ketone
smk_ACETONE_C3H6O_PTR = smk_obs.smk_ACETONE_C3H6O_PTR.*0.78; % 22/78 propanal and acetone
smk_MEK_C4H8O_PTR = smk_obs.smk_MEK_C4H8O_PTR.*0.8; %20/80 butanal and MEK
smk_3_HEXANONE_C6H12O_PTR = smk_obs.smk_3_HEXANONE_C6H12O_PTR;

% C3-C5 reactive VOCs beyond above
smk_butadiene_C4H6_PTR = smk_obs.smk_butadiene_C4H6_PTR;
smk_acrolein_C3H4O_PTR = smk_obs.smk_acrolein_C3H4O_PTR;
smk_hydroxyacetone_C3H6O2_PTR = smk_obs.smk_hydroxyacetone_C3H6O2_PTR; % HAC
smk_methyl_glyoxal_C3H4O2_PTR = smk_obs.smk_methyl_glyoxal_C3H4O2_PTR;
smk_pyruvic_acid_C3H4O3_PTR = smk_obs.smk_pyruvic_acid_C3H4O3_PTR;
smk_2_3_butanedione_C4H6O2_PTR = smk_obs.smk_2_3_butanedione_C4H6O2_PTR; % ketone (dicarbonyl)
smk_methyl_propanoate_C4H8O2_PTR = smk_obs.smk_methyl_propanoate_C4H8O2_PTR;
