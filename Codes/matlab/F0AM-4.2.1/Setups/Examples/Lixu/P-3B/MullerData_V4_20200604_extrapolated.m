% ExampleSetup_LagrangianPlume.m
% This example shows a model setup for simulation of an evolving fire plume.
% Model setup is the same as that described in Mu(:)ller et al., ACP (2016).
% Thanks to Markus Mu(:)ller for providing the model setup and data.
% Read comments in each section for a guided tour.
%
% 20160701 GMW

clear

%% DATA
load LagrangianPlumeData_Extrapolated.mat
% this structure "DAQ" contains data from an agricultural fire observed from the NASA P3 
% during the DISCOVER-AQ flight on 29 Sept 2013.
% Data are averaged into 1km bins (distance from the source).
% DAQ.TIME is a lagrangian time calculated from observed wind speed and downwind sample distance.


%% METEOROLOGY
%{
Pressure, temperature, and either RH or H2O are required Met inputs.
Dilution is calculated using the change in CO over each model step.
All calculated J-values will be scaled to J4.
%}


%kdil calculation using CO decay
dCOdt        = diff(DAQ.CO_EXT)./diff(DAQ.TIME_EXT); %loss rate
dCOdt(end+1) = dCOdt(end);
COmid        = (DAQ.CO_EXT + [DAQ.CO_EXT(2:end);DAQ.CO_EXT(end)])/2; %CO in middle of step
kdil         = -dCOdt./(COmid-95);

ScaleFac = 0;

PhotoScale = 1;
jcorr = DAQ.jcorr.*PhotoScale;
jNO2 = DAQ.JNO2.*PhotoScale;

Met = {...
    'P'             DAQ.P;... %Pressure, mbar
    'T'             DAQ.T;...    %Temperature, K
    'RH'            DAQ.RH;...    %Relative Humidity, percent    
    'kdil'          kdil;...    %dilution, /s
    'SZA'           DAQ.SZA;... %solar zenith angle
    'J4'            jNO2;... %NO2 photolysis frequency
    'jcorr'         jcorr;... %correction factor. Muller did not use this.
    };

clear dCOdt COmid kdil

%% CHEMICAL CONCENTRATIONS
%{
The first observational point is used as initial inputs. 
All concentrations will be calculated "free running," meaning no constraints along the transect.
%}
InitConc = {...
%   names               conc(ppb)               HoldMe    
    'CH4'               DAQ.CH4(1)                    0;...
    'NO'                DAQ.NO(1)                     0;...
    'NO2'               DAQ.NO2(1)                    0;...
    'OH'                3e-4                          0;... %OH = 7.5 e6 cm-3 (guess)
    'O3'                DAQ.O3(1)                     0;...
    'CO'                DAQ.CO(1)                     0;...
    'HCHO'              DAQ.HCHO(1)                   0;... %Formaldehyde
    'HONO'              DAQ.HONO(1)                   0;... %HONO
    'CH3OH'             DAQ.CH3OH(1)                  0;... %Methanol
    'CH3CHO'            DAQ.CH3CHO(1)                 0;... %acetaldehyde
    'C3H6'              DAQ.C3H6(1)                   0;... %propene
    'BENZENE'           DAQ.BENZENE(1)                0;... %benzene
    'FURAN'             DAQ.FURAN(1)                  0;... %furan; only decay!
    'C5H8'              DAQ.C5H8(1)                   0;... %isoprene
    'CH3COCH3'          DAQ.CH3COCH3(1) .*0.5         0;... %acetone
    'C2H5CHO'           DAQ.CH3COCH3(1) .*0.5         0;... %propanal
    'HCOOH'             DAQ.HCOOH(1)                  0;... %formic acid%
    'CH3CO2H'           DAQ.CH3CO2H(1)./0.66          0;... %acetic acid, inlet factor 0.66% 
    'BIACET'            DAQ.BIACET(1)                 0;... %2,3 butanedione
    'MVK'               DAQ.MVK(1) .*0.5              0;... %MVK
    'MACR'              DAQ.MVK(1).*0.5               0;... %MACR
    'MGLYOX'            DAQ.MGLYOX(1)                 0;... %methylglyoxal
    'FURFURAL2'         DAQ.FURFURAL(1)               0;... %2-furfural; only decay!
    'ACETOL'            DAQ.ACETOL(1)                 0;... %hydroxyacetone
    'M2F'               DAQ.MEFURAN(1)                0;... %Methyl Furan
    'DIM25FURAN'        DAQ.MEFURAN(1).*0.5           0;... %Dimethyl Furan (assume 0.5 of methyl furan, based on primary emissions from FIRELAB), naming!!
    'MFURFURAL'         DAQ.CATECHOL(1).*(2.75*0.5)   0;... %Methyl furfural (adjust for starting val), naming!!
    'MALANHY'           DAQ.MALANHY(1)                0;... %Maleic Anhydride
    'BZFUONE'           DAQ.FURANONE(1)               0;... %Furanone
    'CATECHOL'          DAQ.CATECHOL(1).*(2.75*0.5)   0;... %Catechol (adjust for starting val)
    'PHENOL'            DAQ.PHENOL(1)*1.05            0;... %Phenol (adjust for starting val)
    'STYRENE'           DAQ.STYRENE(1)                0;... %Styrene
    'CRESOL'            DAQ.CRESOL(1).*1.5            0;... %Cresol (adjust for starting val) 
    'C2H4'              DAQ.C3H6(1)                   0;... %Ethene (assume same as propene)
    };

