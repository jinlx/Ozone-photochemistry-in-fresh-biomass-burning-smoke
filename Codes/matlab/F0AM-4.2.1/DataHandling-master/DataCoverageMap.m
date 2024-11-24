function DataCoverageMap(x,y,int,ynames)
% function DataCoverageMap(x,y,int,ynames)
% Makes a series of plots to visualize the percent coverage of dependent variables over the span of
% an independent variable. The procedure is as follows:
% 1) The independent variable is divided into bins of width int
% 2) Each dependent variable in y is said to have coverage if it has ANY data in the bin.
% To keep the plot uncluttered, it is recommended to limit then number of dependent variables
% to 20 or less.
% INPUTS:
% x: 1-D array independent variable (e.g. time). Must be monotonic (increasing with constant spacing).
% y: Array or matrix of dependent variables. If an array, must be the same size as x.
%    If a matrix, each column is assumed to be a separate variable.
% int: interval of x over which to bin data when assessing coverage.
%      If not specified or empty, each value of x is counted as an individual bin.
% ynames: optional cell array containing names of variables in y.
% 120720 GMW


%%%%%BIN DATA%%%%%
if nargin>2 && ~isempty(int)
    [yavg,yavgstd,n,xavg] = BinAvg(x,y,int);
else
    yavg = y;
    xavg = x;
end
yavg(~isnan(yavg)) = 1;
[nx,ny] = size(yavg);

yCoverage = nansum(yavg,1)./nx*100; % percent coverage for each column of y
xCoverage = nansum(yavg,2)./ny*100; % percent coverage for each xavg bin

%%%%%PLOTS%%%%%
if nargin<4
    ynames = cellstr(num2str([1:ny]'))';
end

figure

h(1) = subplot(3,3,1:2);
plot(xavg,xCoverage,'-','LineWidth',3)
ylabel('% Coverage','FontSize',16','FontWeight','bold')
ylim([0 100])
set(gca,'YTick',0:10:100);
grid on; box on;

h(2) = subplot(3,3,[6 9]);
plot(yCoverage,1:ny,'bp','MarkerSize',16,'MarkerFaceColor','b');
xlabel('% Coverage','FontSize',16','FontWeight','bold');
xlim([0 100]); ylim([0 ny+1]);
set(gca,'YTickLabel',ynames,'XTick',0:10:100,'YTick',1:ny);
grid on; box on;

h(3) = subplot(3,3,[4 5 7 8]); hold all;
for i=1:ny
    plot(xavg,yavg(:,i).*i,'-','LineWidth',10)
end
xlabel('x','FontSize',16,'FontWeight','bold');
ylabel('variable','FontSize',16,'FontWeight','bold');
set(gca,'YTick',1:ny,'YTickLabel',ynames)
ylim([0 ny+1]);
box on; grid on

set(h,'FontSize',12','FontWeight','bold');

