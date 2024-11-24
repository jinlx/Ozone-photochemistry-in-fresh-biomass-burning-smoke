function xp = percentile(x,p)
% function xp = percentile(x,p)
% Calculates the values corresponding to the percentile for a given data distribution.
% INPUTS:
% x: data vector.
% p: row or column vector specifying desired percentiles, range 0 - 100 %
%
% OUTPUT:
% xp: values of x corresponding to each percentile range.
%
% 20130807 GMW

%calculate cumulative distribution
nbins = 1e5; %number of bins
[count,bins] = hist(x,nbins);
countsum = cumsum(count); %cumulative sum of frequency distribution
cdf = countsum./max(countsum)*100; %convert to percentage

%find percentiles
i = findclosest(cdf,p);
xp = bins(i);


