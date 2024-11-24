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
% Lixu, 11/03/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
name_reorg;
disp('done, naming reorganization')

% choose the flight ID
Flight_ID = 'P3B';

% choose the start point
starting_point = 1;

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
load LagrangianPlumeData_Extrapolated.mat
% this structure "DAQ" contains data from an agricultural fire observed from the NASA P3 
% during the DISCOVER-AQ flight on 29 Sept 2013.
% Data are averaged into 1km bins (distance from the source).
% DAQ.TIME is a lagrangian time calculated from observed wind speed and downwind sample distance.


% + magic_args="METEOROLOGY"
%{
Pressure, temperature, and either RH or H2O are required Met inputs.
Dilution is calculated using the change in CO over each model step.
All calculated J-values will be scaled to J4.
%}
% -


%kdil calculation using CO decay
dCOdt        = diff(DAQ.CO_EXT)./diff(DAQ.TIME_EXT); %loss rate
dCOdt(end+1) = dCOdt(end);
COmid        = (DAQ.CO_EXT + [DAQ.CO_EXT(2:end);DAQ.CO_EXT(end)])/2; %CO in middle of step
kdil         = -dCOdt./(COmid-95);

PhotoScale = 1;
jcorr = DAQ.jcorr.*PhotoScale;
jNO2 = DAQ.JNO2.*PhotoScale;


% Lixu, 11/03/2022, interp met data to make a consistent time step
% Lixu, 11/15/2022, wind direction and wind speed is not included and thus GAM may not be feasible to calculate
P     = interp1(DAQ.TIME_EXT, DAQ.P, DAQ.TIME);
T     = interp1(DAQ.TIME_EXT, DAQ.T, DAQ.TIME);
RH    = interp1(DAQ.TIME_EXT, DAQ.RH, DAQ.TIME);
kdil  = interp1(DAQ.TIME_EXT, kdil, DAQ.TIME);
SZA   = interp1(DAQ.TIME_EXT, DAQ.SZA, DAQ.TIME);
jcorr = interp1(DAQ.TIME_EXT, jcorr, DAQ.TIME);
jNO2  = interp1(DAQ.TIME_EXT, jNO2, DAQ.TIME);

Met = {...
    'P'             P;... %Pressure, mbar
    'T'             T;...    %Temperature, K
    'RH'            RH;...    %Relative Humidity, percent    
    'kdil'          kdil;...    %dilution, /s
    'SZA'           SZA;... %solar zenith angle
    'jcorr'         jcorr;... %correction factor. Muller did not use this.
    nJNO2           jNO2;... %NO2 photolysis frequency
    };

