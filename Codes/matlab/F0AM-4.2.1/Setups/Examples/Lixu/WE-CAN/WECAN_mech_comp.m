% ExampleSetup_MechCompare.m
% Executes all mechanism options in the "ExampleSetup_FlightSS" example
% and makes some plots for comparison.
% 20160321 GMW
% RF03: For each GC simulation, it takes less than 10 sec; For each MCM simulation, it takes ~3 min.
% RF07: For each GC simulation, it takes less than 10 sec; For each MCM simulation, it takes ~5 min.
% We need to note that MCM cannot be run with GEOS-Chem mechanism to avoid name confusions

clear

%allmech = {'GCv13_base','GCv13_JINF','GCv13_JINF_HCOOH','MCMv331_base','MCMv331_GCvocs','MCMv331_GCvocsF'};
%allmech = {'GCv13_base','GCv13_base_notfixed', 'GCv13_JINF','GCv13_JINF_HCOOH','MCMv331_base'};
%allmech = {'GCv13_base','GCv13_base_notfixed', 'GCv13_JINF','GCv13_JINF_HCOOH','MCMv331_base', 'MCMv331_noFUR'};
%allmech = {'GCv13_base','GCv13_base_notfixed', 'GCv13_JINF','GCv13_JINF_HCOOH','MCMv331_base', 'MCMv331_noFUR','MCMv331_GCvocs','MCMv331_GCvocsF'};

%allmech = {'GCv13_base_notfixed'};
%allmech = {'GCv13_base'};
%allmech = {'GCv13_JINF'};
%allmech = {'MCMv331_noFUR'};
%allmech = {'MCMv331_base'};
%allmech = {'MCMv331_exstension'}
%allmech = {'MCMv331_GCvocs'};
%allmech = {'MCMv331_GCvocsF'};
allmech = {'GCv13_base','GCv13_JINF', 'MCMv331_noFUR','MCMv331_base','MCMv331_extension', 'MCMv331_GCvocs'};
allmech = {'MCMv331_GCvocs'};
%allmech = {'MCMv331_base', 'MCMv331_GCvocs','MCMv331_extension'};
%allmech = {'GCv13_MCM_missing'};
%allmech = {'MCMv331_base'};
%allmech = {'GCv13_base'};
%allmech = {'GCv13_base', 'MCMv331_base','MCMv331_GCvocs', 'MCMv331_extension'};
%allmech = {'MCMv331_GCvocs'};
allmech = {'MCMv331_base'};
%allmech = {'MCMv331_extension'};
%allmech = { 'MCMv331_base', 'MCMv331_GCvocs'};
%allmech = { 'MCMv331_base', 'MCMv331_GCvocs'};
%allmech = {'MCMv331_GCvocs'};
%allmech = {'GCv13_base', 'MCMv331_base'};

%allmech = {'GCv13_base', 'GCv13_JINF', 'MCMv331_GCvocsF'};
allmech = {'GCv13_base', 'MCMv331_GCvocs', 'MCMv331_base'};
allmech = {'MCMv331_base'};
%allmech = {'GCv13_JINF'};
%allmech = {'GCv13_base', 'MCMv331_GCvocsF'};

Flights = {'RF07', 'RF09'};
Flights = {'RF03'};

Sall = cell(size(allmech));
makeplots = 0; %for FlightSS script

for f = 1:length(Flights)
    Flight_ID = Flights{f};
    for a = 1:length(allmech)
        MECHANISM = allmech{a};
        %WECAN_MASTER_value_Lixu_v3_dn_test;
        WECAN_MASTER_value_Lixu_v34;
        %Sall{a} = S;
        disp('done, processing the simulation data');
        Extract_compound;
        disp('done, saving out extracted data from S and Sd');
        clearvars -except allmech Flights Sall makeplots f Flight_ID        
    end
end

