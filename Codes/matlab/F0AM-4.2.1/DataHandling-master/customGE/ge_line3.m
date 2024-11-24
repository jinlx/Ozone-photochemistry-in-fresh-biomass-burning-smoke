function kmlStr = ge_line3(X,Y,Z,varargin)

%%%%%DEAL WITH OPTIONS%%%%%
altitudeMode = 'clampToGround';
lineColor = 'FFFFFFFF';
lineWidth = 1.0;
timeSpanStart = '';
timeSpanStop = '';
visibility = 0;

AuthorizedOptions = authoptions('ge_plot3');
parsepairs

L = length(X); %number of points

%%%%%CONVERT COLORS TO STRING FORMAT%%%%%
C = lineColor;
if size(C,1)==1
    if length(C)~=8 %assume it is a matlab color specification
        C = ge_color(C);
    end
    C = repmat(C,L,1);
else
    %generate colormap from data
    derp = figure;
    cmap = colormap('jet');
    clim = linspace(min(C),max(C),size(cmap,1)); %linearly-spaced vector for color limits
    c = interp1(clim,cmap,C);
    c = floor(c*255); %convert from [0 1] to [0 255]
    cnans = find(isnan(sum(c,2)));
    c(cnans,:) = 0;
    r = dec2hex(c(:,1),2);
    g = dec2hex(c(:,2),2);
    b = dec2hex(c(:,3),2);

    a = 255*ones(size(c,1),1); %opacity
    a(cnans) = 0; %make missing values transparent
    a = dec2hex(a,2);

    C = [a r g b]; %hex color strings
    close(derp)
end

%%%%%TIME SPAN%%%%%
if isempty(timeSpanStart)
    timeSpanStart = repmat(' ',L,1);
end

if isempty(timeSpanStop)
    timeSpanStop = repmat(' ',L,1);
end

%%%%%GENERATE KML STRINGS%%%%%
kmlStr = cell(1,L-1);
for i=1:L-1
    x=[X(i) X(i+1)];
    y=[Y(i) Y(i+1)];
    z=[Z(i) Z(i+1)];
    c=C(i,:);
    if any(isnan(x+y+z)) | c(1:2)=='00', continue; end
    
    St = ge_plot3(x,y,z,...
        'lineColor',c,...
        'lineWidth',lineWidth,...
        'altitudeMode',altitudeMode,...
        'timeSpanStart',timeSpanStart(i,:),...
        'visibility',visibility);
    kmlStr{i} = St;
end

empty = find(cellfun('isempty',kmlStr));
kmlStr(empty)=[];
kmlStr = cell2mat(kmlStr);


