function hexcolor = data2hexcolor(C,opacity,cmap)
% function hexcolor = data2hexcolor(C,opacity,cmap)
% Maps a data vector to a color map and converts the colors to an 8-character hex string.
% Designed to be used with google earth toolbox.
%
% INPUTS:
% C: data vector to use for color
% opacity: optional scalar to determine opacity. 1 = opaque (default), 0 = transparent.
% cmap: optional color map specification. default is jet.
%
% OUTPUT:
% hexcolor is an 8-column hex character array with one row for each row of input C.
% colors are given as RRGGBBOO (red green blue opac)
%
% 20130718 GMW

%default is fully opaque
if nargin<2
    opacity = 1;
end

%get colormap
derp = figure; %dummy figure
if nargin<3
    cmap = colormap('jet');
else
    cmap = colormap(cmap);
end
close(derp)

%map data to colormap
clim = linspace(min(C),max(C),size(cmap,1)); %linearly-spaced vector for color limits
c = interp1(clim,cmap,C);
c(c<0) = 0; %deal with minor numerical issue
c = floor(c*255); %convert from [0 1] to [0 255]
cnans = find(isnan(sum(c,2)));
c(cnans,:) = 0;

%determine hex strings
r = dec2hex(c(:,1),2); %red
g = dec2hex(c(:,2),2); %green
b = dec2hex(c(:,3),2); %blue
a = round(255*ones(size(c,1),1)*opacity); %opacity
a(cnans) = 0; %make missing values transparent
a = dec2hex(a,2);

hexcolor = [a r g b]; %hex color strings

