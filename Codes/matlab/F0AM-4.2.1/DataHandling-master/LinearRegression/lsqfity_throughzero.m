
%
% M-file to calculate a "MODEL-1" least squares fit.
%
%     The line is fit by MINIMIZING the residuals in Y only.
%
%     The equation of the line is:     Y = my * X .
%
%     Equations are from Antal Kozak and Robert Kozak (1995)
%       Notes on regression through the origin
%       VoL. 71 No. 3, The Forestry chronicle.
%
%     Data are input and output as follows:
%
%         [my,ry]=lsqfity_throughzero(X,Y)
%
%             X     =    x data (vector)
%             Y     =    y data (vector)
%
%             my    =    slope
%             ry    =    correlation coefficient
%             smy   =    standard deviation of the slope

function [my,ry]=lsqfity_throughzero(X,Y)


% Calculate my, by, ry, s2, smy and sby
my = X(:)\Y(:);
y0 = X(:).*my;

Yy0=sum((Y(:)-y0).^2,1);
Yymean=sum((Y(:)-mean(Y)).^2,1);
% my = num / den;
% by = (Sx2 * Sy - Sx * Sxy) / den;
ry = (1-(Yy0./Yymean)).^0.5;

diff = Y  - my .* X;

% s2 = sum(diff .* diff) / (n-2);
% smy = sqrt(n * s2 / den);
% sby = sqrt(Sx2 * s2 / den);
