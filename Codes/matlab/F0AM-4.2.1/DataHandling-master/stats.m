%function [s,n] = stats(x)
%This function spits out a row of statistics
%(median,mean,stddev,min,max,# good pts) for input vector x.
%070201 GMW
%Modified to work with matrices (treating columns as variables). 071030 GMW
%
%Modified to include # of points as a separate output, since this number is
%often not the same order of magnitude as the other stats. 090213 GMW

function [s,n] = stats(x)

if isempty(x)==1
    s = nan(size(x,2),6);
    n = nan(size(x,2),1);
else
    s(:,1)=nanmedian(x);
    s(:,2)=nanmean(x);
    s(:,3)=nanstd(x);
    s(:,4)=min(x);
    s(:,5)=max(x);
    for i=1:size(x,2), n(i)=length(find(~isnan(x(:,i)))); end
end

%disp('median mean std min max N')
%s