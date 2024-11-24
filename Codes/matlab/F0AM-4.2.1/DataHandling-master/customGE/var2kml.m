function kmlStr = var2kml(lon,lat,alt,Data,time,KMLpath,colorSaturation)
% function var2kml(lon,lat,alt,Data,time,KMLpath,colorSaturation)
% generates kml files from data for visualization in google earth.
% INPUTS:
% lon: longitude, degrees
% lat: latitude, degrees
% alt: altitude above sea level, m
% Data: structure containing variables to plot.
% time: time stamp for Data, seconds.
% KMLpath: full path for saving KML file. Optional; default is empty.
% colorSaturation: 1x2 vector specifying percentile limits for the colorbars. For example, setting
%                   this to [5 95] will force the colorbar to saturate at values corresponding to the 
%                   5th and 95th percentiles of the data.
%                   This is optional, but useful for dealing with extreme values. Default is [0 100].
% 
% OUTPUT kmlStr is the full kml string. It can be combined with
% other KML strings (by using ge_folder or concatenating) and written to kml using ge_output.
%
% 20130604 GMW
% 20130607 GMW  Changed plotting from line to scatter
% 20130610 GMW  Added code to skip variables that are all NaNs or constant
% 20130615 GMW  Added code for time markers and flight/ground tracks
% 20130718 GMW  Removed averaging code. This should be done before calling.
%               Also added kml string output and removed GEOpen input.
% 20130809 GMW  Added optional input to force color bar to saturate at specified data percentiles.
% 20150823 GMW  Added Hourly time marker and fixed some issues with time markers w/ multiple days.

%set defaults
if ~isstruct(Data)
    Data.(inputname(4)) = Data; %make structure if only one variable
end

if ~exist('KMLpath','var')
    KMLpath = [];
end

if ~exist('colorSaturation','var')
    colorSaturation = [];
end

%%%%%TIME MARKERS%%%%%
disp('Writing variable KML...')
disp('  Time Markers')

%1 minute
tInt = 60; %assumes time stamp in seconds
tbase = floor(time./tInt);
d = diff(tbase); d(isnan(d))=0;
iAvg = logical([0;d]);
tAvg = time(iAvg);

xt = lon(iAvg);
yt = lat(iAvg);
zt = alt(iAvg);
tDispStr = datestr(tAvg./86400,'HH:MM');
L = length(xt); %number of points

timeStrFast = cell(1,L);
for i=1:L
    timeStrFast{i} = ge_point(xt(i),yt(i),zt(i),...
        'iconURL','http://maps.google.com/mapfiles/kml/shapes/arrow.png',...
        'altitudeMode','absolute',...
        'iconColor','FFFF0000',...
        'iconScale',0.2,...
        'snippet',tDispStr(i,:),...
        'extrude',1,...
        'visibility',0);
end
timeStrFast = cell2mat(timeStrFast);

%10 minutes
tInt = 600;
tbase = floor(time./tInt);
d = diff(tbase); d(isnan(d))=0;
iAvg = logical([0;d]);
tAvg = time(iAvg);

xt = lon(iAvg);
yt = lat(iAvg);
zt = alt(iAvg);
tDispStr = datestr(tAvg/86400,'HH:MM');
L = length(xt); %number of points

timeStrSlow = cell(1,L);
for i=1:L
    timeStrSlow{i} = ge_point(xt(i),yt(i),zt(i),...
        'iconURL','http://maps.google.com/mapfiles/kml/shapes/arrow.png',...
        'altitudeMode','absolute',...
        'iconScale',0.5,...
        'name',tDispStr(i,:),...
        'extrude',1,...
        'visibility',0);
end
timeStrSlow = cell2mat(timeStrSlow);

%30 minute
tInt = 1800;
tbase = floor(time./tInt);
d = diff(tbase); d(isnan(d))=0;
iAvg = logical([0;d]);
tAvg = time(iAvg);

xt = lon(iAvg);
yt = lat(iAvg);
zt = alt(iAvg);
tDispStr = datestr(tAvg/86400,'HH:MM');
L = length(xt); %number of points

timeStrHr = cell(1,L);
for i=1:L
    timeStrHr{i} = ge_point(xt(i),yt(i),zt(i),...
        'iconURL','http://maps.google.com/mapfiles/kml/shapes/arrow.png',...
        'altitudeMode','absolute',...
        'iconScale',0.5,...
        'name',tDispStr(i,:),...
        'extrude',1,...
        'visibility',0);
end
timeStrHr = cell2mat(timeStrHr);

timeStr = [ge_folder('hourly',timeStrHr),ge_folder('10 minutes',timeStrSlow),ge_folder('1 minute',timeStrFast)];

%%%%% GROUND AND AIR TRACES %%%%%
disp('  Ground and Air Tracks')

gndStr = ge_plot(lon,lat,...
    'lineWidth',1,...
    'lineColor','FF00FFFF',...
    'visibility',0);

flightStr = ge_plot3(lon,lat,alt,...
    'lineWidth',3,...
    'lineColor','FFFFFFFF',...
    'visibility',0);

%%%%% VARIABLES %%%%%
Dnames = fieldnames(Data);
VarStr = cell(1,length(Dnames));
for i=1:length(Dnames)
    disp(['  ' Dnames{i}])
    d = Data.(Dnames{i});
    dnonan = d(~isnan(d));
    
    if isempty(dnonan) || all(diff(dnonan)==0), continue; end %skip crap data
    
    %color saturation
    if ~isempty(colorSaturation)
        dlim = percentile(d,colorSaturation); %calculate limits
        d(d<dlim(1)) = dlim(1);
        d(d>dlim(2)) = dlim(2);
    end 
    
    kmlStr = ge_scatter3(lon,lat,alt,...
        'iconColor',d,...
        'iconScale',1,...
        'altitudeMode','absolute',...
        'visibility',0);
    
    %     kmlStr = ge_line3(lon,lat,alt,... %alternative plotting method
    %         'lineColor', d,...
    %         'lineWidth',10,...
    %         'altitudeMode','absolute',...
    %         'visibility',0);
    
    start = find(~isnan(lon+lat+alt+d),1,'first'); %position of legend
    legStr = ge_colorbar(lon(start),lat(start),d(~isnan(d)),...
        'cBarFormatStr','%1.2g',...
        'name',Dnames{i},...
        'visibility',0);
    VarStr{i} = ge_folder([Dnames{i}],[ge_folder('Data',kmlStr),ge_folder('Legend',legStr)]);
end
bad = cellfun('isempty',VarStr);
VarStr(bad) = [];
VarStr = cell2mat(VarStr);

%%%%%GENERATE KML STRING AND SAVE%%%%%
kmlStr = [ge_folder('Time',timeStr),...
    ge_folder('Ground Track',gndStr),...
    ge_folder('Flight Path',flightStr),...
    ge_folder('Data',VarStr)];
    
if ~isempty(KMLpath)
    ge_output(KMLpath,kmlStr);
end


