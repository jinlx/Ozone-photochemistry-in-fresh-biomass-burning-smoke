function [Reactivity,ReactivityNames] = GetReactivity(Spname,S,Rct2plot,varargin)
% function [Reactivity,ReactivityNames] = GetReactivity(Spname,S,Rct2plot,varargin)
% Derive speciated reactivity (inverse lifetime) versus time.
% Typically used to look at oxidant reactivity (e.g. OH or O3.. can also pass 
% 'hv' as a reactant to see loss relative to photolysis).
% This will NOT properly calculate reactivity for 3rd-order reactions.
%
% INPUTS:
% Spname: name of species of interest.
%
% S: structure of model outputs. Must contain the following fields:
%    Time, Cnames, Chem.Rnames, Chem.Rates, Chem.f
%
% Rct2plot: cell array of reactant names to plot individually. This can also contain nested cell
%   arrays that define groups of reactants to lump together. In this case, the name of the group (for
%   the plot legend) should be the first string in the sub-cell array.
%   There are also two special cases for this input:
%   'sum': the total reactivity will be output.
%   'all': all reactants will be speciated.
%			Note, using 'all' for something with many reactions, like OH/MCM, might break Matlab due to memory limitations.
%			In such a case it is best to set plotme = 0 (see below).
%
% varargin: One can specify several options as name-value pairs:
%
%           PlotReactivity(...,'sumEq',value)
%               Specifies a 0-1 flag for combining equilibrium reactions
%               (e.g. HO2 + NO2 = HO2NO2 and its reverse reaction).
%               Default: 0
% 
%           PlotReactivity(...,'ptype',value)
%               Indicates type of plot.
%               Values can include 'fill', 'bar' or 'line'.
%               Default: 'fill'
%
%           PlotReactivity(...,'unit',value)
%               Changes the rate unit.
%               Valid values include 's','m','h' for inverse seconds, minutes and hours.
%               Default: 's'
% 
%           PlotReactivity(...,'scale',value)
%               Specifies an additonal scalar multiplier.
%               SPECIAL CASE: setting this to 0 causes normalization by total reactivity.
%               Default: 1
%
%           PlotReactivity(...,'plotme',value)
%               Specifies whether to generate plot or not.
%               1 = plot, 0 = don't.
%               Default: 1
%
%           PlotReactivity(...,'parent',axis)
%               Specifies the axis handle you want to plot on (useful for putting
%               this into subfigures... Default is to create a new figure. 
%
%           PlotReactivity(...,'cmapname','jet')
%               Specifies the colormap you want to use by name for
%               plotting. 
%            
%           PlotReactivity(...,'cols',cols)
%               Specifies an n x 3 size matrix of color values (between
%               0-1) for plotting colors explicitly. Useful if you want to 
%               plot with consistent colors across figures. n = length(Rct2plot) +1.
%
% OUTPUTS:
% Reactivity: matrix of reactivities.
%             One row for each model point, one column for each reactivity class.
%
% ReactivityNames: names of each reactivity class.
% 
% Example Use (for OH reactivity):
% Inorg = {'Inorganic';'CO';'H2';'O3';'HO2';'H2O2'};
% Reactants = {'CH4'; Inorg; 'C5H8'; 'MBO'; 'NO2'};
% PlotReactivity('OH',S,Reactants);
%
% 20120319 GMW
% 20120725 GMW    Updated for UWCMv2.1.
% 20120904 GMW    Added output arguments.
% 20151118 GMW    Updated for F0AMv3, added options.
% 20210226 GMW    Added option to plot sum or all reactants and disable plotting.
% 20210623 JDH    Added 'parent' option to plot to a specific subplot/ axis. &
%                 options to pass either a cmap name or array of colors size cols[:,3]
%                 explicitly as the colors of plots. 
% 20210623 JDH    Added option to plot 'hv' as a reactant 
%                 (so it would show photolysis rxns seperate from 'Other') 
% 20210922 GMW    Modified handling of colors to work with bar and line plot styles.
% 20220603 GMW    Fixed bug in assignment of "Rctnames" related to third column in Chem.iG matrix
%                 (for occasional 3rd-order reactions). This was causing incorrect calculations
%                 for the "sum" and "all" options. Thanks to Abby Sebol.
%                 Also added sorting when using "all" option.
% 20221111 Lixu   derived from PlotReactivity to get the reactivity for groups.

%%%%% DEAL WITH INPUTS %%%%%

% check inputs
allflag = 0; sumflag = 0;


if ischar(Rct2plot)
    switch Rct2plot
        case 'sum', sumflag = 1;
        case 'all', allflag = 1;
        otherwise
          error('PlotReactivity:InvalidInput','Input "Rct2plot" not valid. Seek help.')  
    end
elseif ~iscell(Rct2plot)
    error('PlotReactivity:InvalidInput','Input "Rct2plot" not valid. Seek help.')
end


%options
varInfo = {...
    %name       %default    %valid
    'unit'      's'         {'s','m','h'};...
    'scale'     1           [];...
    'ptype'     'fill'      {'fill','bar','line'};...
    'sumEq'     0           [0 1];...
    'plotme'    1           [0 1];...
    'parent'    0           [];...   
    'cols'      [],         [];... 
    'cmapname'  '',         [];... 
    };
ParsePairs(varargin,varInfo);

% Error checking some of the vargin
if ~isstring(cmapname) && ~ischar(cmapname) && isempty(cmapname)
    error('PlotReactivity: cmapname must be a string or char.');
end

% Make sure color arr is correct length 
if ~isempty(cols)  
    if width(cols)~=3 ; error('PlotReactivity: cols must be a 3 column array.'); end 
    if max(max(cols))>1;error('PlotReactivity: cols must not contain values >1.'); end
    if min(min(cols))<0;error('PlotReactivity: cols must not contain values <0.'); end
end

% Get unit multiplier and string
switch unit
    case 's',   unitX = 1;       unitS = 's^-^1';
    case 'm',   unitX = 60;      unitS = 'm^-^1';
    case 'h',   unitX = 3600;    unitS = 'h^-^1';
end

if scale==0
    unitS = 'norm';
elseif scale~=1
    unitS = [num2str(1./scale,'%1.2G') ' ' unitS];
end
scale = unitX*scale;

%%%%% BREAKOUT VARIABLES %%%%
Cnames = S.Cnames;
rates  = S.Chem.Rates;
iG     = S.Chem.iG;
Time   = S.Time; 
CSp    = S.Conc.(Spname);

CSp(CSp==0) = 1e-14; %avoid /0 nan issues in reactivity calculation

nTm = size(rates,1);       %number of time-points

%%%% REMOVE GROUP NAMES AND GENERATE LEGEND %%%%%

if sumflag || allflag
    Rct2plot = Cnames;
    Rct2plot(strcmp(Rct2plot,Spname)) = []; %remove reactant
    lnames = Rct2plot;
    nRx = length(Rct2plot);
else
    nRx = length(Rct2plot)+1; %number of reactions to plot
    lnames = cell(nRx,1);
    for i=1:length(Rct2plot)
        Rnow = Rct2plot{i};
        if iscell(Rnow)
            lnames{i} = Rnow{1};
            Rct2plot{i}(1) = [];
        else
            lnames{i} = Rnow;
        end
    end
    lnames{end} = 'Other';
end

%%%%% GRAB RATES AND REACTANTS %%%%%
[rSp,rSpnames,iRx] = ExtractRates(Spname,S,sumEq);
iL = sum(rSp,1)<0; %only want loss terms
nL = sum(iL);
Reactivity = -rSp(:,iL)./repmat(CSp,1,nL);
rSpnames = rSpnames(iL);
iRx = iRx(iL);
Rctnames = Cnames(iG(iRx,1:2)); %2-column cell array of reactant names for each reaction

% Take care of photolysis reactions (look for 'hv' in reaction)... 
j_rxns= find(contains(rSpnames,'hv')); 
for hv=1:length(j_rxns)
    if contains(Rctnames(j_rxns(hv), 2),'ONE')==1 ;Rctnames(j_rxns(hv), 2)={'hv'}; end 
end 

%scale
if scale(1)==0,         Reactivity = Reactivity./repmat(sum(Reactivity,2),1,nL);
elseif length(scale)>1, Reactivity = Reactivity.*repmat(scale,1,nL);
else                    Reactivity = Reactivity.*scale;
end
Reactivity(isnan(Reactivity)) = 0; %potential for NaNs in normalizing

%%%%%% COMBINE REACTIONS FOR SPECIFIED REACTANTS %%%%%
R2plot = nan(nTm,nRx);
iUsed=[];
for i=1:length(Rct2plot)
    Rnow = Rct2plot{i};
    tf = ismember(Rctnames,Rnow);
    iRct = find(sum(tf,2)); %index for reactions where Rnow is present
    if ~isempty(iRct)
        R2plot(:,i) = sum(Reactivity(:,iRct),2);
        iUsed = [iUsed;iRct];
    else
        R2plot(:,i) = zeros(nTm,1);
    end
end

%%%%% DEAL WITH OTHER REACTANTS OR NON-REACTIVE SPECIES %%%%%
if allflag
    
    % filter non-contributing reactions
    sumR = sum(R2plot,1);
    junk = sumR == 0;
    R2plot(:,junk) = [];
    lnames(junk) = [];
    
    % sort
    sumR = sum(R2plot,1);
    [~,isorted] = sort(sumR,'descend');
    R2plot = R2plot(:,isorted);
    lnames = lnames(isorted);
    
elseif sumflag
    R2plot = sum(R2plot,2);
    lnames = 'Total';
else
    iOther = setdiff(1:nL,iUsed);
    ReactivityOther = Reactivity(:,iOther);
    rSpOtherNames = rSpnames(iOther);
    AverageReactivity = mean(ReactivityOther,1);
    [RMax,iMax] = max(AverageReactivity); %identify largest contribution in "other"
    
    disp(['PlotReactivity: ' Spname])
    disp(['  Number of reactions in "other" = ' num2str(length(iOther))])
    disp(['  Largest contribution in "other" is ' rSpOtherNames{iMax} ' at ' num2str(RMax) ' ' unitS])
    
    R2plot(:,end) = sum(ReactivityOther,2);
    % ===================================
    % Lixu, forcing to be sorted for data
    % ===================================
    % filter non-contributing reactions
    sumR = sum(R2plot,1);
    junk = sumR == 0;
    R2plot(:,junk) = [];
    lnames(junk) = [];
    
    % sort
    sumR = sum(R2plot,1);
    [~,isorted] = sort(sumR,'descend');
    R2plot = R2plot(:,isorted);
    lnames = lnames(isorted);
end

%%%%% OUTPUT %%%%%
Reactivity = R2plot;
ReactivityNames = lnames;