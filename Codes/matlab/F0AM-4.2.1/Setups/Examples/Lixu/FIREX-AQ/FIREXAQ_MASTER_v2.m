% ExampleSetup_LagrangianPlume.m
% This example shows a model setup for simulation of an evolving fire plume.
% Model setup is the same as that described in Mu(:)ller et al., ACP (2016).
% Thanks to Markus Mu(:)ller for providing the model setup and data.
% Read comments in each section for a guided tour.
%
% 20160701 GMW

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
name_reorg;
disp('done, naming reorganization')

% choose the flight ID
%Flight_ID = 'FN06';

% choose the start point
starting_point = 1;

if Flight_ID == 'RF03'
    starting_point = 2;
end
if Flight_ID == 'RF07'
    starting_point = 2;
end
if Flight_ID == 'FN06'
    starting_point = 5;
end


% choose the sensitivity test 
scale_factor = 1.0;
% ========================================================================================================
% load and read observations
% including meteorolgy, photolysis rates, plume age product, chemical compounds and bkg
% ========================================================================================================
if Flight_ID == 'FN06'
    ChemInput = load('ChemInput_avg_FN06WF_20200515');
    MetInput = load('MetInput_avg_FN06WF_20200515');
end    

if Flight_ID == 'FN19'
    ChemInput = load('ChemInput_avg_FN19Blackwater_20200513');
    MetInput = load('MetInput_avg_FN19Blackwater_20200513');    
end

% ==========
% MET
% ==========
%Interpolate the Met data on a constant timewave to make it easier to run
%Model
MetInput.TimeDownwind_s(1) = 0;  %Lixu, this step seems useless...
MetTime = MetInput.TimeDownwind_s;

