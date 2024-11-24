function [yout,youtstd,n,xout] = BinAvgTOD(xin,yin,inc,num_pts,num_std,meanmed,som);
%function [yout,youtstd,n,xout] = BinAvgTOD(xin,yin,inc,num_pts,num_std,meanmed,som);
%
% Averages data as a function of time-of-day.
% Assumes input vector, xin, has units of fractional day of year.
% Input "inc" should give desired time increment in units of hours.
% For more details on inputs, see comments for BinAvg.m.
%
% 120628 GMW

if nargin<4, num_pts=0; end
if nargin<5, num_std=0; end
if nargin<6, meanmed=0; end
if nargin<7, som=0; end

tod = (0:inc:24-inc)';
todfull = 24.*(xin - floor(xin));
iwrap = find(todfull>(24-inc/2)); %identify points to be wrapped around to midnight
todfull(iwrap) = todfull(iwrap) - 24;

[yout,youtstd,n,xout] = BinAvg(todfull,yin,tod,num_pts,num_std,meanmed,som);

