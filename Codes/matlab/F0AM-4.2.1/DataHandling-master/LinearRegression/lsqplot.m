function h = lsqplot(x,m,b,sm,sb,r2,color)
% function h = plotfit(x,m,b,sm,sb,r2,color)
% Plots a linear fitted line onto the current graph. Also tacks on the
% equation for the line and r_squared, if you like.
%
% INPUTS:
% x: range of x values to plot over ([min max]).
% m: slope
% b: intercept
% sm: slope uncertainty
% sb: intercept uncertainty
% r2: r-squared
%
% OUTPUT h is the handle to the fit line.
%
% 20150807 GMW
% 20160121 GMW added color option
% 20180425 GMW  Updated text printing

% defaults
if nargin<7, color = 'k'; end
if nargin<6, r2 = []; end
if nargin<5, sb = []; end
if nargin<4, sm = []; end
assert(nargin>=3,'Must specify x,m,b inputs.')

% plot line
ylinfit = m.*x + b;
hold on;
h = plot(x,ylinfit,'color',color);

%add text

% get fit info
cnames  = {'m','b'}; %coefficient names
cvalues = [m b]; %values
cerrors = [sm sb]; %95% confidence bounds

% build string to print
str_eqn = sprintf('y = m*x + b');

str_c = cell(length(cnames),1);
for i = 1:length(cnames)
    
    c = cvalues(i);
    ce = cerrors(i);
    
    % determine # of sig figs
    eplace = floor(log10(ce));
    cplace = floor(log10(abs(c)));
    sigfig = cplace - eplace + 1;
    if sigfig<1, sigfig = 1; end
    spec = ['%0.' num2str(sigfig) 'g'];
    
    str_c{i} = [cnames{i} ' = ' num2str(c,spec) ' \pm ' num2str(ce,'%0.1g')];
end
str_c = sprintf('%s\n',str_c{:});

str_r2 = sprintf('r^2 = %0.2f',r2);

str = sprintf('%s\n%s%s',str_eqn,str_c,str_r2);

% create text box and print info
loc = [0.95 0.05 0.1 0.1]; % location, normalized units
H = text(loc(1),loc(2),str,...
    'Units','normalized',...
    'EdgeColor','k',...
    'Fontsize',12,...
    'HorizontalAlignment','Right',...
    'VerticalAlignment','Bottom',...
    'Color',color);

if ~nargout, clear h; end

