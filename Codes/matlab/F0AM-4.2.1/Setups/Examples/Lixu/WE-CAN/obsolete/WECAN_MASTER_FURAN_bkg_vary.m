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
Flight_ID = 'RF03';

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
kdil = met_obs.kdil(1); % Doesn't matter much for RF03

smk_OH  = 1.0e-4;% Assuming ~2e6/1e8 molec cm-3 for OH and HO2 (see Stone et al., 2012; Liao et al., 2021); convert into ppb by dividing 2.46e10 (http://tinyurl.com/ac-cheat2)
smk_HO2 = 4.07e-3;
OH_holder = 0;

% ===============
% bkg data
% ===============
bkg_obs = load(['/glade/work/lixujin/PYTHON/F0AM/Dataprocess/output_data/mat/', Flight_ID, '_bkg.mat']);

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

bkg_C8_AROMATICS_C8H10_PTR = bkg_obs.bkg_C8_AROMATICS_C8H10_PTR;
bkg_Ethyl_benzene_C8H10_PTR = bkg_C8_AROMATICS_C8H10_PTR.*0.36;
bkg_mpXylenes_C8H10_PTR = bkg_C8_AROMATICS_C8H10_PTR.*0.46;
bkg_oXylene_C8H10_PTR = bkg_C8_AROMATICS_C8H10_PTR.*0.18;
bkg_oXylene_TOGA = bkg_obs.bkg_oXylene_TOGA;
bkg_mpXylene_TOGA = bkg_obs.bkg_mpXylene_TOGA;


bkg_oXylene_AWAS = bkg_obs.bkg_oXylene_AWAS;
bkg_mpXylene_AWAS = bkg_obs.bkg_mpXylene_AWAS;
bkg_Ethylbenzene_AWAS = bkg_obs.bkg_Ethylbenzene_AWAS;

% Formic acid
bkg_formic_acid_CH2O2_PTR = bkg_obs.bkg_formic_acid_CH2O2_PTR;
bkg_CH2O2_UWCIMS = bkg_obs.bkg_CH2O2_UWCIMS;

bkg_acetic_acid_C2H4O2_PTR = bkg_obs.bkg_acetic_acid_C2H4O2_PTR.*0.67;

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
bkg_ACETONE_C3H6O_PTR = bkg_obs.bkg_ACETONE_C3H6O_PTR.*0.83;
bkg_Acetone_TOGA  = bkg_obs.bkg_Acetone_TOGA;
bkg_Acetone_AWAS = bkg_obs.bkg_Acetone_AWAS;

bkg_MEK_C4H8O_PTR = bkg_obs.bkg_MEK_C4H8O_PTR.*0.85;
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

bkg_5_METHYLFURFURAL_C6H6O2_PTR = bkg_obs.bkg_5_METHYLFURFURAL_C6H6O2_PTR.*0.5;


% others
bkg_glycolaldehyde_C2H4O2_PTR = bkg_obs.bkg_acetic_acid_C2H4O2_PTR.*0.33;

bkg_DMS_PTR = bkg_obs.bkg_DMS_PTR;
bkg_DMS_TOGA = bkg_obs.bkg_DMS_TOGA;
bkg_DMS_AWAS = bkg_obs.bkg_DMS_AWAS;
bkg_acrolein_C3H4O_PTR = bkg_obs.bkg_acrolein_C3H4O_PTR;
bkg_Acrolein_TOGA = bkg_obs.bkg_Acrolein_TOGA;
bkg_methyl_glyoxal_C3H4O2_PTR = bkg_obs.bkg_methyl_glyoxal_C3H4O2_PTR;

bkg_PPN = bkg_obs.bkg_PPN;
bkg_hydroxyacetone_C3H6O2_PTR = bkg_obs.bkg_hydroxyacetone_C3H6O2_PTR.*0.51;
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

bkg_heptanal_C7H14O_PTR = bkg_obs.bkg_heptanal_C7H14O_PTR.*0.63;
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
smk_obs = load(['/glade/work/lixujin/PYTHON/F0AM/Dataprocess/output_data/mat/', Flight_ID, '_smk.mat']);

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

% Formic acid
smk_formic_acid_CH2O2_PTR = smk_obs.smk_formic_acid_CH2O2_PTR;
smk_CH2O2_UWCIMS = smk_obs.smk_CH2O2_UWCIMS;

smk_acetic_acid_C2H4O2_PTR = smk_obs.smk_acetic_acid_C2H4O2_PTR.*0.67;

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


% alcohols
smk_METHANOL_CH3OH_PTR = smk_obs.smk_METHANOL_CH3OH_PTR;
smk_CH3OH_TOGA = smk_obs.smk_CH3OH_TOGA;

smk_ETHANOL_C2H6O_PTR = smk_obs.smk_ETHANOL_C2H6O_PTR;
smk_C2H5OH_TOGA = smk_obs.smk_C2H5OH_TOGA;
smk_iPropanol_TOGA = smk_obs.smk_iPropanol_TOGA;


% ketones
smk_ACETONE_C3H6O_PTR = smk_obs.smk_ACETONE_C3H6O_PTR.*0.83;
smk_Acetone_TOGA  = smk_obs.smk_Acetone_TOGA;
smk_Acetone_AWAS = smk_obs.smk_Acetone_AWAS;

smk_MEK_C4H8O_PTR = smk_obs.smk_MEK_C4H8O_PTR.*0.85;
smk_MEK_TOGA = smk_obs.smk_MEK_TOGA;
smk_MEK_AWAS = smk_obs.smk_MEK_AWAS;

% furans
smk_FURAN_C4H4O_PTR = smk_obs.smk_FURAN_C4H4O_PTR;
smk_Furan_TOGA = smk_obs.smk_Furan_TOGA;

smk_2_Methylfuran_C5H6O_PTR = smk_obs.smk_2_METHYLFURAN_C5H6O_PTR.*0.84;
smk_x3MeFuran_TOGA = smk_obs.smk_x3MeFuran_TOGA;
smk_3_Methylfuran_C5H6O_PTR = smk_obs.smk_2_METHYLFURAN_C5H6O_PTR.*0.16;
smk_x3MeFuran_TOGA = smk_obs.smk_x3MeFuran_TOGA;

smk_2_5_dimethyl_furan_C6H8O = smk_obs.smk_2_5_dimethyl_furan_C6H8O;

smk_2_FURALDEHYDE_C5H4O2_PTR = smk_obs.smk_2_FURALDEHYDE_C5H4O2_PTR;

smk_5_METHYLFURFURAL_C6H6O2_PTR = smk_obs.smk_5_METHYLFURFURAL_C6H6O2_PTR.*0.5;


% others
smk_glycolaldehyde_C2H4O2_PTR = smk_obs.smk_acetic_acid_C2H4O2_PTR.*0.33;

smk_DMS_PTR = smk_obs.smk_DMS_PTR;
smk_DMS_TOGA = smk_obs.smk_DMS_TOGA;
smk_DMS_AWAS = smk_obs.smk_DMS_AWAS;
smk_acrolein_C3H4O_PTR = smk_obs.smk_acrolein_C3H4O_PTR;
smk_Acrolein_TOGA = smk_obs.smk_Acrolein_TOGA;
smk_methyl_glyoxal_C3H4O2_PTR = smk_obs.smk_methyl_glyoxal_C3H4O2_PTR;

smk_PPN = smk_obs.smk_PPN;
smk_hydroxyacetone_C3H6O2_PTR = smk_obs.smk_hydroxyacetone_C3H6O2_PTR.*0.51;
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

smk_heptanal_C7H14O_PTR = smk_obs.smk_heptanal_C7H14O_PTR.*0.63;
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input names inconsistenc due to mechanisms (customized)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Naming setting for MCM and GEOS-Chem
% priorize the base setting
% This section is for compounds both exist in MCM and GEOS-Chem but with different names
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_GCvocsF'}
        % Common compounds but different names 
        nJNO2 = 'J4'; 
        nJO3 = 'J1';
        nJHONO = 'J7';
        nJH2O2 = 'J3';
        nJHNO3 = 'J8';
        nJHCHO_HO2 = 'J11';
        nJHCHO_H2 = 'J12';
        nJNO3_NO = 'J5';
        nJNO3_NO2 = 'J6';
        
        nHONO = 'HONO';
        nHCHO = 'HCHO';
        nALD2 =  'CH3CHO';
        nGLYX = 'GLYOX';
        nBENZ = 'BENZENE';
        nTOLU = 'TOLUENE';
        nACTA = 'CH3CO2H';
        nISOP = 'C5H8';
        nMOH = 'CH3OH'; 
        nEOH = 'C2H5OH';
        nACET = 'CH3COCH3';
        nGLYC = 'HOCH2CHO';
        nMAP = 'CH3CO3H';
        nMGLY = 'MGLYOX';
        nHAC  = 'ACETOL';
        nIHN = 'ISOPANO3';
        nRIPA = 'IEPOXA';
        nPHEN = 'PHENOL';
        nBALD = 'BENZAL';
        nCSL = 'CRESOL';
        
        % Compounds that not in GEOS-Chem or lumped species        
        nC3H4 = 'C3H4';
        
        nPRPE = 'lumpdummy1';
        nC3H6 = 'C3H6';
        nBUT1ENE = 'BUT1ENE';
        nTBUT2ENE = 'TBUT2ENE';
        nCBUT2ENE = 'CBUT2ENE';
        nPENT1ENE= 'PENT1ENE';
        nHEX1ENE= 'HEX1ENE';
        
        nALK4 = 'lumpdummy2';
        nNC4H10 = 'NC4H10';
        nIC4H10 = 'IC4H10';
        nNC5H12 = 'NC5H12';
        nIC5H12 = 'IC5H12';
        nNC6H14 = 'NC6H14';
        nM2PE   = 'M2PE';
        nM3PE   = 'M3PE';
        nM22C4  = 'M22C4';
        nNC7H16 = 'NC7H16';
        nNC8H18 = 'NC8H18';
        nNC9H20 = 'NC9H20';
        nNC10H22 = 'NC10H22';
        nNC11H24 = 'NC11H24';

        nRCHO = 'lumpdummy3';
        nC2H5CHO = 'C2H5CHO';
        nC3H7CHO = 'C3H7CHO';
        nIPRCHO =  'IPRCHO';
        nBUT2CHO = 'BUT2CHO';        
        
        nXYLE = 'lumpdummy4';
        nmpXYLE = 'PXYL';
        noXYLE = 'OXYL';
        netBENZ = 'EBENZ';
        
        nMTPA = 'lumpdummy5';
        nAPINENE = 'APINENE';
        nBPINENE = 'BPINENE'; 
        nLIMONENE = 'LIMONENE';
        
        nC3H7OH = 'C3H7OH';
        
        nFURAN  = 'FURAN';
        nM3F    = 'M3F';
        nM2FURAN = 'M2FURAN';
        nDIMEFURAN = 'DIMEFURAN';
        nFURFURAL  = 'FURFURAL';
        nMEFURFURAL = 'MEFURFURAL';
        
        nACR = 'ACR';
        
        nMETHACET = 'METHACET';
        nETHFORM  = 'ETHFORM';
        
        nIC3H7NO3 = 'IC3H7NO3';
        nNC3H7NO3 = 'NC3H7NO3';
        
        nMALANHY = 'MALANHY';
        
        nC4H6 = 'C4H6';
        nC4ALDB = 'C4ALDB';
        nBIACET = 'BIACET';

        nIC4H9NO3 = 'IC4H9NO3';
        nNC4H9NO3 = 'NC4H9NO3';
        
        nMPRK = 'MPRK';
        nDIEK = 'DIEK';
        nCATECHOL = 'CATECHOL';
        nCYHEXOL = 'CYHEXOL';
        nC5H11CHO = 'C5H11CHO';
        nGUAIACOL = 'GUAIACOL';
        nC6H13CHO = 'C6H13CHO';
        nHEPT3ONE = 'HEPT3ONE';
        nSTYRENE = 'STYRENE';
        nOXYLAL = 'OXYLAL';
        nMGUAIACOL= 'MGUAIACOL';
        nSYRINGOL = 'SYRINGOL';
        nMPHCOME = 'MPHCOME';
        
        nTM123B = 'TM123B';
        nIPBENZ = 'IPBENZ';
        nPBENZ = 'PBENZ';
        nMETHTOL = 'METHTOL';
        nPETHTOL = 'PETHTOL';
        nTM135B = 'TM135B';
        nOETHTOL = 'OETHTOL';
        nTM134B  = 'TM134B';
        
        nPINIC = 'PINIC';
        nPINONIC = 'PINONIC';
        nBCARY = 'BCARY';

    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        % common compounds with different names
        nJNO2 = 'JNO2'; 
        nJO3 = 'JO1D';
        nJHONO = 'JHONO';
        nJH2O2 = 'JH2O2';
        nJHNO3 = 'JHNO3';
        nJHCHO_HO2 = 'JHCHO_HO2';
        nJHCHO_H2 = 'JHCHO_H2';
        nJNO3_NO = 'JNO3_NO';
        nJNO3_NO2 = 'JNO3_NO2';
           
        nHONO = 'HNO2';
        nHCHO = 'CH2O';
        nALD2 =  'ALD2';
        nGLYX = 'GLYX';
        nBENZ = 'BENZ';
        nTOLU = 'TOLU';
        nACTA = 'ACTA';
        nISOP = 'ISOP';
        nMOH = 'MOH'; 
        nEOH = 'EOH';
        nACET = 'ACET';
        nGLYC = 'GLYC';
        nMAP = 'MAP';
        nMGLY = 'MGLY';
        nHAC  = 'HAC';
        nIHN = 'IHN1';
        nRIPA = 'RIPA';
        nPHEN = 'PHEN';
        nBALD = 'BALD';
        nCSL = 'CSL';
        % Compounds that not in GEOS-Chem experiments
        nC3H4 = 'dummy1';
        
        nPRPE = 'PRPE';
        nC3H6 = 'dummy2';
        nBUT1ENE = 'dummy3';
        nTBUT2ENE = 'dummy4';
        nCBUT2ENE = 'dummy5';
        nME3BUT1ENE= 'dummy6';
        nHEX1ENE= 'dummy7';
        
        nALK4 = 'ALK4';
        nNC4H10 = 'dummy8';
        nIC4H10 = 'dummy9';
        nNC5H12 = 'dummy11';
        nIC5H12 = 'dummy10';
        nNC6H14 = 'dummy12';
        nM2PE   = 'dummy13';
        nM3PE   = 'dummy14';
        nM22C4  = 'dummy15';
        nNC7H16 = 'dummy16';
        nNC8H18 = 'dummy17';
        nNC9H20 = 'dummy18';
        nNC10H22 = 'dummy19';
        nNC11H24 = 'dummy20';

        nRCHO = 'RCHO';
        nC2H5CHO = 'dummy21';
        nC3H7CHO = 'dummy22';
        nIPRCHO =  'dummy23';
        nBUT2CHO  = 'dummy24';        
        
        nXYLE = 'XYLE';
        nmpXYLE = 'dummy25';
        noXYLE = 'dummy26';
        netBENZ = 'dummy27';
        
        nMTPA = 'MTPA';
        nAPINENE = 'dummy28';
        nBPINENE = 'dummy29'; 
        nLIMONENE = 'dummy30';
        
        nC3H7OH = 'dummy31';
        
        nFURAN  = 'dummy32';
        nM3F    = 'dummy33';
        nM2FURAN = 'dummy34';
        nDIMEFURAN = 'dummy35';
        nFURFURAL  = 'dummy36';
        nMEFURFURAL = 'dummy37';
        
        nACR = 'dummy38';
        nMETHACET = 'dummy39';
        nETHFORM  = 'dummy40';
        
        nIC3H7NO3 = 'dummy41';
        nNC3H7NO3 = 'dummy42';
        
        nMALANHY = 'dummy43';
        
        nC4H6 = 'dummy44';
        nC4ALDB = 'dummy45';
        nBIACET = 'dummy46';

        nIC4H9NO3 = 'dummy47';
        nNC4H9NO3 = 'dummy48';
        
        nMPRK = 'dummy49';
        nDIEK = 'dummy50';

        nCATECHOL = 'dummy51';
        nCYHEXOL = 'dummy52';
        nC5H11CHO = 'dummy53';
        nGUAIACOL = 'dummy54';
        nC6H13CHO = 'dummy55';
        nHEPT3ONE = 'dummy56';

        
        nSTYRENE = 'dummy57';
        nOXYLAL = 'dummy58';
        nMGUAIACOL = 'dummy59';
        nSYRINGOL = 'dummy60';
        nMPHCOME = 'dummy61';
        
        nTM123B = 'dummy101';
        nIPBENZ = 'dummy102';
        nPBENZ = 'dummy103';
        nMETHTOL = 'dummy104';
        nPETHTOL = 'dummy105';
        nTM135B = 'dummy106';
        nOETHTOL = 'dummy107';
        nTM134B  = 'dummy108';
        
        nPINIC = 'dummy63';
        nPINONIC = 'dummy64';
        nBCARY = 'dummy65';
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
        
% Naming setting for sensitivity experiment beyond base mechanisms
switch MECHANISM    
    case 'MCMv331_GCvocs'
        % Compounds that not in GEOS-Chem        
        nC3H4 = 'dummy1';

        nC3H7OH = 'dummy31';
        
        nFURAN  = 'dummy32';
        nM3F    = 'dummy33';
        nM2FURAN = 'dummy34';
        nDIMEFURAN = 'dummy35';
        nFURFURAL  = 'dummy36';
        nMEFURFURAL = 'dummy37';
        
        nACR = 'dummy38';
        nMETHACET = 'dummy39';
        nETHFORM  = 'dummy40';
        
        nIC3H7NO3 = 'dummy41';
        nNC3H7NO3 = 'dummy42';
        
        nMALANHY = 'dummy43';
        
        nC4H6 = 'dummy44';
        nC4ALDB = 'dummy45';
        nBIACET = 'dummy46';

        nIC4H9NO3 = 'dummy47';
        nNC4H9NO3 = 'dummy48';
        
        nMPRK = 'dummy49';
        nDIEK = 'dummy50';

        nCATECHOL = 'dummy51';
        nCYHEXOL = 'dummy52';
        nC5H11CHO = 'dummy53';
        nGUAIACOL = 'dummy54';
        nC6H13CHO = 'dummy55';
        nHEPT3ONE = 'dummy56';

        
        nSTYRENE = 'dummy57';
        nOXYLAL = 'dummy58';
        nMGUAIACOL = 'dummy59';
        nSYRINGOL = 'dummy60';
        nMPHCOME = 'dummy61';
        
        nTM123B = 'dummy101';
        nIPBENZ = 'dummy102';
        nPBENZ = 'dummy103';
        nMETHTOL = 'dummy104';
        nPETHTOL = 'dummy105';
        nTM135B = 'dummy106';
        nOETHTOL = 'dummy107';
        nTM134B  = 'dummy108';
        
        nPINIC = 'dummy63';
        nPINONIC = 'dummy64';
        nBCARY = 'dummy65';
        
    case 'MCMv331_GCvocsF'    
        nC3H4 = 'dummy1';

        nC3H7OH = 'dummy31';
        
        nACR = 'dummy38';
        nMETHACET = 'dummy39';
        nETHFORM  = 'dummy40';
        
        nIC3H7NO3 = 'dummy41';
        nNC3H7NO3 = 'dummy42';
        
        nMALANHY = 'dummy43';
        
        nC4H6 = 'dummy44';
        nC4ALDB = 'dummy45';
        nBIACET = 'dummy46';

        nIC4H9NO3 = 'dummy47';
        nNC4H9NO3 = 'dummy48';
        
        nMPRK = 'dummy49';
        nDIEK = 'dummy50';

        nCATECHOL = 'dummy51';
        nCYHEXOL = 'dummy52';
        nC5H11CHO = 'dummy53';
        nGUAIACOL = 'dummy54';
        nC6H13CHO = 'dummy55';
        nHEPT3ONE = 'dummy56';
        
        nSTYRENE = 'dummy57';
        nOXYLAL = 'dummy58';
        nMGUAIACOL = 'dummy59';
        nSYRINGOL = 'dummy60';
        nMPHCOME = 'dummy61';
        
        nTM123B = 'dummy101';
        nIPBENZ = 'dummy102';
        nPBENZ = 'dummy103';
        nMETHTOL = 'dummy104';
        nPETHTOL = 'dummy105';
        nTM135B = 'dummy106';
        nOETHTOL = 'dummy107';
        nTM134B  = 'dummy108';
        
        nPINIC = 'dummy63';
        nPINONIC = 'dummy64';
        nBCARY = 'dummy65';

    case 'GCv13_JINF'
        % Furans
        nFURAN = 'FURAN';
        nM2FURAN = 'M2FURAN';
        nMEFURFURAL = 'MEFURFURAL';
        nDIMEFURAN = 'DIMEFURAN';
        nFURFURAL = 'FURFURAL';
        nMALANHY = 'MALANHY';

    case 'GCv13_JINF_HCOOH'
        % Furans
        nFURAN = 'FURAN';
        nM2FURAN = 'M2FURAN';
        nMEFURFURAL = 'MEFURFURAL';
        nDIMEFURAN = 'DIMEFURAN';
        nFURFURAL = 'FURFURAL';
        nMALANHY = 'MALANHY';
        % ACR
        nACR = 'ACR';

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Met data
% Note: tranpose may need to be conducted for model run
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Met input
Met = {...
    'P'             PRESSURE';...%pressure, mbar
    'T'             TEMPERATURE';...    %Temperature, K
    'RH'            RHUM';...    %Relative Humidity, percent    
    'kdil'          kdil;...    %dilution, /s kdil
    'SZA'           SZA';... %solar zenith angle, missing!
    nJNO2           JNO2_NO_O3P';... %NO2 photolysis frequency  D.JNO2; 4e-3
    nJHONO          JHNO2_OH_NO';... % HONO photolysis frequency D.JHONO 0.9e-3
    nJH2O2          JH2O2_2OH';... % H2O2-->2OH
    nJHNO3          JHNO3_OH_NO2';... % HNO3-->NO2+OH   
    nJO3            JO3_O2_O1D';...%1e-5;...% O3-->O1D+O2
    nJHCHO_H2       JCH2O_H2_CO';... % HCHO-->H2+CO
    nJHCHO_HO2      JCH2O_H_HCO';... % HCHO-->H+HCO
    nJNO3_NO        JNO3_NO_O2';... % NO3--> NO + O2
    nJNO3_NO2       JNO3_NO2_O_3P';... % NO3 -->NO2 + O(3P)
    };
disp('done, set met data')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chemical compounds input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
InitConc = {...
%   names               conc(ppb)               HoldMe 
    %Inorganics
    'CO'                 smk_CO_QCL(1)                0;...          % Peng
    %CO2
    %NOy
    'NO'                 smk_NO(1)                    0;...          % Peng
    'NO2'                smk_NO2(1)                   0;...          % Peng
    nHONO                smk_HONO_UWCIMS(1)           0;...          % Peng
    
    'O3'                 smk_O3(1)                    0;...          % Peng
    'SO2'                smk_SO2_UWCIMS(1)            0;...          % Peng
    'PAN'                smk_PAN(1)                   0;...          % Peng
    'HNO3'               smk_HNO3_UWCIMS(1)           0;...          % Peng
    
    'OH'                 smk_OH(1)                    OH_holder;...  % Peng
    'HO2'                smk_HO2(1)                   0;... %Lixu

    % CxHy
    'CH4'                smk_Methane_PICARRO(1)       0;... %Lixu
    
    'C2H2'               max(smk_Ethyne_AWAS)         0;... %Lixu 
    'C2H4'                max(smk_Ethene_AWAS)         0;... %Peng
    'C2H6'               max(smk_Ethane_AWAS)         0;... %Lixu

    nPRPE                max(smk_Propylene_AWAS) + max(smk_1_BUTENE_PTR) + max(smk_transx2butene_AWAS) + max(smk_cisx2butene_AWAS) + max(smk_x1Hexene_AWAS)               0;... % more VOCs than Peng
    nC3H6                max(smk_Propylene_AWAS)                      0;... 
    nBUT1ENE             max(smk_1_BUTENE_PTR)                        0;...  
    nTBUT2ENE            max(smk_transx2butene_AWAS)                  0;...
    nCBUT2ENE            max(smk_cisx2butene_AWAS)                    0;...
    %nPENT1ENE            max(smk_pentene_C5H10_PTR)                  0;...
    nHEX1ENE             max(smk_x1Hexene_AWAS)                       0;...
 
    'C3H8'               max(smk_Propane_AWAS)                        0;...
    
    nALK4                max(smk_N_butane_AWAS) + max(smk_Isobutane_AWAS) + max(smk_nPentane_AWAS) + max(smk_Isopentane_AWAS) + max(smk_Hexane_AWAS) + max(smk_x3Methylpentane_AWAS) + max(smk_x22Dimethylbutane_AWAS) + max(smk_nHeptan_CHB_AWAS) + max(smk_x24Dimethylpentane_AWAS) + max(smk_x2Methylhexane_AWAS) + max(smk_x234Trimethylpentane_AWAS) + max(smk_x2Methylheptane_AWAS) + max(smk_x3Methylheptane_AWAS) + max(smk_nNonane_AWAS) + max(smk_nDecane_AWAS) + max(smk_Undecane_AWAS)        0;...  % more VOCs than Peng
    nNC4H10              max(smk_N_butane_AWAS)                                                  0;...
    nIC4H10              max(smk_Isobutane_AWAS)                                                 0;...
    nNC5H12              max(smk_nPentane_AWAS)                                                  0;... 
    nIC5H12              max(smk_Isopentane_AWAS)                                                0;...
    nNC6H14              max(smk_Hexane_AWAS)                                                    0;... 
    nM3PE                max(smk_x3Methylpentane_AWAS)                                           0;... 
    nM22C4               max(smk_x22Dimethylbutane_AWAS)                                         0;...
    nNC7H16              max(smk_nHeptan_CHB_AWAS) + max(smk_x24Dimethylpentane_AWAS) + max(smk_x2Methylhexane_AWAS)    0;... 
    nNC8H18              max(smk_x234Trimethylpentane_AWAS) + max(smk_x2Methylheptane_AWAS) + max(smk_x3Methylheptane_AWAS)                    0;... % Octane, missing
    nNC9H20              max(smk_nNonane_AWAS)                                                            0;... 
    nNC10H22             max(smk_nDecane_AWAS)                                                            0;...
    nNC11H24             max(smk_Undecane_AWAS)                                                           0;...


    % Aldehydes
    nHCHO               smk_formaldehyde_CH2O_PTR(1)                                                       0;...  % Peng
    nALD2               smk_ACETALDEHYDE_C2H4O_PTR(1)                                                      0;...  % Peng
    nRCHO               smk_Propanal_C3H6O_PTR(1) + smk_Butanal_C4H8O_PTR(1) + smk_2_Methylpropanal_C4H8O_PTR(1) + smk_2_Methylbutanal_PTR(1) + smk_Hexanal_C6H12O_PTR(1) + smk_heptanal_C7H14O_PTR(1)     0;... % RCHO in GEOS-Chem
    nC2H5CHO            smk_Propanal_C3H6O_PTR(1)                                                          0;... % Lixu
    nC3H7CHO            smk_Butanal_C4H8O_PTR(1)                                                           0;... % Lixu
    nIPRCHO             smk_2_Methylpropanal_C4H8O_PTR(1)                                                  0;... % Lixu
    nBUT2CHO            smk_2_Methylbutanal_PTR(1)                                                         0;... % Lixu
    nC5H11CHO           smk_Hexanal_C6H12O_PTR(1)                                                          0;... % Lixu
    nC6H13CHO           smk_heptanal_C7H14O_PTR(1)                                                         0;... % Lixu
    nGLYX               smk_glyoxal_C2H2O2_PTR(1)                                                          0;... % Peng

    % Aromatics
    nBENZ              smk_BENZENE_C6H6_PTR(1)                                                                                          0;... %Peng
    nTOLU              smk_TOLUENE_C7H8_PTR(1)                                                                                          0;... %Peng
    nXYLE              smk_mpXylenes_C8H10_PTR(1) + smk_oXylene_C8H10_PTR(1) + smk_Ethyl_benzene_C8H10_PTR(1)                           0;... % xylenes in GEOS-Chem
    nmpXYLE            smk_mpXylenes_C8H10_PTR(1)                                                                                       0;... % p-Xylene, Peng
    noXYLE             smk_oXylene_C8H10_PTR(1)                                                                                         0;... % o-Xylene, Peng
    netBENZ            smk_Ethyl_benzene_C8H10_PTR(1)                                                                                   0;... % ETHYLBENZENE, Peng
    
    % Organic acids
    'HCOOH'            smk_CH2O2_UWCIMS(1)                                                      0;... %Peng
    nACTA              smk_acetic_acid_C2H4O2_PTR(1)                                            0;... %Peng 

    % Biogenics
    nISOP              smk_ISOPRENE_C5H8_PTR(1)                                                 0;... %Peng
    nMTPA              smk_apinene_C10H16_PTR(1) + smk_bpinene_C10H16_PTR(1)                    0;... %MTPA in GEOS-Chem
    nAPINENE           smk_apinene_C10H16_PTR(1)                                                0;... %Peng, 
    nBPINENE           smk_bpinene_C10H16_PTR(1)                                                0;... %Peng
    'MACR'             smk_MACR_C4H6O_PTR(1)                                                    0;... %Peng
    'MVK'              smk_MVK_C4H6O_PTR(1)                                                     0;... %Peng

    % alcohols
     nMOH              smk_METHANOL_CH3OH_PTR(1)                                0;... %Peng 
     nEOH              smk_ETHANOL_C2H6O_PTR(1)                                 0;... %Peng
    
    % Ketones
    nACET              smk_ACETONE_C3H6O_PTR(1)                                 0;... %Peng 
    'MEK'              smk_MEK_C4H8O_PTR(1)                                     0;... %Peng

    % Furans    
    nFURAN             smk_FURAN_C4H4O_PTR(1)                                   0;... %Peng
    nM3F               smk_3_Methylfuran_C5H6O_PTR(1)                           0;... %Peng
    nM2FURAN           smk_2_Methylfuran_C5H6O_PTR(1)                           0;... %Peng
    nMEFURFURAL        smk_5_METHYLFURFURAL_C6H6O2_PTR(1)                       0;... %Pneg
    nDIMEFURAN         smk_2_5_dimethyl_furan_C6H8O(1)                          0;... %Peng
    nFURFURAL          smk_2_FURALDEHYDE_C5H4O2_PTR(1)                          0;... %Peng

    % others
    nGLYC                smk_glycolaldehyde_C2H4O2_PTR(1)                       0;... %Peng   
    'DMS'                smk_DMS_PTR(1)                                         0;... %Lixu
    nACR                 smk_acrolein_C3H4O_PTR(1)                              0;... %Peng
    nMGLY                smk_methyl_glyoxal_C3H4O2_PTR(1)                       0;... %Peng, methylglyoxal, MGLY
    'PPN'                smk_PPN(1)                                             0;... %Peng
    nHAC                 smk_hydroxyacetone_C3H6O2_PTR(1)                       0;... %Peng
    nMETHACET            smk_Methyl_acetate_C3H6O2_PTR(1)                       0;... %Lixu
    nETHFORM             smk_Ethyl_formate_C3H6O2_PTR(1)                        0;... %Lixu
    nIC3H7NO3            smk_iPropONO2_TOGA(1)                                  0;... %Lixu
    nNC3H7NO3            smk_nPropONO2_TOGA(1)                                  0;... %Lixu
    nMALANHY             smk_maleic_anhydride_C4H2O3_PTR(1)                     0;... %Lixu
    nC4H6                smk_butadiene_C4H6_PTR(1)                              0;... % Peng  
    nC4ALDB              smk_2_Butenal_C4H6O_PTR(1)                             0;... % Peng
    nBIACET              smk_2_3_butanedione_C4H6O2_PTR(1)                      0;... % Peng
    
    nIC4H9NO3            smk_iBuONO2_TOGA(1)                                    0;... %Lixu
    nNC4H9NO3            smk_nBuONO2_TOGA(1)                                    0;... %Lixu
    nIHN                 smk_C5H9O4N_UWCIMS(1)                                  0;... %Peng
    %'MBO'               smk_MBO_C5H10O_PTR(1)                                  0;...
    nMPRK                smk_2_Pentanone_C5H10O_PTR(1)                          0;... %Lixu
    nDIEK                smk_2_Pentanone_C5H10O_PTR(1)                          0;... %Lixu

    nPHEN                smk_C6H6O_UWCIMS(1)                                    0;... %Peng
    nCATECHOL            smk_Catechol_C6H6O2_PTR(1)                             0;... %Peng
    nCYHEXOL             smk_Hexanones_C6H12O_PTR(1)                            0;... %Peng

    nBALD                smk_benzaldehyde_C7H6O_PTR(1)                          0;... %Peng
    nCSL                 smk_o_cresol_C7H8O_PTR(1)                              0;... %Peng
    nGUAIACOL            smk_guaiacol_C7H8O2_PTR(1)                             0;... %Peng
    nHEPT3ONE            smk_heptanone_C7H14O_PTR(1)                            0;... %Lixu        
    nSTYRENE             smk_styrene_C8H8_PTR(1)                                0;... %Lixu       
    nOXYLAL              smk_tolualdehyde_C8H8O_PTR(1)                          0;... %Lixu
    nMGUAIACOL           smk_creosol_C8H10O2_PTR(1)                             0;... %Lixu 
    nSYRINGOL            smk_syringol_C8H10O3_PTR(1)                            0;... %Lixu
   % nMPHCOME            smk_3_methylacetophenone_C9H10O_PTR(1)                 0;...

    nTM123B              max(smk_x123Trimethylbenzene_AWAS)                     0;... %Peng
    nIPBENZ              max(smk_Isopropylbenzene_AWAS)                         0;... %Lixu
    nPBENZ               max(smk_nPropylbenzene_AWAS)                           0;... %Lixu
    nMETHTOL             max(smk_x3Ethyltoluene_AWAS)                           0;... %LIxu
    nPETHTOL             max(smk_x4Ethyltoluene_AWAS)                           0;... %Lixu
    nTM135B              max(smk_x135Trimethylbenzene_AWAS)                     0;... %Lixu
    nOETHTOL             max(smk_x2Ethyltoluene_AWAS)                           0;... %Lixu
    
    nPINIC               smk_C9H14O4_UWCIMS(1)                                  0;... %Peng
    nPINONIC             smk_C10H16O3_UWCIMS(1)                                 0;... %Peng
    nBCARY               smk_sesquiterpenes_C15H24_PTR(1)                       0;... %Peng, Sesquiterpenes   
};

disp('done, provide initial data')


%%%%%%%%%%%%%%%%%
% chemistry
%%%%%%%%%%%%%%%%%
%{
ChemFiles is a cell array of strings specifying functions and scripts for the chemical mechanism.

THE FIRST CELL is always a function for generic K-values.

THE SECOND CELL is always a function for J-values (photolysis frequencies).
    The numeric flag of "2" in the J function inputs specifies the use of the "HYBRID" method for
    calculating J-values (see ReadMe).

All other inputs are scripts for mechanisms and sub-mechanisms.

Examples are given here for all of the mechanisms currently available.
%}

switch MECHANISM
    case {'MCMv331_base','MCMv331_GCvocs','MCMv331_GCvocsF'}
        ChemFiles = {...
            'MCMv3331_K(Met)';
            'MCMv3331_J(Met,2)'; %Jmethod flag of 0 specifies "MCM" J-value method.2 is hybrid
            'MCMv331_FullMech_V7_20190311_Ahsan_Lixu';
            'ZachEST_Lixu_fixed';
            'dummyMech'};
    case 'GCv13_base'
        ChemFiles = {...
            'MCMv3331_K(Met)';
            'GEOSCHEM_J_v13(Met,2)';
            'GEOSCHEMv13_base_fix';
            'dummyMech'};
    case 'GCv13_JINF'
        ChemFiles = {...
            'MCMv3331_K(Met)';... % dummy script, will not use it. 
            'GEOSCHEM_J_v13(Met,2)';...
            'GEOSCHEMv13_base_fix';...
            'GC_JINFUR_v3';...
            'dummyMech'};
            
    case 'GCv13_JINF_HCOOH'
        ChemFiles = {...
            'MCMv3331_K(Met)';... % dummy script, will not use it. 
            'GEOSCHEM_J_v13(Met,2)';...
            'GEOSCHEMv13_base_fix';...
            'GC_JINFUR_v3';...
            'GC_HCOOH';...
            'dummyMech'};
            
    case 'GCv13_base_notfixed'
        ChemFiles = {...
            'MCMv3331_K(Met)';... % dummy script, will not use it. 
            'GEOSCHEM_J_v13(Met,2)';...
            'GEOSCHEMv13_base';...
            'dummyMech'};
            
            
            
end
disp('done, provide chemistry mechanism')
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
    'CO'                bkg_CO_QCL                         ;...
    
    %NOy
    'NO'                bkg_NO                             ;... 
    'NO2'               bkg_NO2                            ;...
    nHONO               bkg_HONO_UWCIMS                    ;... 
    
    'O3'                bkg_O3                             ;... 
    'SO2'               bkg_SO2_UWCIMS                     ;... 
    'PAN'               bkg_PAN                            ;... 
    'HNO3'              bkg_HNO3_UWCIMS                    ;...
    
    %'OH'               4.07e-5                            ;...  % Assuming 1e6/1e8 molec cm-3 for OH and HO2 (see Stone et al., 2012; convert into ppb by dividing 2.46e10 (http://tinyurl.com/ac-cheat2 
    %'HO2'              4.07e-3                            ;... % check with F0AM developer
    %'H2O2'             4e-4                               ;... 

    % CxHy
    'CH4'               bkg_Methane_PICARRO                ;...
    
    'C2H2'              bkg_Ethyne_AWAS                    ;...% 
    'C2H4'               bkg_ethene_C2H4_PTR                ;... % Discussed
    nC3H4               bkg_PROPYNE_C3H4_PTR               ;...
    
    nPRPE               bkg_propene_C3H6_PTR + bkg_1_BUTENE_PTR + bkg_transx2butene_AWAS + bkg_cisx2butene_AWAS + bkg_x1Hexene_AWAS               ;... % PRPE in GEOS-Chem, hexene missing since we don't have such measurements
    nC3H6               bkg_propene_C3H6_PTR               ;... 
    nBUT1ENE            bkg_1_BUTENE_PTR                   ;...  
    nTBUT2ENE           bkg_transx2butene_AWAS             ;...
    nCBUT2ENE           bkg_cisx2butene_AWAS               ;...
    %nPENT1ENE          bkg_pentene_C5H10_PTR              ;...
    nHEX1ENE            bkg_x1Hexene_AWAS                  ;...
 
    'C2H6'              bkg_Ethane_AWAS                    ;...
    'C3H8'              bkg_Propane_AWAS                   ;...
    nALK4               bkg_N_butane_AWAS + bkg_Isobutane_AWAS + bkg_nPentane_AWAS + bkg_Isopentane_AWAS + bkg_Hexane_AWAS + bkg_x3Methylpentane_AWAS + bkg_x22Dimethylbutane_AWAS + bkg_nHeptan_CHB_AWAS + bkg_x24Dimethylpentane_AWAS + bkg_x2Methylhexane_AWAS + bkg_x234Trimethylpentane_AWAS + bkg_x2Methylheptane_AWAS + bkg_x3Methylheptane_AWAS + bkg_nNonane_AWAS + bkg_nDecane_AWAS + bkg_Undecane_AWAS        ;...  %C5-C8 is from estimation of emission inventory, PRPE in GEOS-Chem, missing
    nNC4H10             bkg_N_butane_AWAS                  ;... 
    nIC4H10             bkg_Isobutane_AWAS                 ;...
    nNC5H12             bkg_nPentane_AWAS                  ;... 
    nIC5H12             bkg_Isopentane_AWAS                ;...
    nNC6H14             bkg_Hexane_AWAS                    ;... 
    nM3PE               bkg_x3Methylpentane_AWAS           ;... 
    nM22C4              bkg_x22Dimethylbutane_AWAS         ;...
    nNC7H16             bkg_nHeptan_CHB_AWAS + bkg_x24Dimethylpentane_AWAS + bkg_x2Methylhexane_AWAS    ;... 
    nNC8H18             bkg_x234Trimethylpentane_AWAS + bkg_x2Methylheptane_AWAS + bkg_x3Methylheptane_AWAS                    ;... % Octane, missing
    nNC9H20             bkg_nNonane_AWAS                   ;... 
    nNC10H22            bkg_nDecane_AWAS                   ;...
    nNC11H24            bkg_Undecane_AWAS                  ;...


    % Aldehydes
    nHCHO               bkg_formaldehyde_CH2O_PTR                     ;... 
    nALD2               bkg_ACETALDEHYDE_C2H4O_PTR                    ;... 
    nRCHO               bkg_Propanal_C3H6O_PTR + bkg_Butanal_C4H8O_PTR + bkg_2_Methylpropanal_C4H8O_PTR + bkg_2_Methylbutanal_PTR + bkg_Hexanal_C6H12O_PTR      ;... % RCHO in GEOS-Chem
    nC2H5CHO            bkg_Propanal_C3H6O_PTR                        ;...  
    nC3H7CHO            bkg_Butanal_C4H8O_PTR                         ;...  
    nIPRCHO             bkg_2_Methylpropanal_C4H8O_PTR                ;...  
    nBUT2CHO            bkg_2_Methylbutanal_PTR                       ;...
    nC5H11CHO           bkg_Hexanal_C6H12O_PTR                        ;...
    nGLYX               bkg_glyoxal_C2H2O2_PTR                        ;... % glyoxal, GLYX

    % Aromatics
    nBENZ               bkg_BENZENE_C6H6_PTR                          ;... 
    nTOLU               bkg_TOLUENE_C7H8_PTR                          ;... 
    nXYLE               bkg_mpXylenes_C8H10_PTR + bkg_oXylene_C8H10_PTR + bkg_Ethyl_benzene_C8H10_PTR                          ;... % xylenes in GEOS-Chem
    nmpXYLE             bkg_mpXylenes_C8H10_PTR                                                                                   ;... % p-Xylene
    noXYLE              bkg_oXylene_C8H10_PTR                                                                                    ;... % o-Xylene
    netBENZ             bkg_Ethyl_benzene_C8H10_PTR                                                                                   ;... % ETHYLBENZENE
    
    % Organic acids
    'HCOOH'             bkg_CH2O2_UWCIMS                             ;... 
    nACTA               bkg_acetic_acid_C2H4O2_PTR                   ;... 

    % Biogenics
    nISOP               bkg_ISOPRENE_C5H8_PTR                        ;... 
    nMTPA               bkg_apinene_C10H16_PTR + bkg_bpinene_C10H16_PTR   ;... % MTPA in GEOS-Chem
    nAPINENE            bkg_apinene_C10H16_PTR                       ;... 
    nBPINENE            bkg_bpinene_C10H16_PTR                       ;... 
    'MACR'              bkg_MACR_C4H6O_PTR                           ;... 
    'MVK'               bkg_MVK_C4H6O_PTR                            ;... 

    % alcohols
     nMOH               bkg_METHANOL_CH3OH_PTR                       ;... 
     nEOH               bkg_ETHANOL_C2H6O_PTR                        ;...
    
    % Ketones
    nACET               bkg_ACETONE_C3H6O_PTR                        ;... 
    'MEK'               bkg_MEK_C4H8O_PTR                            ;... 

    % Furans    
    nFURAN              bkg_FURAN_C4H4O_PTR                          ;... 
    nM3F                bkg_3_Methylfuran_C5H6O_PTR                  ;...  
    nM2FURAN            bkg_2_Methylfuran_C5H6O_PTR                  ;... % 2-Methylfuran, lumped together
    nMEFURFURAL         bkg_5_METHYLFURFURAL_C6H6O2_PTR              ;... % change 2X furan into MeFurfural 
    nDIMEFURAN          bkg_2_5_dimethyl_furan_C6H8O                 ;... 
    nFURFURAL           bkg_2_FURALDEHYDE_C5H4O2_PTR                 ;...  % Lixu, why 1.4X furan

    % others
    nGLYC               bkg_glycolaldehyde_C2H4O2_PTR                ;...   
    'DMS'               bkg_DMS_PTR                                  ;...
    nACR                bkg_acrolein_C3H4O_PTR                       ;... 
    nMGLY               bkg_methyl_glyoxal_C3H4O2_PTR                ;... % methylglyoxal, MGLY
    'PPN'               bkg_PPN                                      ;...
    nHAC                bkg_hydroxyacetone_C3H6O2_PTR                ;...
    nMETHACET           bkg_Methyl_acetate_C3H6O2_PTR                ;...
    nETHFORM            bkg_Ethyl_formate_C3H6O2_PTR                 ;...
    nIC3H7NO3           bkg_iPropONO2_TOGA                           ;...
    nNC3H7NO3           bkg_nPropONO2_TOGA                           ;...
    nMALANHY            bkg_maleic_anhydride_C4H2O3_PTR              ;...    
    nC4H6               bkg_butadiene_C4H6_PTR                       ;... % butadienes  
    nC4ALDB             bkg_2_Butenal_C4H6O_PTR                      ;... 
    nBIACET             bkg_2_3_butanedione_C4H6O2_PTR               ;...
    
    nIC4H9NO3           bkg_iBuONO2_TOGA                             ;...
    nNC4H9NO3           bkg_nBuONO2_TOGA                             ;...
    nIHN                bkg_C5H9O4N_UWCIMS                           ;...
    %'MBO'              bkg_MBO_C5H10O_PTR                           ;...
    nMPRK               bkg_2_Pentanone_C5H10O_PTR                   ;...
    nDIEK               bkg_2_Pentanone_C5H10O_PTR                   ;...

    nPHEN               bkg_C6H6O_UWCIMS                             ;...
    nCATECHOL           bkg_Catechol_C6H6O2_PTR                      ;...
    
    nCYHEXOL            bkg_Hexanones_C6H12O_PTR                     ;...
    nBALD               bkg_benzaldehyde_C7H6O_PTR                   ;...
    nCSL                bkg_o_cresol_C7H8O_PTR                       ;... 
    nGUAIACOL           bkg_guaiacol_C7H8O2_PTR                      ;...  
    nC6H13CHO           bkg_heptanal_C7H14O_PTR                      ;...
    nHEPT3ONE           bkg_heptanone_C7H14O_PTR                     ;...             
    nSTYRENE            bkg_styrene_C8H8_PTR                         ;...            
    nOXYLAL             bkg_tolualdehyde_C8H8O_PTR                   ;... 
    nMGUAIACOL          bkg_creosol_C8H10O2_PTR                      ;...  
    nSYRINGOL           bkg_syringol_C8H10O3_PTR                     ;...  
   % nMPHCOME           bkg_3_methylacetophenone_C9H10O_PTR          ;..
    
    nTM123B             bkg_x123Trimethylbenzene_AWAS                ;...
    nIPBENZ             bkg_Isopropylbenzene_AWAS                    ;...
    nPBENZ              bkg_nPropylbenzene_AWAS                      ;...
    nMETHTOL            bkg_x3Ethyltoluene_AWAS                      ;...
    nPETHTOL            bkg_x4Ethyltoluene_AWAS                      ;...
    nTM135B             bkg_x135Trimethylbenzene_AWAS                ;...
    nOETHTOL            bkg_x2Ethyltoluene_AWAS                      ;...
    
    nPINIC              bkg_C9H14O4_UWCIMS                           ;...
    nPINONIC            bkg_C10H16O3_UWCIMS                          ;...
    nBCARY              bkg_sesquiterpenes_C15H24_PTR                ;... % Sesquiterpenes  
};

disp('done, provide background values for dilution')
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
ModelOptions.IntTime = Int_time;       %integration time for each step, seconds. This needs to be customized
ModelOptions.SavePath = ['./output_data/', MECHANISM, Flight_ID];
disp('done, provide model options.')

%% MODEL RUN
% Now we call the model. Note this may take several minutes to run, depending on your system.
% Output will be saved in the "SavePath" above and will also be written to the structure S.
% Let's also throw away the inputs (don't worry, they are saved in the output structure).
S = F0AM_ModelCore(Met,InitConc,ChemFiles,BkgdConc,ModelOptions);
disp('done, finish the run of the model.')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting and data analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLOTTING AND ANALYSIS
makeplots = 0 
if makeplots
    %% Create NEMR in matlab
    delta_CO = S.Conc.CO - S.BkgdConc.CO(1);
    fCO = delta_CO(1)./delta_CO; % CO 

    Sd.Met = S.Met; Sd.Cnames = S.Cnames; Sd.Time = S.Time;
    for i=1:length(S.Cnames)
        name = S.Cnames{i};
        if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
        else b = 0;
        end
        Sd.Conc.(name) = (S.Conc.(name) - b).*fCO;
    end
    %% get NEMR (different method) and corresponding time
    ages_obs = ages*60;
    ages_sim = linspace(ages_obs(1),ages_obs(end),length(S.Time));
    time_sim = S.Time;
    time_obs = 0:379:(7580-379); % This needs to be customized
    delta_CO = S.Conc.CO - S.BkgdConc.CO(1);
    fCO = delta_CO(1)./delta_CO; % CO 

    Sd.Met = S.Met; Sd.Cnames = S.Cnames; Sd.Time = S.Time;
    for i=1:length(S.Cnames)
        name = S.Cnames{i};
        if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
        else b = 0;
        end
        Sd.Conc.(name) = (S.Conc.(name) - b).*fCO;
    end

    %% Do the ploting and saveout the figure Below.

end %end makeplots if