function [i,istr,xi,yi] = PickPoints(x,y)
% function [i,istr,xi,yi] = PickPoints(x,y)
% Allows you to graphically select points in an array.
% This function will make a figure and dock it in you MATLAB window.
% Use the data cursor, then select one of the options that appear in the command window.
% Options include:
% 1) Single Point: grab only the selected point
% 2) Window: grab all points between and including two selected points. You will be prompted to pick
% the second point
% 3) Undo Last: remove the last selected point or window from the output
% 4) Done: finish up
%
% INPUTS, x and y, are 1-D arrays to be plotted
% OUTPUTS (all column vectors):
%   i: index of chosen points
%   istr: condensed string of index points (useful for copying index to an m-file)
%   xi: x values of chosen points
%   yi: y values of chosen points
%
% 120521 GMW

%make figure
h = figure;
plot(x,y,'+-')
xlabel('I AM X')
ylabel('I AM Y')
title('POINT PICKER')
cursor = datacursormode(h);
datacursormode on
set(h,'WindowStyle','docked')

%pick points
i=[];
done=0;
while ~done
    k = input('Choose Option: \n 1)Single Point \n 2)Window \n 3)Undo Last \n 4)Done \n');
    switch k
        case 1 %single point
            S = getCursorInfo(cursor);
            ilast = S.DataIndex;
            i = [i;ilast];
        case 2 %window of points
            S = getCursorInfo(cursor);
            i1 = S.DataIndex;
            disp('Pick second point and press any key:')
            pause
            S = getCursorInfo(cursor);
            i2 = S.DataIndex;
            if i1<i2
                ilast= [i1:i2]';
            else
                ilast= [i2:i1]';
            end
            i = [i;ilast];
        case 3 %remove last selection
            [junk,ii] = intersect(i,ilast);
            i(ii)=[];
        case 4
            done = 1;
        otherwise
            warning('Option not recognized.')
    end
end
xi = x(i);
yi = y(i);

istr=[];
ichunk = chunker(i);
for j=1:size(ichunk,1)
    if ichunk(j,1)==ichunk(j,2)
        istr = [istr num2str(ichunk(j,1)) ' '];
    else
        istr = [istr num2str(ichunk(j,1)) ':' num2str(ichunk(j,2)) ' '];
    end
end


            