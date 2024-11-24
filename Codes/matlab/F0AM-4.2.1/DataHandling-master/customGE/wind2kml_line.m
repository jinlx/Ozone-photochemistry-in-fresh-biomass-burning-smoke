function windStr = wind2kml_line(lon,lat,wdir,wspd,scale,KMLpath)
% function windStr = wind2kml(lon,lat,wdir,wspd,KMLpath)
% Generates kml file for wind speed/direction in google earth.
% Unilike the wind_barbs version, this just makes wind lines.
% Three types of lines are made:
% 1) white lines with length scaled by wind speed
% 2) constant-length lines colored by wind speed
% 3) white constant-length lines that just show wind direction.
% Line orientation denotes the direction in which the wind is coming from (if one were looking from
% the input lon and lat).
% If winds need to be averaged first, use BinPolar.
%
% INPUTS:
% lon: longitude, degrees
% lat: latitude, degrees
% alt: altitude above sea level, m
% wdir: wind direction, degrees
% wspd: wind speed, m/s or other units
% scale: scaling factor for line lengths. default is 1.
% KMLpath: full path for saving kml file. Optional.
%
% OUTPUT, windStr, is a kml string all wind barbs in a folder "Wind Barbs". It can be combined with
% other KML strings and written to kml using ge_output.
%
% 20130718 GMW
% 20130809 GMW  Added third output for constant-sized, constant colored lines (direction only).

%default line scaling
if ~exist('scale','var')
    scale = 1;
end
scaleLine = scale*2e-2;
scaleColor = scale*1e-1;

%convert data
[u,v] = pol2cart(wdir*pi/180,wspd); %convert to cartesian
[u1,v1] = pol2cart(wdir*pi/180,ones(size(wdir))); %convert to cartesian with unit magnitude
C = data2hexcolor(wspd,1,'jet'); %generate colormap from wind speed

%calculate end-point of each line
lon2 = lon + v*scaleLine;
lat2 = lat + u*scaleLine;
lonLine = [lon lon2]'; %start and stop points
latLine = [lat lat2]';
lon2 = lon + v1*scaleColor;
lat2 = lat + u1*scaleColor;
lonColor = [lon lon2]';
latColor = [lat lat2]';

%generate kml strings
npts = length(lon);
lineStr     = cell(1,npts); %lines sized by windspeed
colorStr    = cell(1,npts); %lines colored by windspeed
dirStr      = cell(1,npts); %directional lines only (no windspeed info)
for i=1:npts
    lineStr{i} = ge_plot(lonLine(:,i),latLine(:,i),...
        'lineWidth',3,...
        'lineColor','FFFFFFFF',...
        'visibility',0);
    
    colorStr{i} = ge_plot(lonColor(:,i),latColor(:,i),...
        'lineWidth',3,...
        'lineColor',C(i,:),...
        'visibility',0);
    
    dirStr{i} = ge_plot(lonColor(:,i),latColor(:,i),...
        'lineWidth',3,...
        'lineColor','FFFFFFFF',...
        'visibility',0);
end
lineStr  = cell2mat(lineStr);
colorStr = cell2mat(colorStr);
dirStr   = cell2mat(dirStr);

%legend for colored lines
start = find(~isnan(lon+lat+wspd+wdir),1,'first'); %position of legend
legStr = ge_colorbar(lon(start),lat(start),wspd(~isnan(wspd)),...
    'cBarFormatStr','%1.1g',...
    'name','Wind Speed',...
    'visibility',0,...
    'colorMap','jet');
colorStr = [ge_folder('Data',colorStr),ge_folder('Legend',legStr)];

%concatenate and save
windStr = [ge_folder('Wind (Sized)',lineStr), ge_folder('Winds (Colored)',colorStr), ge_folder('Winds (DirOnly)',dirStr)];

if exist('KMLpath','var')
    ge_output(KMLpath,windStr);
end