% For the Williams Flat fire, we need to adjust the photolysis parameters
% for the first two passes, since we did not actually sample the first
% fire.
if Flight_ID == 'FN06'
    MetAdjust = 0.5;
    MetInput.jO3(MetInput.TimeDownwind_s < 1500) = MetInput.jO3(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jNO2(MetInput.TimeDownwind_s < 1500) = MetInput.jNO2(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jHONO(MetInput.TimeDownwind_s < 1500) = MetInput.jHONO(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jHNO3(MetInput.TimeDownwind_s < 1500) = MetInput.jHNO3(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jFormaldehyde_HCO(MetInput.TimeDownwind_s < 1500) = MetInput.jFormaldehyde_HCO(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jFormaldehyde_CO(MetInput.TimeDownwind_s < 1500) = MetInput.jFormaldehyde_CO(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jAcetaldehyde_CH3(MetInput.TimeDownwind_s < 1500) = MetInput.jAcetaldehyde_CH3(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jGlyoxal_H2(MetInput.TimeDownwind_s < 1500) = MetInput.jGlyoxal_H2(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jGlyoxal_CH2O(MetInput.TimeDownwind_s < 1500) = MetInput.jGlyoxal_CH2O(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jGlyoxal_HCO(MetInput.TimeDownwind_s < 1500) = MetInput.jGlyoxal_HCO(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jNO2_downfrac(MetInput.TimeDownwind_s < 1500) = MetInput.jNO2_downfrac(MetInput.TimeDownwind_s < 1500)*MetAdjust;
    MetInput.jCH3OOH(MetInput.TimeDownwind_s < 1500) = MetInput.jCH3OOH(MetInput.TimeDownwind_s < 1500)*MetAdjust;
end

% Create interpolated time based on desired time step
TimeStep = 10; %minutes
NumPnts = ceil(MetTime(end)/(TimeStep*60)); %number of points to interpolate
for i=1:NumPnts
    TimeInterp(i,1) = (i-1)*TimeStep*60;
end

% Determine meteorological paramters on interpolated time step
MetNames = fieldnames(MetInput); 
for i=1:length(MetNames)
    MetInput_Interp.(MetNames{i}) = interp1(MetTime,MetInput.(MetNames{i}),TimeInterp);
end

% Interpolate CO to get the dilution parameterization
CO_Interp = interp1(ChemInput.TimeDownwind_s, ChemInput.CO,TimeInterp);

%% METEOROLOGY
%{
Pressure, temperature, and either RH or H2O are required Met inputs.
Dilution is calculated using the change in CO over each model step.
All calculated J-values will be scaled to J4.
%}
% Calculate dilution rate using CO decay
dCOdt = diff(CO_Interp)./diff(TimeInterp);
dCOdt(end+1) = dCOdt(end);
COmid = (CO_Interp + [CO_Interp(2:end);CO_Interp(end)])/2; % CO in middle of step
kdil = -dCOdt./(COmid-ChemInput.BGMixingRatios(68));
kdil(kdil < 0 ) = 0;

% These are scaling factors that we use to adjust the VOCs and NOx to get
% this right.
% mimic the WF1
%if Flight_ID=='FN06'
%    ScaleFacVOC = 2;
%    ScaleFacMet = 1;
%    ScaleFacNOx = 2;
%    ScaleFacHONO = ScaleFacNOx*2.2;
%end
% Lixu, not sure why matt set up above scaling factor 
if Flight_ID=='FN06'
    ScaleFacVOC = 1;
    ScaleFacMet = 1;
    ScaleFacNOx = 1;
    ScaleFacHONO = ScaleFacNOx*1;
end

if Flight_ID=='FN19'
    ScaleFacVOC = 1;
    ScaleFacMet = 1.1;
    ScaleFacNOx = 1;
    ScaleFacHONO = ScaleFacNOx;
end

% Make sure all postive values
MetInput_Interp.jO3(MetInput_Interp.jO3 < 0) = 0;
MetInput_Interp.jNO2(MetInput_Interp.jNO2 < 0) = 0;
MetInput_Interp.jHONO(MetInput_Interp.jHONO < 0) = 0;
MetInput_Interp.jHNO3(MetInput_Interp.jHNO3 < 0) = 0;
MetInput_Interp.jFormaldehyde_HCO(MetInput_Interp.jFormaldehyde_HCO < 0) = 0;
MetInput_Interp.jFormaldehyde_CO(MetInput_Interp.jFormaldehyde_CO < 0) = 0;
MetInput_Interp.jAcetaldehyde_CH3(MetInput_Interp.jAcetaldehyde_CH3 < 0) = 0;
MetInput_Interp.jGlyoxal_H2(MetInput_Interp.jGlyoxal_H2 < 0) = 0;
MetInput_Interp.jGlyoxal_CH2O(MetInput_Interp.jGlyoxal_CH2O < 0) = 0;
MetInput_Interp.jGlyoxal_HCO(MetInput_Interp.jGlyoxal_HCO < 0) = 0;
MetInput_Interp.jNO2_downfrac(MetInput_Interp.jNO2_downfrac < 0) = 0;
MetInput_Interp.jCH3OOH(MetInput_Interp.jCH3OOH < 0) = 0;


% This is used to resolve the NAN in FN19
if Flight_ID == 'FN19'
    MetInput_Interp.RH = 80;
end

Met = {...
    'P'             MetInput_Interp.Pressure_Mbar(1);... %Pressure, mbar
    'T'             MetInput_Interp.Temperature_C(1)+273.15;...    %Temperature, K
    'RH'            MetInput_Interp.RH;...    %Relative Humidity, percent    
    'kdil'          kdil;...    %dilution, /s
    'SZA'           MetInput_Interp.SZA;... %solar zenith angle
    nJO3_O3P        MetInput_Interp.jO3.*ScaleFacMet;...
    nJNO2           MetInput_Interp.jNO2.*ScaleFacMet;... %NO2 photolysis frequency
    nJHONO          MetInput_Interp.jHONO.*ScaleFacMet;... %HONO photoysis frequency
    nJHNO3          MetInput_Interp.jHNO3.*ScaleFacMet;... %HNO3 photolysis frequency
    nJHCHO_HO2      MetInput_Interp.jFormaldehyde_HCO.*ScaleFacMet;... %formaldehyde photolysis frequency
    nJHCHO_H2       MetInput_Interp.jFormaldehyde_CO.*ScaleFacMet;... %formaldehyde photolysis frequency
    nJCH3CHO_CH3    MetInput_Interp.jAcetaldehyde_CH3.*ScaleFacMet;... % acetaldehyde photolysis frequency
    nJCHOCHO_H2     MetInput_Interp.jGlyoxal_H2.*ScaleFacMet;... %glyoxal photolysis frequency
    nJCHOCHO_CH2O   MetInput_Interp.jGlyoxal_CH2O.*ScaleFacMet;... %glyoxal photolysis frequency
    nJCHOCHO_HCO    MetInput_Interp.jGlyoxal_HCO.*ScaleFacMet;... %glyoxal photolysis frequency
    nJCH3OOH        MetInput_Interp.jCH3OOH.*ScaleFacMet;... %photolysis frequency for peroxides
    'jcorr'         MetInput_Interp.jNO2_downfrac.*ScaleFacMet;... %correction factor for all other frequencies, based on downfrac of jNO2
    };
    
clear dCOdt COmid kdil

% Available smoke plume OH measurements are closer to 1E7 in Hobbs et al 2003, Yokelson et al 2009, Akagi et al 2012.
smk_OH  = 4.0e-4;% Assuming ~2e6/1e8 molec cm-3 for OH and HO2 (see Stone et al., 2012; Liao et al., 2021); convert into ppb by dividing 2.46e10 (http://tinyurl.com/ac-cheat2)
smk_HO2 = 4.07e-3;
OH_holder = 0;

%% CHEMICAL CONCENTRATIONS
%{
The first observational point is used as initial inputs. 
All concentrations will be calculated "free running," meaning no constraints along the transect.
%}
% Initial Concentrations
InitConc = {...
%   names       conc(ppb)                                                   HoldMe
    'CO'         ChemInput.CO(starting_point)                                           0;... %CO
    'NO'         ChemInput.NO(starting_point).*ScaleFacNOx                              0;... %NO
    'NO2'        ChemInput.NO2(starting_point).*ScaleFacNOx                             0;... %NO2
     nHONO       ChemInput.HONO(starting_point).*ScaleFacHONO                           0;... %HONO
    
    'O3'         ChemInput.O3(starting_point)                                           0;...
    'PAN'        ChemInput.PAN(starting_point)                                          0;...
    'HNO3'       0                                                                      0;... %HNO3 from AMS
    
    'OH'         smk_OH                                                                 OH_holder;... %
    'HO2'        smk_HO2                                                                0;...
    
    % CxHy
    'CH4'        ChemInput.CO(starting_point).*ScaleFacVOC.*46.31.*0.001                0;... scalling from Temperate forest in Andreae 2019
    
    'C2H2'       ChemInput.acetylene(starting_point).*ScaleFacVOC                       0;... %Acetylene
    nC2H4        ChemInput.ethene(starting_point).*ScaleFacVOC                          0;... %Ethene (from iWAS)
    
    nPRPE        ChemInput.Propene(starting_point).*ScaleFacVOC + ChemInput.butenes(starting_point).*ScaleFacVOC + ChemInput.Pentene_methylbutene(starting_point).*ScaleFacVOC      0;...
    nC3H6        ChemInput.Propene(starting_point).*ScaleFacVOC                         0;... %Propene
    nBUT1ENE     ChemInput.butenes(starting_point).*ScaleFacVOC                         0;... %Butenes (from iWAS)
    nPENT1ENE    ChemInput.Pentene_methylbutene(starting_point).*ScaleFacVOC            0;... %Pentene (from iWAS)
    nHEX1ENE     ChemInput.CO(starting_point).*ScaleFacVOC.*0.75.*0.001                 0;... %Hexene, scalling from Temperate forest in Andreae 2019

    'C3H8'       ChemInput.CO(starting_point).*ScaleFacVOC*2.45.*0.001          0;...

    nALK4        ChemInput.CO(starting_point).*ScaleFacVOC.*(0.71+0.27+0.3+0.15+0.28+0.23+0.23+0.25).*0.001                     0;... 
    nNC4H10      ChemInput.CO(starting_point).*ScaleFacVOC.*0.71.*0.001         0;...
    nIC4H10      ChemInput.CO(starting_point).*ScaleFacVOC.*0.27.*0.001         0;...
    nNC5H12      ChemInput.CO(starting_point).*ScaleFacVOC.*0.3.*0.001          0;... 
    nIC5H12      ChemInput.CO(starting_point).*ScaleFacVOC.*0.15.*0.001         0;...
    nNC6H14      ChemInput.CO(starting_point).*ScaleFacVOC.*0.28.*0.001         0;... 
    nM3PE        ChemInput.CO(starting_point).*ScaleFacVOC.*0.23.*0.001         0;... 
    nM22C4       ChemInput.CO(starting_point).*ScaleFacVOC.*0.23.*0.001         0;...
    nNC7H16      ChemInput.CO(starting_point).*ScaleFacVOC.*0.25.*0.001         0;... 

    nHCHO        ChemInput.Formaldehyde(starting_point).*ScaleFacVOC       0;... %Formaldehyde (use ISAF)
    nALD2        ChemInput.Acetaldehyde(starting_point).*ScaleFacVOC       0;... %Acetaldehyde
    
    nRCHO        ChemInput.CO(starting_point).*ScaleFacVOC.*(0.77+0.97+0.52+0.34+0.04).*0.001    0;...
    nC2H5CHO     ChemInput.CO(starting_point).*ScaleFacVOC.*0.77.*0.001    0;... %Propanal
    nC3H7CHO     ChemInput.CO(starting_point).*ScaleFacVOC.*0.97.*0.001    0;...
    nIPRCHO      ChemInput.CO(starting_point).*ScaleFacVOC.*0.52.*0.001    0;... %Scaled it from Liu et al., 2016
    nC5H11CHO    ChemInput.CO(starting_point).*ScaleFacVOC.*0.34.*0.001    0;... % Lixu
    nC6H13CHO    ChemInput.CO(starting_point).*ScaleFacVOC.*0.04.*0.001    0;... % Lixu
    nGLYX        ChemInput.Glyoxal(starting_point).*ScaleFacVOC            0;... %Glyoxal (from ACES)
    
    % Aromatics
    nBENZ        ChemInput.Benzene(starting_point).*ScaleFacVOC            0;... %Benzene
    nTOLU        ChemInput.CO(starting_point).*ScaleFacVOC                 0;... %Toluene
    nXYLE        ChemInput.CO(starting_point).*ScaleFacVOC.*(0.65+0.25+0.51)        0;... % xylenes in GEOS-Chem
    nmpXYLE      ChemInput.CO(starting_point).*ScaleFacVOC.*0.65                    0;... % p-Xylene
    noXYLE       ChemInput.CO(starting_point).*ScaleFacVOC.*0.25                    0;... % o-Xylene
    netBENZ      ChemInput.CO(starting_point).*ScaleFacVOC.*0.51                    0;... % Ethylbenzene
    
    % Organic acids
    'HCOOH'      ChemInput.FormicAcid(starting_point).*ScaleFacVOC         0;... %Formic Acid
    nACTA        ChemInput.AceticAcid(starting_point).*ScaleFacVOC         0;... %Acetic Acid
    
    % Biogenics
    nISOP        ChemInput.Isoprene(starting_point).*ScaleFacVOC           0;... %Isoprene (use iWAS)
    nMTPA        ChemInput.Monoterpenes(starting_point).*ScaleFacVOC       0;... %MTPA in GEOS-Chem
    nAPINENE     ChemInput.Monoterpenes(starting_point).*ScaleFacVOC       0;... %Alpha Pinene
    
    'MACR'       ChemInput.MACR(starting_point).*ScaleFacVOC               0;... %MACR
    'MVK'        ChemInput.MVK(starting_point).*ScaleFacVOC                0;... %MVK
    
    % alcohol
    nMOH         ChemInput.Methanol(starting_point).*ScaleFacVOC           0;... %Methanol
    nEOH         ChemInput.Ethanol(starting_point).*ScaleFacVOC            0;... %Ethanol
    
    % Ketones
    nACET        ChemInput.Acetone(starting_point).*ScaleFacVOC            0;... %Acetone
    'MEK'        ChemInput.MEK(starting_point).*ScaleFacVOC                0;... %MEK
    
    % Furans    
    nFURAN       ChemInput.Furan(starting_point).*ScaleFacVOC              0;... %Furan
    nM2FURAN     ChemInput.MethylFuran(starting_point).*ScaleFacVOC        0;... %Methylfuran (~50% of signal)
    nDIMEFURAN   ChemInput.Dimethylfuran(starting_point).*ScaleFacVOC*0.5  0;... %Dimethyl furan (~50% of signal, according to Abby)
    nFURFURAL    ChemInput.Furfural(starting_point).*ScaleFacVOC           0;... %Furfural (~85% of signal)
    nMEFURFURAL  ChemInput.MethylFurfural(starting_point).*ScaleFacVOC     0;... %Methyl furfural
    nBZFUONE     ChemInput.Furanone(starting_point).*ScaleFacVOC           0;... %Furanone

    % others
    nGLYC        ChemInput.CO(starting_point).*ScaleFacVOC.*3.46.*0.001    0;... %
    'DMS'        ChemInput.CO(starting_point).*ScaleFacVOC.*0.12.*0.001    0;... %
    nACR         ChemInput.Acrolein(starting_point).*ScaleFacVOC           0;... %Acrolein
    nMGLY        ChemInput.Methylglyoxal(starting_point).*ScaleFacVOC      0;... %Methylglyoxal (from ACES)
    'PPN'        ChemInput.CO(starting_point).*ScaleFacVOC*0.1.*0.001      0;...
    nHAC         ChemInput.hydroxyacetone(starting_point).*ScaleFacVOC     0;... %Hydroxyacetone
    nMETHACET    ChemInput.methylacetate(starting_point).*ScaleFacVOC      0;... %Methyl acetate
    nETHFORM     ChemInput.CO(starting_point).*ScaleFacVOC.*2.8.*0.001     0;...
    nMALANHY     ChemInput.MaleicAnhydride(starting_point).*ScaleFacVOC    0;... %Maleic Anhydride (prominent secondary product) ChemInput.InitialConditions(66)*ScaleFac
    nC4H6        ChemInput.InitialConditions(8).*ScaleFacVOC               0;... %1,3 butadiene, Lixu, do not found in the input
    nC4ALDB      ChemInput.Crotonaldehyde(starting_point).*ScaleFacVOC     0;... %Crotonaldehyde
    nBIACET      ChemInput.Butanedione(starting_point).*ScaleFacVOC        0;... %2,3 butanedione
    
    nMPRK        ChemInput.CO(starting_point).*ScaleFacVOC.*0.16.*0.001    0;...
    nDIEK        ChemInput.CO(starting_point).*ScaleFacVOC.*0.16.*0.001    0;...
    
    nPHEN        ChemInput.Phenol(starting_point).*ScaleFacVOC             0;... %Phenol (100% of signal)
    nCATECHOL    ChemInput.InitialConditions(3)*ScaleFacVOC                0;... %Catechol, Lixu, do not found in the input
    nCYHEXOL     ChemInput.CO(starting_point).*ScaleFacVOC.*0.017.*0.001   0;...

    
    nBALD        ChemInput.Benzaldehyde(starting_point).*ScaleFacVOC       0;... %Benzaldehyde
    nCSL         ChemInput.Cresol(starting_point).*ScaleFacVOC             0;... %Cresol
    nGUAIACOL    ChemInput.Guaiacol(starting_point).*ScaleFacVOC           0;... %Guaiacol
    nHEPT3ONE    ChemInput.CO(starting_point).*ScaleFacVOC.*0.04.*0.001    0;...   

    nSTYRENE     ChemInput.Styrene(starting_point).*ScaleFacVOC            0;... %Styrene
    nOXYLAL      ChemInput.CO(starting_point).*ScaleFacVOC*0.34.*0.001     0;... 
    nMGUAIACOL   ChemInput.CO(starting_point).*ScaleFacVOC*0.77.*0.001     0;... 
    
    nSYRINGOL    ChemInput.CO(starting_point).*ScaleFacVOC*0.12.*0.001     0;... 
    nTM123B      ChemInput.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nIPBENZ      ChemInput.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nPBENZ       ChemInput.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nMETHTOL     ChemInput.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nPETHTOL     ChemInput.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nTM135B      ChemInput.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nOETHTOL     ChemInput.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    
    nBCARY       ChemInput.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 

    % For FIREX-AQ
    nACO2H       ChemInput.Acrylicacid(starting_point).*ScaleFacVOC        0;... %Acrylic Acid (assume same as methyl glyoxal)
    nOXYLOL      ChemInput.InitialConditions(39).*ScaleFacVOC              0;... %Dimethylphenol, assume asll ortho xylol, Lixu, cannot find Dimethylphenol or ortho xylol
    nPBZQONE     ChemInput.InitialConditions(58).*ScaleFacVOC              0;... %Benzoquinone, Lixu, cannot find Benzoquinone
    nACETONIT    ChemInput.Acetonitrile(starting_point).*ScaleFacVOC       0;... %Acetonitrile
    'H2O2'        0                                                        0;... %OH source option #1
    nNCATECHOL    0.7                                                      0;...
    };
disp('done, provide initial data')

%%%%%%%%%%%%%%%%%
% chemistry
%%%%%%%%%%%%%%%%%
chemistry_provider;
disp('done, provide chemistry mechanism')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DILUTION CONCENTRATIONS
% Background concentrations are taken from observations just outside the plume.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BkgdConc = {...
%   names               values
    'DEFAULT'    0                                 ;... %0 for all zeros, 1 to use InitConc
    'CO'         ChemInput.BGMixingRatios(68)      ; %CO
    'NO'         ChemInput.BGMixingRatios(62)      ; %NO
    'NO2'        ChemInput.BGMixingRatios(63)      ; %NO2
    nHONO       ChemInput.BGMixingRatios(64)       ; %HONO
    'O3'         ChemInput.BGMixingRatios(67)      ;
    'PAN'        ChemInput.BGMixingRatios(69)      ;
    'HNO3'       0.25                              ;

    'C2H2'       ChemInput.BGMixingRatios(52)      ; %Acetylene
    nC2H4        ChemInput.BGMixingRatios(18)      ; %Ethene (from iWAS)
    nC3H6        ChemInput.BGMixingRatios(5)       ; %Propene
    nBUT1ENE     ChemInput.BGMixingRatios(24)      ; %Butenes (from iWAS)
    nPENT1ENE     ChemInput.BGMixingRatios(48)     ; %Pentene (from iWAS)
    nPRPE        ChemInput.BGMixingRatios(5) + ChemInput.BGMixingRatios(24) + ChemInput.BGMixingRatios(48)    ; %Propene
    nHCHO        ChemInput.BGMixingRatios(2)       ; %Formaldehyde (use ISAF)
    nALD2        ChemInput.BGMixingRatios(6)       ; %Acetaldehyde
    nGLYX        ChemInput.BGMixingRatios(33)      ; %Glyoxal (from ACES)
    nBENZ        ChemInput.BGMixingRatios(49)      ; %Benzene
    nTOLU        ChemInput.BGMixingRatios(50)      ; %Toluene
    'HCOOH'      ChemInput.BGMixingRatios(53)      ; %Formic Acid
    nACTA        ChemInput.BGMixingRatios(20)      ; %Acetic Acid
    nISOP        ChemInput.BGMixingRatios(10)      ; %Isoprene (use iWAS)
    nAPINENE     ChemInput.BGMixingRatios(1)       ; %Alpha Pinene
    'MACR'       ChemInput.BGMixingRatios(26)      ; %MACR
    'MVK'        ChemInput.BGMixingRatios(25)      ; %MVK
    nMOH         ChemInput.BGMixingRatios(44)      ; %Methanol
    nEOH         ChemInput.BGMixingRatios(55)      ; %Ethanol
    nACET        ChemInput.BGMixingRatios(51)      ; %Acetone
    'MEK'        ChemInput.BGMixingRatios(60)      ; %MEK
    nFURAN       ChemInput.BGMixingRatios(13)      ; %Furan
    nM2FURAN     ChemInput.BGMixingRatios(15)      ; %Methylfuran (~50% of signal)
    nDIMEFURAN   ChemInput.BGMixingRatios(9)       ; %Dimethyl furan (~50% of signal, according to Abby)
    nFURFURAL    ChemInput.BGMixingRatios(14)      ; %Furfural (~85% of signal)
    nMEFURFURAL  ChemInput.BGMixingRatios(4)       ; %Methyl furfural
    nACR         ChemInput.BGMixingRatios(7)       ; %Acrolein
    nMGLY        ChemInput.BGMixingRatios(31)      ; %Methylglyoxal (from ACES)
    nHAC         ChemInput.BGMixingRatios(56)      ; %Hydroxyacetone
    nMETHACET    ChemInput.BGMixingRatios(57)      ; %Methyl acetate
    nMALANHY     ChemInput.BGMixingRatios(66)      ; %Maleic Anhydride (prominent secondary product)
    nBZFUONE     ChemInput.BGMixingRatios(17)      ; %Furanone
    nC4H6        ChemInput.BGMixingRatios(8)       ; %1,3 butadiene
    nC4ALDB      ChemInput.BGMixingRatios(27)      ; %Crotonaldehyde
    nBIACET      ChemInput.BGMixingRatios(59)      ; %2,3 butanedione
    nPHEN        ChemInput.BGMixingRatios(21)      ; %Phenol (100% of signal)
    nCATECHOL    ChemInput.BGMixingRatios(3)       ; %Catechol
    nBALD        ChemInput.BGMixingRatios(54)      ; %Benzaldehyde
    nCSL         ChemInput.BGMixingRatios(28)      ; %Cresol
    nGUAIACOL    ChemInput.BGMixingRatios(11)      ; %Guaiacol
    nSTYRENE     ChemInput.BGMixingRatios(40)      ; %Styrene
    nACO2H       ChemInput.BGMixingRatios(32)      ; %Acrylic Acid (assume same as methyl glyoxal)
    nOXYLOL      ChemInput.BGMixingRatios(39)      ; %Dimethylphenol, assume asll ortho xylol
    nMETHCOACET  ChemInput.BGMixingRatios(42)      ; %Acetic anhydride
    nPBZQONE     ChemInput.BGMixingRatios(58)      ; %Benzoquinone
    nNCATECHOL    0                                ;
    %'N2O'        0                               ; % Lixu, change 330 into 0
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
"Repeat" is set to 1 because we only want to go through each step once.
"IntTime" is the integration time for each step. The average for constraints is 250s.
"SavePath" is just a filename, which will be saved by default in the \Runs\ folder.
%}
ModelOptions.Verbose = 1;         %flag for verbose output
ModelOptions.EndPointsOnly = 0;   %flag for concentration and rate outputs
ModelOptions.LinkSteps = 1;       %flag for using end-points of one run to initialize next run
ModelOptions.IntTime = TimeStep*60; %integration time for each step, seconds

prefix = '/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/';
ModelOptions.SavePath = [prefix, 'output_data/FIREXAQ_', MECHANISM, Flight_ID];

disp('done, provide model options.')

%% MODEL RUN
% Now we call the model.
% Output will be saved in the "SavePath" above and will also be written to the structure S.
% Let's also throw away the inputs (don't worry, they are saved in the output structure).
S = F0AM_ModelCore(Met,InitConc,ChemFiles,BkgdConc,ModelOptions);
clear Met InitConc ChemFiles BkgdConc ModelOptions
disp('done, finish the run of the model.')


% ===================================
% Get dilution corrected mixing ratio
% ===================================
% calculate normalized excess mixing ratios: delta_X_dil = delta_X * delta_CO_source/delta_CO
% this is standard procedure for biomass burning plumes.
% We will also put these into a new structure compatible with F0AM plotting routines.
delta_CO = S.Conc.CO - S.BkgdConc.CO(1);
fCO = delta_CO(starting_point)./delta_CO;
Sd.Met = S.Met; Sd.Cnames = S.Cnames; Sd.Time = S.Time;
for i=1:length(S.Cnames)
    name = S.Cnames{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Sd.Conc.(name) = (S.Conc.(name) - b).*fCO;
    Sd.BkgdConc.(name) = b;
end

fileoutput = [prefix, 'output_data/FIREXAQ_dilution_corrected', MECHANISM, Flight_ID];
save(fileoutput,'Sd')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting and data analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set some needed variables for plotting
% Time
obs_time = ChemInput.TimeDownwind_s-ChemInput.TimeDownwind_s(starting_point); % aging corrected
mod_time = S.Time;

smk_CO  = ChemInput.CO;
smk_O3  = ChemInput.O3;
smk_NO  = ChemInput.NO;
smk_NO2 = ChemInput.NO2;

%plotting_comp;
disp('done, finish the figure plotting.')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Checking init. NOx
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('This is init NOx conc!')
disp(smk_NO(starting_point) + smk_NO2(starting_point));
disp(smk_CO(starting_point));
