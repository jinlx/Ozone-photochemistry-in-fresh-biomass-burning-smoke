function q = biasMetrics(o,m,plottext)
% function q = biasMetrics(o,m,plottext)
% calculates a few metrics for comaprison of two datasets, e.g. model and observations.
% Formulae for NMB and NMAE aer from Gustafson and Yu, Atmos. Sci. Let. 13: 262-267 (2012), doi: 10.1002/asl.393.
%
% INPUTS
% o: observations vector.
% m: measurements vector. Typically same units/quantity as o.
% plottext: flag for putting results in a box on the current axes. default = 0 (no).
%
% OUTPUTS
% q.NMB: Normalized mean bias (fractional)
% q.NMAE: normalized mean absolute error (fractional)
% q.r: pearson correlation coefficient
%
% 20180405 GMW
% 20180905 GMW  Added plottext option

if nargin<3, plottext=0; end

% filter nans
i = isnan(o+m);
o(i) = []; 
m(i) = [];

% quantities
M = mean(m);
O = mean(o);
E = mean(abs(m - o)); %mean absolute gross error

% normalized bias factors
if sign(O) ~= sign(M)
    % in this case, NMB and NMAE are undefined
    q.NMB  = nan;
    q.NMAE = nan;
elseif abs(M) >= abs(O)
    q.NMB = abs(M./O) - 1;
    q.NMAE = E./abs(O);
elseif abs(M) < abs(O)
    q.NMB = 1 - abs(O./M);
    q.NMAE = E./abs(M);
end

% pearson correlation
r = corrcoef(o,m);
q.r = r(1,2);

if plottext
    str = sprintf('%s\n%s',...
    ['NMB = ' num2str(q.NMB*100,'%1.1f') '%'],...
    ['NMAE = ' num2str(q.NMAE*100,'%1.1f') '%']);
H = text(0.95,0.05,str,...
    'Units','normalized',...
    'EdgeColor','k',...
    'Fontsize',12,...
    'HorizontalAlignment','Right',...
    'VerticalAlignment','Bottom');
end