%% CHEMISTRY
%{
The ChemFiles input is a cell array of strings specifying functions and scripts for the chemical mechanism.
THE FIRST CELL is always a function for generic K-values.
THE SECOND CELL is always a function for J-values (photolysis frequencies).
All other inputs are scripts for mechanisms and sub-mechanisms.
Here we give an example using MCMv3.3.1.  Note that this mechanism was extracted from the MCM website for
the specific set of initial species included above.
"FURFURAL_FURAN" is a very simple set of reactions for initial oxidation of these species,
which are not included in MCM. For extra fun, try toggling this on and off to compare results.
%}

ChemFiles = {...
    'MCMv331_K(Met)';
    'MCMv331_J(Met,2)'; %Jmethod flag of 0 specifies "MCM" J-value method.
    'MCMv331_NOAABB_V3_20200604';
    };

%% DILUTION CONCENTRATIONS
% Background concentrations are taken from observations just outside the plume.

BkgdConc = {...
%   names               values
    'DEFAULT'           0         ;... %0 for all zeros, 1 to use InitConc
    'CH4'               1897      ;...
    'NO'                0.031     ;...
    'NO2'               0.112     ;...
    'OH'                0         ;... %OH = 2.75 e6 cm-3
    'O3'                35.4      ;...
    'CO'                95        ;...
    'HCHO'              1.345     ;... %Formaldehyde
    'HONO'              0         ;... %HONO
    'CH3OH'             1.937     ;... %Methanol
    'CH3CHO'            0.389     ;... %acetaldehyde
    'C3H6'              0.084     ;... %propene
    'BENZENE'           0.008     ;... %benzene
    'FURAN'             0         ;... %furan; only decay!
    'C5H8'              0.219     ;... %isoprene
    'CH3COCH3'          1.491     ;... %acetone
    'C2H5CHO'           0         ;... %propanal
    'HCOOH'             0         ;... %formic acid
    'CH3CO2H'           0.073     ;... %acetic acid
    'BIACET'            0         ;... %2,3 butanedione
    'MVK'               0.183.*0.5;... %MVK
    'MACR'              0.183.*0.5;... %MACR
    'MGLYOX'            0         ;... %methylglyoxal
    'FURFURAL2'         0         ;... %2-furfural; only decay!
    'ACETOL'            0         ;... %hydroxyacetone
    'MALANHY'           0         ;... %Maleic Anhydride
    'BZFUONE'           0         ;... %Furanone
    'CATECHOL'          0         ;... %Catechol
    'PHENOL'            0         ;... %Phenol
    'STYRENE'           0         ;... %Styrene
    'CRESOL'            0         ;... %CRESOL
    };

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
ModelOptions.Repeat = 1;          %number of times to loop through all constraints
ModelOptions.IntTime = 250;       %integration time for each step, seconds
ModelOptions.SavePath = 'LGPlumeResults';

%% MODEL RUN
% Now we call the model.
% Output will be saved in the "SavePath" above and will also be written to the structure S.
% Let's also throw away the inputs (don't worry, they are saved in the output structure).


