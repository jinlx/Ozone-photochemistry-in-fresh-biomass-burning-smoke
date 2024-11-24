function fitresults = linefit(x,y,plotme,order)
%function fitresults = linefit(x,y,plotme,order)
%simple line fit and optional plotting of said line.
%INPUTS:
%x,y: x and y vectors.
%plotme: if you want the line plotted on on the current figure, make this 1; otherwise 0.
%order: optional input to specify polynomial order. default is 1
%OUTPUTS:
%fitresults: vector containing coefficients, uncertainties and r^2
%080104 GMW
%
%Works better now. 110526 GMW

if nargin<4
    order = 1;
end

%do the fit
i=find(~isnan(x+y));
[fitpar,s] = polyfit(x(i),y(i),order);
yfit = polyval(fitpar,x);
fitunc = sqrt(diag(inv(s.R)*inv(s.R')).*s.normr.^2./s.df); %from polyfit documentation

%correlation coefficient
r = corrcoef(x,y,'rows','pairwise');
r2 = r(1,2).^2;

fitresults = [fitpar fitunc' r2];

%plot line and print equation
if plotme
    hold on
    [xsort,i] = sort(x); %sort values
    yfit = yfit(i);
    plot(xsort,yfit,'k-')
    
    xlimits = [nanmin(x) nanmax(x)];
    ylimits = ylim;
    if order==1
        text(1,0,['y = (' num2str(fitpar(1),3) '\pm ' num2str(fitunc(1),3) ')*x + (' ...
            num2str(fitpar(2),3) '\pm' num2str(fitunc(2),3) '), r^2 = ' num2str(r2,3)],...
            'fontsize',14,'horizontalalignment','right','verticalalignment','bottom')
    elseif order==2
        text(1,0,['y = ' num2str(fitpar(1),2) '*x^2 + ' num2str(fitpar(2),2) '*x + ' num2str(fitpar(3),2) ', r^2 = ' num2str(r2,2)],...
            'fontsize',14,'horizontalalignment','right','verticalalignment','bottom')
    elseif order==3
        text(1,0,['y = ' num2str(fitpar(1),2) '*x^3 + ' num2str(fitpar(2),2) '*x^2 + ' num2str(fitpar(3),2) '*x + ' num2str(fitpar(4),2) ', r^2 = ' num2str(r2,2)],...
            'fontsize',14,'horizontalalignment','right','verticalalignment','bottom')
    elseif order==4
        text(1,0,['y = ' num2str(fitpar(1),2) '*x^4 + ' num2str(fitpar(2),2) '*x^3 + ' num2str(fitpar(3),2) '*x^2 + ' num2str(fitpar(4),2) '*x + ' num2str(fitpar(5),2) ', r^2 = ' num2str(r2,2)],...
            'fontsize',14,'horizontalalignment','right','verticalalignment','bottom')
    end
end

