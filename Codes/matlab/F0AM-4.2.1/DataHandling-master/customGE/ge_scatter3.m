function kmlStr = ge_scatter3(X,Y,Z,varargin)

%%%%%DEAL WITH OPTIONS%%%%%
altitudeMode = 'clampToGround';
iconColor = 'FFFFFFFF';
iconScale = 1.0;
iconURL = 'http://maps.google.com/mapfiles/kml/shapes/shaded_dot.png';
% iconURL = 'http://maps.google.com/mapfiles/kml/pal2/icon18.png';
timeSpanStart = '';
timeSpanStop = '';
visibility = 0;

AuthorizedOptions = authoptions('ge_point');
parsepairs

L = length(X); %number of points

%%%%%CONVERT COLORS TO STRING FORMAT%%%%%
if size(iconColor,1)==1
    if length(iconColor)~=8 %assume it is a matlab color specification
        iconColor = ge_color(iconColor);
    end
    C = repmat(iconColor,L,1);
    cnans=[];
else
    %generate colormap from data
    C = data2hexcolor(iconColor);
    cnans = find(isnan(sum(iconColor,2)));
end

%%%%%POINT SIZE SCALING%%%%%
if length(iconScale)==1
    S = repmat(iconScale,L,1);
else
    Smax = 2; %maximum scale factor
    S = iconScale.*Smax./max(iconScale);
end

%%%%%TIME SPAN%%%%%
if isempty(timeSpanStart)
    timeSpanStart = repmat(' ',L,1);
end

if isempty(timeSpanStop)
    timeSpanStop = repmat(' ',L,1);
end

%%%%%REMOVE MISSING DATA%%%%%
junk = unique([find(isnan(X+Y+Z+S));cnans]);
X(junk)=[];
Y(junk)=[];
Z(junk)=[];
S(junk)=[];
C(junk,:)=[];
L = length(X);

%%%%%GENERATE KML STRINGS%%%%%
kmlStr = cell(1,L);
% kmlStr = '';
% disp('Generating .kml file')
for i=1:L
%     meter(L,i);
    x=X(i);
    y=Y(i);
    z=Z(i);
    c=C(i,:);
    s=S(i);
    
    St = ge_point(x,y,z,...
        'iconColor',c,...
        'iconScale',s,...
        'iconURL',iconURL,...
        'altitudeMode',altitudeMode,...
        'timeSpanStart',timeSpanStart(i,:),...
        'visibility',visibility);
    kmlStr{i} = St;
%     kmlStr = [kmlStr,St];
end

kmlStr = cell2mat(kmlStr);