S = F0AM_ModelCore(Met,InitConc,ChemFiles,BkgdConc,ModelOptions);
clear Met InitConc ChemFiles BkgdConc ModelOptions


%ModelConc_Summed = SumSpecies(S);

%% FIGURES AND ANALYSIS

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


ModelConc_Summed = SumSpecies(Sd);

% First, check that dilution is working as it should
PlotConc('CO',S);
hold on
plot(DAQ.TIME_EXT,DAQ.CO_EXT,'k+','markersize',18,'linewidth',4)

% Now let's look at NOy speciation
% first we have to get all NOy, which is a tall order for MCM, but we can try by using 
% SMILES strings to identify functional groups.

PNs = SearchSMILES('peroxyNitrate',S.Cnames,'v331'); %peroxy nitrates
ANs = SearchSMILES('alkylNitrate',S.Cnames,'v331'); %alkyl nitrates
otherNOy = {'NO';'NO2';'NO3';'N2O5';'HONO';'HNO3';'HO2NO2'};
[~,iother] = ismember(otherNOy,S.Cnames);
iNOy = unique([iother; PNs.index; ANs.index]);

NOygroups = {{'NOx','NO','NO2'},['PNs';S.Cnames(PNs.index)],['ANs';S.Cnames(ANs.index)],'HONO','HNO3'};
PlotConcGroup(NOygroups,Sd,5,'sortem',0,'name','NO_y')

% Next, lets look at ozone production.
figure
plot(Sd.Time,Sd.Conc.O3,'b-',...
    DAQ.TIME,(DAQ.O3-35.4).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}O_3 (ppb)')
legend('Model','Obs')
    
figure
plot(Sd.Time,Sd.Conc.FURFURAL,'b-',...
    DAQ.TIME,(DAQ.FURFURAL).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}FURFURAL1111111111111111 (ppb)')
legend('Model','Obs')

