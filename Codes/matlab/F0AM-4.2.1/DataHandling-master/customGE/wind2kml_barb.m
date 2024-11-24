function windStr = wind2kml_barb(lon,lat,alt,wdir,wspd,KMLdir,savename)
% function windStr = wind2kml_barb(lon,lat,alt,wdir,wspd,KMLdir,savename)
% Generates kml file for wind barbs in google earth.
% Note that the directory where files are stored  must contain the subfolder \windbarbs.
% This will be created the first time the script runs.
% If winds need to be averaged first, use BinPolar.
%
% INPUTS:
% lon: longitude, degrees
% lat: latitude, degrees
% alt: altitude above sea level, m
% wdir: wind direction, degrees
% wspd: wind speed, m/s or other units
% KMLdir: directory for KML file saving. Wind barbs folder will also be written here.
% savename: name of save file, including extension
%
% OUTPUT, windStr, is a kml string all wind barbs in a folder "Wind Barbs". It can be combined with
% other KML strings and written to kml using ge_output.
%
% 20130718 GMW

disp('Writing wind barb KML...')

%convert to cartesian
[u,v] = pol2cart(wdir*pi/180,wspd);

% generate folder for wind barbs
daeDir = fullfile(KMLdir,'windbarbs',filesep); %subdirectory for barb models
ge_barbdaes('daeDir',daeDir,...
                'barbColor','FFFFFF',... %white
                'barbAlpha',dec2hex(255,2)); %transparency

%generate kml string
rlink = ['windbarbs' filesep];
windStr = ge_windbarb(lon,lat,alt,-v,-u,...
    'altitudeMode','absolute',...
    'arrowScale',1e4,...
    'rLink',rlink);
windStr = ge_folder('Wind Barbs',windStr);

%save
if nargin==7
    ge_output(fullfile(KMLdir,savename),windStr);
end