clear dCOdt COmid kdil
% Available smoke plume OH measurements are closer to 1E7 in Hobbs et al 2003, Yokelson et al 2009, Akagi et al 2012.
smk_OH  = 4.0e-4;% Assuming ~2e6/1e8 molec cm-3 for OH and HO2 (see Stone et al., 2012; Liao et al., 2021); convert into ppb by dividing 2.46e10 (http://tinyurl.com/ac-cheat2)
smk_HO2 = 4.07e-3;
OH_holder = 0;

% + magic_args="CHEMICAL CONCENTRATIONS"
%{
The first observational point is used as initial inputs. 
All concentrations will be calculated "free running," meaning no constraints along the transect.
%}
InitConc = {...
%   names               conc(ppb)               HoldMe  
    'CO'                DAQ.CO(starting_point)                     0;... % Lixu, will not change restuls from Matt
    %NOy 
    'NO'                DAQ.NO(starting_point)                     0;...
    'NO2'               DAQ.NO2(starting_point)                    0;...
    nHONO               DAQ.HONO(starting_point)                   0;... %HONO
    
    'O3'                DAQ.O3(starting_point)                     0;...
    %'SO2'              0                                          0;...
    'PAN'               0                                          0;... %Not matching
    'HNO3'              2.10E+01                                   0;... %HNO3 from WE-CAN RF03, probably change it into the inital concentration?

    'OH'                smk_OH                                     OH_holder;... %
    'HO2'               smk_HO2                                    0;...
    
    % CxHy
    'CH4'               DAQ.CH4(starting_point)                    0;...
    
    'C2H2'              DAQ.CO(starting_point).*3.50*0.001         0;... % Permar et al.
    nC2H4               DAQ.CO(starting_point).*15.83*0.001        0;... % Ethene, Permar et al.
    'C2H6'              DAQ.CO(starting_point).*6.16*0.001         0;... %scalling from Temperate forest in Andreae 2019

    nPRPE               DAQ.C3H6(starting_point)+DAQ.CO(starting_point).*(1.09+0.33+0.33+0.42).*0.001                 0;... %propene    
    nC3H6               DAQ.C3H6(starting_point)                   0;... %propene
    nBUT1ENE            DAQ.CO(starting_point).*1.09*0.001         0;... %scalling from Temperate forest in Andreae 2019
    nTBUT2ENE           DAQ.CO(starting_point).*0.33*0.001         0;...
    nCBUT2ENE           DAQ.CO(starting_point).*0.33*0.001         0;...
    nPENT1ENE           DAQ.CO(starting_point).*0.42*0.001         0;...
    nHEX1ENE            DAQ.CO(starting_point).*0.75*0.001         0;...

    'C3H8'              DAQ.CO(starting_point).*2.45*0.001         0;...
    
    nALK4               DAQ.CO(starting_point).*ScaleFacVOC.*(0.71+0.27+0.3+0.15+0.28+0.23+0.23+0.25+0.071+0.052+0.034+0.015+0.017+0.033).*0.001                     0;... 
    nNC4H10             DAQ.CO(starting_point).*ScaleFacVOC.*0.71.*0.001         0;...
    nIC4H10             DAQ.CO(starting_point).*ScaleFacVOC.*0.27.*0.001         0;...
    nNC5H12             DAQ.CO(starting_point).*ScaleFacVOC.*0.3.*0.001          0;... 
    nIC5H12             DAQ.CO(starting_point).*ScaleFacVOC.*0.15.*0.001         0;...
    nNC6H14             DAQ.CO(starting_point).*ScaleFacVOC.*0.28.*0.001         0;... 
    nM3PE               DAQ.CO(starting_point).*ScaleFacVOC.*0.23.*0.001         0;... 
    nM22C4              DAQ.CO(starting_point).*ScaleFacVOC.*0.23.*0.001         0;...
    nNC7H16             DAQ.CO(starting_point).*ScaleFacVOC.*0.25.*0.001         0;...
    nNC8H18             DAQ.CO(starting_point).*ScaleFacVOC.*(0.071+0.052+0.034+0.015+0.017).*0.001                      0;... %scalling from Permar 2020
    nNC9H20             DAQ.CO(starting_point).*ScaleFacVOC.*0.033.*0.001                                                0;... %scalling from Permar 2020
    nNC10H22            0                                                                                                0;...
    nNC11H24            0                                                                                                0;...  
    
    % Aldehydes
    nHCHO               DAQ.HCHO(starting_point)                   0;... %Formaldehyde
    nALD2               DAQ.CH3CHO(starting_point)                 0;... %acetaldehyde
    
    %nRCHO               DAQ.CH3COCH3(starting_point).*0.5+DAQ.CO(starting_point).*ScaleFacVOC.*(0.97+0.52+0.34+0.04).*0.001         0;... %propanal, Permar et al.   
    %nC2H5CHO            DAQ.CH3COCH3(starting_point) .*0.5         0;... %propanal
    %nC3H7CHO            DAQ.CO(starting_point).*ScaleFacVOC.*0.97.*0.001    0;
    %nIPRCHO             DAQ.CO(starting_point).*ScaleFacVOC.*0.52.*0.001    0;... %Scaled it from Liu et al., 2016
    %nC5H11CHO           DAQ.CO(starting_point).*ScaleFacVOC.*0.34.*0.001    0;... % Lixu
    %nC6H13CHO           DAQ.CO(starting_point).*ScaleFacVOC.*0.04.*0.001    0;... % Lixu
    nRCHO               DAQ.CH3COCH3(starting_point).*0.22         0;... %propanal    
    nC2H5CHO            DAQ.CH3COCH3(starting_point).*0.78         0;... %propanal
    nGLYX               DAQ.CO(starting_point).*ScaleFacVOC.*4.82.*0.001    0;... %Glyoxal, from Andreae, Wade's value may be wrong with 2 magnitude lower.

    % Aromatics
    nBENZ               DAQ.BENZENE(starting_point).*ScaleFacVOC            0;... %benzene
    %nTOLU               DAQ.CO(starting_point).*ScaleFacVOC.*2.42*0.001     0;...
    %nXYLE               DAQ.CO(starting_point).*ScaleFacVOC.*(0.65+0.25+0.51)*0.001        0;... % xylenes in GEOS-Chem
    %nmpXYLE             DAQ.CO(starting_point).*ScaleFacVOC.*0.65*0.001                    0;... % p-Xylene
    %noXYLE              DAQ.CO(starting_point).*ScaleFacVOC.*0.25*0.001                    0;... % o-Xylene
    %netBENZ             DAQ.CO(starting_point).*ScaleFacVOC.*0.51*0.001                    0;... % Ethylbenzene
    
    nTOLU               DAQ.CO(starting_point).*ScaleFacVOC.*1.23*0.001                     0;... Permar
    nXYLE               DAQ.CO(starting_point).*ScaleFacVOC.*0.53*0.001                     0;... % xylenes in GEOS-Chem
    nmpXYLE             DAQ.CO(starting_point).*ScaleFacVOC.*0.53.*0.465*0.001              0;... % p-Xylene
    noXYLE              DAQ.CO(starting_point).*ScaleFacVOC.*0.53.*0.180*0.001              0;... % o-Xylene
    netBENZ             DAQ.CO(starting_point).*ScaleFacVOC.*0.23.*0.355*0.001              0;... % Ethylbenzene
    
    
    % Organic acids
    'HCOOH'             DAQ.HCOOH(starting_point)                  0;... %formic acid%
    nACTA               DAQ.CH3CO2H(starting_point)                0;... %Lixu
    
    % Biogenics
    nISOP               DAQ.C5H8(starting_point)                   0;... %isoprene
    nMTPA               DAQ.CO(starting_point).*ScaleFacVOC.*(2.7+2.7)*0.001                   0;... %MTPA in GEOS-Chem, Andreae
    nAPINENE            DAQ.CO(starting_point).*ScaleFacVOC.*2.7*0.001                         0;...
    nBPINENE            DAQ.CO(starting_point).*ScaleFacVOC.*2.7*0.001                         0;...
    
    'MACR'              DAQ.MVK(starting_point).*0.5               0;... %MACR
    'MVK'               DAQ.MVK(starting_point).*0.5               0;... %MVK
    
    % alcohols
    nMOH                DAQ.CH3OH(starting_point)                                     0;... %Methanol
    nEOH                DAQ.CO(starting_point).*ScaleFacVOC.*0.67*0.001               0;... %Ethanol
    
    % Ketones
    nACET               DAQ.CH3COCH3(starting_point) .*0.5                            0;... %acetone
    'MEK'               DAQ.CO(starting_point).*ScaleFacVOC.*0.52*0.001               0;... %Peng

    nFURAN              DAQ.FURAN(starting_point)                  0;... %furan; only decay!     
    nM2FURAN            DAQ.MEFURAN(starting_point)                0;... %Methyl Furan % naming!
    nDIMEFURAN          DAQ.CO(starting_point).*ScaleFacVOC.*0.83*0.001         0;... %Dimethyl Furan (assume 0.5 of methyl furan, based on primary emissions from FIRELAB), naming!!
    nFURFURAL           DAQ.FURFURAL(starting_point)                            0;... %2-furfural; only decay! naming!
    nMEFURFURAL         DAQ.CATECHOL(starting_point).*(2.75*0.5)                0;... %Methyl furfural (adjust for starting val), naming!!
    nBZFUONE            DAQ.FURANONE(starting_point)                            0;... %Furanone, adding it into the GEOS-Chem as well?
    
    % others
    nGLYC        DAQ.CO(starting_point).*ScaleFacVOC.*3.46.*0.001    0;... %
    'DMS'        DAQ.CO(starting_point).*ScaleFacVOC.*0.12.*0.001    0;... %
    nACR         DAQ.CO(starting_point).*ScaleFacVOC.*5.4.*0.001     0; %Acrolein
    nMGLY        DAQ.MGLYOX(starting_point)                          0;... %methylglyoxal
    'PPN'        DAQ.CO(starting_point).*ScaleFacVOC*0.1.*0.001      0;...
    nHAC         DAQ.ACETOL(starting_point)                          0;... %hydroxyacetone
    nMETHACET    DAQ.CO(starting_point).*ScaleFacVOC*0.85.*0.001     0; %Methyl acetate
    nETHFORM     DAQ.CO(starting_point).*ScaleFacVOC.*2.8.*0.001     0;...
    
    nMALANHY     DAQ.MALANHY(starting_point)                         0;... %Maleic Anhydride
    nC4H6        DAQ.CO(starting_point).*ScaleFacVOC.*1.11.*0.001    0;... %1,3 butadiene, Lixu, do not found in the input
    nC4ALDB      DAQ.CO(starting_point).*ScaleFacVOC.*3.48.*0.001    0;... %Crotonaldehyde
    nBIACET      DAQ.BIACET(starting_point)                          0;... %2,3 butanedione
    
    nMPRK        DAQ.CO(starting_point).*ScaleFacVOC.*0.16.*0.001    0;...
    nDIEK        DAQ.CO(starting_point).*ScaleFacVOC.*0.16.*0.001    0;...
    
    nPHEN        DAQ.PHENOL(starting_point)*1.05                     0;... %Phenol (adjust for starting val)
    nCATECHOL    DAQ.CATECHOL(starting_point).*(2.75*0.5)            0;... %Catechol (adjust for starting val)
    nCYHEXOL     DAQ.CO(starting_point).*ScaleFacVOC.*0.017.*0.001   0;...
    
    nBALD        DAQ.CO(starting_point).*ScaleFacVOC.*1.17.*0.001    0;... %Benzaldehyde
    nCSL         DAQ.CRESOL(starting_point).*1.5                     0;... %Cresol (adjust for starting val) 
    nGUAIACOL    DAQ.CO(starting_point).*ScaleFacVOC.*1.3.*0.001     0;... %Guaiacol
    nHEPT3ONE    DAQ.CO(starting_point).*ScaleFacVOC.*0.04.*0.001    0;...   

    nSTYRENE     DAQ.STYRENE(starting_point)                         0;... %Styrene
    nOXYLAL      DAQ.CO(starting_point).*ScaleFacVOC*0.34.*0.001     0;... 
    nMGUAIACOL   DAQ.CO(starting_point).*ScaleFacVOC*0.77.*0.001     0;... 
    
    nSYRINGOL    DAQ.CO(starting_point).*ScaleFacVOC*0.12.*0.001     0;... 
    nTM123B      DAQ.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;...
    nIPBENZ      DAQ.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nPBENZ       DAQ.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nMETHTOL     DAQ.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nPETHTOL     DAQ.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nTM135B      DAQ.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    nOETHTOL     DAQ.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    
    nBCARY       DAQ.CO(starting_point).*ScaleFacVOC*0.15.*0.001     0;... 
    % For FIREX-AQ
    nACO2H       DAQ.CO(starting_point).*ScaleFacVOC*(1.4+0.36)/1000.0          0;... %Acrylic Acid (assume same as methyl glyoxal)
    nOXYLOL      DAQ.CO(starting_point).*ScaleFacVOC*(0.37)/1000.0              0;... %Dimethylphenol, assume asll ortho xylol, Lixu, cannot find Dimethylphenol or ortho xylol
    nPBZQONE     DAQ.CO(starting_point).*ScaleFacVOC*(0.34)/1000.0              0;... %Benzoquinone, Lixu, cannot find Benzoquinone
    nACETONIT    DAQ.CO(starting_point).*ScaleFacVOC*(1.00)/1000.0              0;... %Acetonitrile
    'H2O2'        0                                                             0;... %OH source option #1
    
    % Species mapped to MCM using OH reaction rate coefficient and molecular formula (Wolfe et al., 2022)
    nMEKAOH            DAQ.CO(starting_point).*ScaleFacVOC*1.73/1000.0                            0;...
    nC512OOH           DAQ.CO(starting_point).*ScaleFacVOC*(1.08+0.91)/1000.0                     0;...
    nHEX3ONDOOH        DAQ.CO(starting_point).*ScaleFacVOC*0.78/1000.0                            0;...
    nM3HEXANO3         DAQ.CO(starting_point).*ScaleFacVOC*(0.64+0.21)/1000.0                     0;...
    nCO1M22CHO         DAQ.CO(starting_point).*ScaleFacVOC*0.57/1000.0                            0;...
    nHO2CO4CHO         DAQ.CO(starting_point).*ScaleFacVOC*0.57/1000.0                            0;...
    nPEBOH             DAQ.CO(starting_point).*ScaleFacVOC*0.57/1000.0                            0;...
    nC4DBDIKET         DAQ.CO(starting_point).*ScaleFacVOC*0.48/1000.0                            0;...
    nHO25C6            DAQ.CO(starting_point).*ScaleFacVOC*0.48/1000.0                            0;...
    nC7CO4EDB          DAQ.CO(starting_point).*ScaleFacVOC*0.47/1000.0                            0;...
    nMAE               DAQ.CO(starting_point).*ScaleFacVOC*0.46/1000.0                            0;...
    nLIMKET            DAQ.CO(starting_point).*ScaleFacVOC*(0.37+0.24)/1000.0                     0;...
    nCO2M33CO3H        DAQ.CO(starting_point).*ScaleFacVOC*0.35/1000.0                            0;...
    nHO25C7            DAQ.CO(starting_point).*ScaleFacVOC*0.31/1000.0                            0;...
    nHMACO3H           DAQ.CO(starting_point).*ScaleFacVOC*0.21/1000.0                            0;...
    nHO3C5CHO          DAQ.CO(starting_point).*ScaleFacVOC*0.15/1000.0                            0;...
    nM23C4             DAQ.CO(starting_point).*ScaleFacVOC*0.14/1000.0                            0;...
    nUDECOH            DAQ.CO(starting_point).*ScaleFacVOC*0.14/1000.0                            0;...
    nDECOH             DAQ.CO(starting_point).*ScaleFacVOC*0.13/1000.0                            0;...
    nCHCL2CHO          DAQ.CO(starting_point).*ScaleFacVOC*0.12/1000.0                            0;...
    nNOPINAOH          DAQ.CO(starting_point).*ScaleFacVOC*(0.12+0.10+0.08) /1000.0               0;...
    nIEB4CHO           DAQ.CO(starting_point).*ScaleFacVOC*0.11/1000.0                            0;...
    nDICLETOH          DAQ.CO(starting_point).*ScaleFacVOC*(0.11+0.006+0.01)/1000.0               0;...
    nETBE              DAQ.CO(starting_point).*ScaleFacVOC*0.11/1000.0                            0;...
    nME2BUT2ENE        DAQ.CO(starting_point).*ScaleFacVOC*0.11/1000.0                            0;...
    nM3PECOOH          DAQ.CO(starting_point).*ScaleFacVOC*0.09/1000.0                            0;...
    nETHOX             DAQ.CO(starting_point).*ScaleFacVOC*0.09/1000.0                            0;...
    nC8BCCO            DAQ.CO(starting_point).*ScaleFacVOC*0.09/1000.0                            0;...
    nC7MOCOCO3H        DAQ.CO(starting_point).*ScaleFacVOC*0.09/1000.0                            0;...
    nCCL3CHO           DAQ.CO(starting_point).*ScaleFacVOC*0.08/1000.0                            0;...
    nCH3CCL2OH         DAQ.CO(starting_point).*ScaleFacVOC*0.08/1000.0                            0;...
    nME2BUT1ENE        DAQ.CO(starting_point).*ScaleFacVOC*0.07/1000.0                            0;...
    nEMPHCOME          DAQ.CO(starting_point).*ScaleFacVOC*0.07/1000.0                            0;...
    nMC6OTKETOH        DAQ.CO(starting_point).*ScaleFacVOC*(0.07+0.03)/1000.0                     0;...
    nIBUTOL            DAQ.CO(starting_point).*ScaleFacVOC*0.06/1000.0                            0;...
    nMIPK              DAQ.CO(starting_point).*ScaleFacVOC*0.06/1000.0                            0;...
    nC108NO3           DAQ.CO(starting_point).*ScaleFacVOC*0.06/1000.0                            0;...
    nCL12PRCHO         DAQ.CO(starting_point).*ScaleFacVOC*0.06/1000.0                            0;...
    nC129CO            DAQ.CO(starting_point).*ScaleFacVOC*(0.06+0.02)/1000.0                     0;...
    nALLYLOH           DAQ.CO(starting_point).*ScaleFacVOC*0.05/1000.0                            0;...
    nPINAL             DAQ.CO(starting_point).*ScaleFacVOC*0.05/1000.0                            0;...
    nHM33C4OH          DAQ.CO(starting_point).*ScaleFacVOC*0.05/1000.0                            0;...
    nNC1313OH          DAQ.CO(starting_point).*ScaleFacVOC*0.05/1000.0                            0;...
    nTBUACET           DAQ.CO(starting_point).*ScaleFacVOC*0.04/1000.0                            0;...
    nC828PAN           DAQ.CO(starting_point).*ScaleFacVOC*0.04/1000.0                            0;...
    nCYHXONAOOH        DAQ.CO(starting_point).*ScaleFacVOC*0.04/1000.0                            0;...
    nACECOCOCH3        DAQ.CO(starting_point).*ScaleFacVOC*0.03/1000.0                            0;...
    nC5PAN6            DAQ.CO(starting_point).*ScaleFacVOC*0.03/1000.0                            0;...
    nACCOPRONE         DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nM3PEAOH           DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nH25M2C6           DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nNC71CO            DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nH2M3C4CHO         DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nMEPROPENE         DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nM2PEDOH           DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nC6CO2OHPAN        DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nDDEC3ONE          DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nHO36C10           DAQ.CO(starting_point).*ScaleFacVOC*0.01/1000.0                            0;...
    nC126CHO           DAQ.CO(starting_point).*ScaleFacVOC*0.01/1000.0                            0;...
    nEOX2COMEOH        DAQ.CO(starting_point).*ScaleFacVOC*0.01/1000.0                            0;...
    nC920PAN           DAQ.CO(starting_point).*ScaleFacVOC*0.01/1000.0                            0;...
    nPXYCATECH         DAQ.CO(starting_point).*ScaleFacVOC*0.01/1000.0                            0;...
    nBCKET             DAQ.CO(starting_point).*ScaleFacVOC*0.01/1000.0                            0;...
    nNPRACBOOH         DAQ.CO(starting_point).*ScaleFacVOC*0.01/1000.0                            0;...
    nTHEX2ENE          DAQ.CO(starting_point).*ScaleFacVOC*0.01/1000.0                            0;...
    nMALDALCO3H        DAQ.CO(starting_point).*ScaleFacVOC*0.01/1000.0                            0;...
    nPROPACID          DAQ.CO(starting_point).*ScaleFacVOC*0.02/1000.0                            0;...
    nETHOXOOH          DAQ.CO(starting_point).*ScaleFacVOC*0.004/1000.0                           0;...
    nIPECOH            DAQ.CO(starting_point).*ScaleFacVOC*0.001/1000.0                           0;...
    };
disp('done, provide initial data')
% -

%%%%%%%%%%%%%%%%%
% chemistry
%%%%%%%%%%%%%%%%%
chemistry_provider;
disp('done, provide chemistry mechanism')

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % DILUTION CONCENTRATIONS
% Background concentrations are taken from observations just outside the plume.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

BkgdConc = {...
%   names               values
    'DEFAULT'           0         ;... %0 for all zeros, 1 to use InitConc
    'CO'                95        ;...
    'NO'                0.031     ;...
    'NO2'               0.112     ;...
    nHONO              0         ;... %HONO
    'O3'                35.4      ;...
    'OH'                0         ;... %OH = 2.75 e6 cm-3
    'CH4'               1897      ;...
    nC2H4               0         ;...
    nC3H6               0.084     ;... %propene
    nPRPE               0.084     ;... %propene

    nHCHO              1.345     ;... %Formaldehyde
    nALD2              0.389     ;... %acetaldehyde
    %nC2H5CHO           0         ;... %propanal
    %nRCHO              0         ;... %propanal
    nC2H5CHO           1.491.*0.5    ;... %acetone, Lixu, correcting the background values
    nRCHO              1.491.*0.5    ;... %acetone, Lixu, correcting the background values

    
    nBENZ              0.008     ;... %benzene
    'HCOOH'            0         ;... %formic acid
    nACTA              0.073     ;... %acetic acid
    nISOP              0.219     ;... %isoprene
    'MACR'             0.183.*0.5;... %MACR
    'MVK'              0.183.*0.5;... %MVK
    nMOH               1.937     ;... %Methanol
    %nACET              1.491     ;... %acetone
    nACET              1.491.*0.5    ;... %acetone, Lixu, correcting the background values
    nFURAN             0         ;... %furan; only decay!
    nM2FURAN           0         ;... 
    nDIMEFURAN         0         ;... 
    nFURFURAL          0         ;... %2-furfural; only decay!
    nMEFURFURAL        0         ;...
    nMGLY              0         ;... %methylglyoxal
    nHAC               0         ;... %hydroxyacetone
    nMALANHY           0         ;... %Maleic Anhydride
    nBZFUONE           0         ;... %Furanone
    nBIACET            0         ;... %2,3 butanedione
    nPHEN              0         ;... %Phenol
    nCATECHOL          0         ;... %Catechol
    nCSL               0         ;...
    nSTYRENE           0         ;... %Styrene
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
ModelOptions.Verbose = 1;                       %flag for verbose output
ModelOptions.EndPointsOnly = 0;                 %flag for concentration and rate outputs, Lixu, test, change 0 to 1
ModelOptions.LinkSteps = 1;                     %flag for using end-points of one run to initialize next run
ModelOptions.IntTime = 244.75466666666668;      %integration time for each step, seconds, Lixu, calculated by time rahter than time_ext
prefix = ''; %dummy for plotting
ModelOptions.SavePath = ['./output_data/FIREX_LGPlume_', MECHANISM,'P3B'];
disp('done, provide model options.')

% + magic_args="MODEL RUN"
% Now we call the model.
% Output will be saved in the "SavePath" above and will also be written to the structure S.
% Let's also throw away the inputs (don't worry, they are saved in the output structure).
S = F0AM_ModelCore(Met,InitConc,ChemFiles,BkgdConc,ModelOptions);
clear Met InitConc ChemFiles BkgdConc ModelOptions
disp('done, finish the run of the model.')
% -

% ===================================
% Get dilution corrected mixing ratio
% ===================================
% calculate normalized excess mixing ratios: delta_X_dil = delta_X * delta_CO_source/delta_CO
% this is standard procedure for biomass burning plumes.
% We will also put these into a new structure compatible with F0AM plotting routines.
delta_CO = S.Conc.CO - S.BkgdConc.CO(1);
fCO = delta_CO(1)./delta_CO;
Sd.Met = S.Met; Sd.Cnames = S.Cnames; Sd.Time = S.Time;
for i=1:length(S.Cnames)
    name = S.Cnames{i};
    if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
    else b = 0;
    end
    Sd.Conc.(name) = (S.Conc.(name) - b).*fCO;
end

fileoutput = ['./output_data/FIREX_LGPlume_dilution_corrected', MECHANISM, 'P3B'];
save(fileoutput,'Sd')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting and data analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set some needed variables for plotting
% Time
obs_time = DAQ.TIME-DAQ.TIME(starting_point); % aging corrected
mod_time = S.Time;

smk_CO = DAQ.CO;
smk_O3 = DAQ.O3;

%plotting_comp;
disp('done, finish the figure plotting.')
%disp(Sd.Conc.(nFURAN)(1));
%disp(Sd.Conc.FURAN(1));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Checking init. NOx
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% disp('This is init NOx conc!')
% disp(DAQ.NO(1) + DAQ.NO2(1));
% disp(DAQ.CO(1));
