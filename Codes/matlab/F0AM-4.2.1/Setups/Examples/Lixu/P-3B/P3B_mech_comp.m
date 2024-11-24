% ExampleSetup_MechCompare.m
% Executes all mechanism options in the "ExampleSetup_FlightSS" example
% and makes some plots for comparison.
% 20160321 GMW
% for each MCM simulation, it takes 1.5 min to get one done; for GC simualtion , it takes 5 sec to get it done
clear
%allmech = {'GCv13_base','GCv13_JINF','GCv13_JINF_HCOOH','MCMv331_base','MCMv331_GCvocs','MCMv331_GCvocsF'};
%allmech = {'GCv13_base','GCv13_base_notfixed', 'GCv13_JINF','GCv13_JINF_HCOOH','MCMv331_base'};
%allmech = {'GCv13_base','GCv13_base_notfixed', 'GCv13_JINF','GCv13_JINF_HCOOH','MCMv331_base', 'MCMv331_noFUR'};
%allmech = {'GCv13_base','GCv13_base_notfixed', 'GCv13_JINF','GCv13_JINF_HCOOH','MCMv331_base', 'MCMv331_noFUR','MCMv331_GCvocs','MCMv331_GCvocsF'};
%allmech = {'GCv13_base','GCv13_base_notfixed'};
%allmech = {'MCMv331_base','MCMv331_noFUR', 'GCv13_base', 'GCv13_JINF'};
%allmech = {'GCv13_base_notfixed'};
%allmech = {'GCv13_base'};
%allmech = {'GCv13_JINF'};
%allmech = {'MCMv331_noFUR'};
%allmech = {'MCMv331_base'};
%allmech = {'MCMv331_extension'}
%allmech = {'MCMv331_GCvocsF'};
%allmech = {'MCMv331_GCvocs'};
allmech = {'GCv13_base','GCv13_JINF', 'MCMv331_noFUR','MCMv331_base','MCMv331_extension', 'MCMv331_GCvocs'};
allmech = {'MCMv331_base'};
%allmech = {'GCv13_base', 'MCMv331_base','MCMv331_GCvocs', 'MCMv331_extension'};
%allmech = {'GCv13_base', 'MCMv331_GCvocs', 'MCMv331_base'};
allmech = {'GCv13_base', 'GCv13_JINF', 'MCMv331_GCvocsF'};
allmech = {'GCv13_base'};
%allmech = {'GCv13_JINF'};
%allmech = {'MCMv331_GCvocsF'};
Flights = {'P3B'};

Sall = cell(size(allmech));
makeplots = 0; %for FlightSS script

for f = 1:length(Flights)
    Flight_ID = Flights{f};
    for a = 1:length(allmech)
        MECHANISM = allmech{a};
        P3B_MASTER_vP4;
        %Sall{a} = S;
        disp('done, processing the simulation data');
        Extract_compound;
        disp('done, saving out extracted data from S and Sd');
        clearvars -except allmech Flights Sall makeplots f Flight_ID        
    end
end