figure
plot(Sd.Time,Sd.Conc.FURAN,'b-',...
    DAQ.TIME,(DAQ.FURAN).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Furan (ppb)')
legend('Model','Obs')

figure
plot(Sd.Time,Sd.Conc.MALANHY,'b-','LineWidth',2)
hold on
plot(DAQ.TIME,(DAQ.MALANHY).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Maleic Anhydride (ppb)')
legend('Model','Obs')
hold off

figure
plot(Sd.Time,Sd.Conc.M2F,'b-',...
    DAQ.TIME,(DAQ.MEFURAN).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Methyl Furan (ppb)')
legend('Model','Obs')

figure
plot(Sd.Time,Sd.Conc.HCHO,'b-',...
    DAQ.TIME,(DAQ.HCHO-1.345).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}HCHO (ppb)')
legend('Model','Obs')

figure
plot(Sd.Time,ModelConc_Summed.C2H4O2H,'b-',...
    DAQ.TIME,(DAQ.CH3CO2H-0.073).*(DAQ.CO(1)-95)./(DAQ.CO-95)./0.66,'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Acetic Acid + Glycolaldehyde (ppb)')
legend('Model','Obs')


% Figure for C4H4O3, MALDALCO2H
figure
plot(Sd.Time,Sd.Conc.MALDALCO2H,'b-','LineWidth',2)
hold on
plot(DAQ.TIME,(DAQ.C4H4O3).*(DAQ.CO(1)-95)./(DAQ.CO-95),'bo')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}C4H4O3 (ppb)')
legend('Model (A)','Obs')
hold off

% Figure for MVK + MACR
figure
plot(Sd.Time,ModelConc_Summed.C4H6OH,'b-',...
    DAQ.TIME,(DAQ.MVK-0.183).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}MVK + MACR (ppb)')
legend('Model')

figure
plot(Sd.Time,ModelConc_Summed.C3H4O2H,'b-',...
    DAQ.TIME,(DAQ.MGLYOX).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Methyl Glyoxal (ppb)')
legend('Model','Obs')

% Furanone + Maldial
figure
plot(Sd.Time,ModelConc_Summed.C4H4O2H,'-b','LineWidth',2)
hold on
plot(Sd.Time,Sd.Conc.MALDIAL,'--g','LineWidth',2)
plot(Sd.Time,Sd.Conc.BZFUONE,'--c','LineWidth',2)
plot(DAQ.TIME,(DAQ.FURANONE).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Furanone (ppb)')
legend('Model,summed','MALDIAL','Furanone','Obs')
hold off

% Figure for Acetone + Propanal
figure
plot(Sd.Time,ModelConc_Summed.C3H6OH,'b-','LineWidth',2)
hold on
plot(Sd.Time,Sd.Conc.CH3COCH3,'--g','LineWidth',2)
plot(Sd.Time,Sd.Conc.C2H5CHO,'--c','LineWidth',2)
plot(DAQ.TIME,(DAQ.CH3COCH3-1.491).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Acetone + Propanal (ppb)')
legend('Model','Obs')

% Figure for Phenol
figure
plot(Sd.Time,ModelConc_Summed.C6H6OH,'b-','LineWidth',2)
hold on
plot(DAQ.TIME,(DAQ.PHENOL).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro','MarkerFaceColor',[0 0 0],'MarkerSize',10)
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Phenol (ppb)')
legend('Model','Obs')
ax.FontSize = 20;
hold off


% Figure for CRESOL
figure
plot(Sd.Time,ModelConc_Summed.C7H8OH,'b-','LineWidth',2)
hold on
plot(DAQ.TIME,(DAQ.CRESOL).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Cresol (ppb)')
legend('Model','Obs')
hold off

figure
plot(Sd.Time,Sd.Conc.HCOOH,'b-','LineWidth',2)
hold on
plot(DAQ.TIME,(DAQ.HCOOH).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}HCOOH (ppb)')
legend('Model','Obs')
hold off

% Figure for Styrene
figure
plot(Sd.Time,ModelConc_Summed.C8H8H,'b-','LineWidth',2)
hold on
plot(DAQ.TIME,(DAQ.STYRENE).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Styrene (ppb)')
legend('Model','Obs')
hold off


% Figure for Catechol/Methyl Furfural
figure
plot(Sd.Time,ModelConc_Summed.C6H6O2H,'b-','LineWidth',2)
hold on
plot(Sd.Time,Sd.Conc.CATECHOL,'g-','LineWidth',2)
plot(Sd.Time,Sd.Conc.MEFURFURAL,'c--','LineWidth',2)
plot(Sd.Time,Sd.Conc.NCATECHOL,'r--','LineWidth',2)
plot(DAQ.TIME,(DAQ.CATECHOL).*(DAQ.CO(1)-95)./(DAQ.CO-95),'ro')
xlabel('Reaction Time (s)')
ylabel('\Delta_{dil}Catechol + Methyl Furfural (ppb)')
legend('Model Summed','Catechol','Methyl Furfural','Nitrocatechol','Obs')
hold off

Phenol = Sd.Conc.PHENOL;
Ozone = Sd.Conc.O3;
MaleicAnhydride = Sd.Conc.MALANHY;
Mefuran = Sd.Conc.MEFURAN;
Furfural = Sd.Conc.FURFURAL;
Furan = Sd.Conc.FURAN;
Cresol = Sd.Conc.CRESOL;
MeFurfural_Catechol = ModelConc_Summed.C6H6O2H;
MaldalCO2H = Sd.Conc.MALDALCO2H;



% % It is easiest to look at production of ozone's precursor, NO2.
% % Also, since dilution is so strong, we will look at this in a rate-normalized sense
% % because we are just interested in speciation.
% PlotRates('NO2',S,5,'sumEq',1,'scale',0)
% 
% % it looks like HO2 is the dominant source. Let's keep going.
% % Note that FURFURAL, which is not in the MCM base chemistry, is a non-trivial source of HO2.
% PlotRates('HO2',S,5,'sumEq',1,'scale',0)
% 
% % It looks like speciation doesn't change much over the integration period, so we can continue
% % investigation in an average sense.
% % CO and HCHO are signficant sources of HO2. Most of the CO is primary emissions, and so is HCHO
% % (intitally). What about secondary HCHO?
% PlotRatesAvg('HCHO',S,5)
% PlotRatesAvg('CH3O2',S,5,'sumEq',1)
% PlotRatesAvg('CH3CO3',S,5,'sumEq',1)
% % Secondary formaldehyde is mostly from acetaldehyde. Note this will changes as the plume ages more.
% 
