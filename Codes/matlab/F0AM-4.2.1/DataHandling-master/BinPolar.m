function [ThetaAvg,RhoAvg,ThetaStd,RhoStd,n,tAvg] = BinPolar(t,Theta,Rho,t2avg,num_pts,num_std,meanmed,som)
% function [ThetaAvg,RhoAvg,ThetaStd,RhoStd,n,tAvg] = BinPolar(t,Theta,Rho,t2avg,num_pts,num_std,meanmed,som)
% Averages directionalized data (e.g. winds) along a time (or other) coordinate.
% Method for calculating standard deviation of angles taken from Yamartino (1984) and Turner (1986), Journal of Climate and
% Applied Meteorology.
%
% INPUTS:
% t:        raw time vector
% Theta:    vector of angles, degrees
% Rho:      vector of magnitudes
% t2avg: Value specifying how to average data:
%        - If a scalar, this specifies the spacing of the averaging vector xout. 
%          In this case, tAvg = min(t):t2avg:max(t).
%        - If a vector, this gives the t-values to which Theta and Rho will be averaged.
%          The bin width is assumed equal to the median spacing of adjacent t2avg values.
% num_pts:  minimum number of points in a bin
% num_std:  maximum number of std to include in a bin
% meanmed:  averaging flag, 0=means, 1=medians
% som:      std flag, 0 = normal std, 1 = std of mean
% 
% OUTPUTS:
% ThetaAvg: averaged angles
% RhoAvg:   averaged magnitudes
% ThetaStd: standard deviation of angles
% RhoStd:   standard deviation of magnitudes
% n:        number of points in each bin
%
%120526 GMW
%120727 GMW     Updated to use BinAvg.m.

%%%%%DEFAULT VALUES%%%%%
if nargin<5, num_pts=0; end
if nargin<6, num_std=0; end
if nargin<7, meanmed=0; end
if nargin<8, som=0; end

%%%%%CONVERT TO CARTESIAN%%%%%
Theta = Theta*pi/180; %convert from degrees to radians
[u,v] = pol2cart(Theta,Rho);%convert to cartesian
sinTheta = sin(Theta);
cosTheta = cos(Theta);
uvsc = [u v sinTheta cosTheta];

%%%%%AVERAGING%%%%%
[uvscMean,uvscStd,n,tAvg] = BinAvg(t,uvsc,t2avg,num_pts,num_std,meanmed,som);
n = min(n(:,1:2),[],2);

%%%%%CONVERT BACK%%%%%
[ThetaAvg,RhoAvg] = cart2pol(uvscMean(:,1),uvscMean(:,2));
ThetaAvg = ThetaAvg*180/pi;
ThetaAvg(ThetaAvg<0) = ThetaAvg(ThetaAvg<0)+360; %compass degrees

%%%%%STANDARD DEVIATIONS%%%%%
RhoStd = sqrt(uvscStd(:,1).^2 + uvscStd(:,2).^2);

sinTheta = uvscMean(:,3);
cosTheta = uvscMean(:,4);
eta = sqrt(1 - (sinTheta.^2 + cosTheta.^2));
ThetaStd = asin(eta).*(1 + 0.1547.*eta.^3)*180/pi;

