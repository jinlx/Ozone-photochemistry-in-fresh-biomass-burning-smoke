% function D = datearray(stdate,nddate)
% Takes a start date and end date and makes a cell array that contains all
% of the dates in between. stdate and nddate should be strings with the
% format 'yymmdd'.
% 090703 GMW

function D = datearray(stdate,nddate)

format = 'yymmdd';

stnum = datenum(stdate,format);
ndnum = datenum(nddate,format);

Dnums = [stnum:ndnum]';

Dstrs = datestr(Dnums,format);

D = cellstr(Dstrs);
