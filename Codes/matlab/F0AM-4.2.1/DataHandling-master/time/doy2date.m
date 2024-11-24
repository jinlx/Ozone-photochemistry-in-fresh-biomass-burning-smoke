%function datevec = doy2date(doygmt,year,format)
%Converts UTC fractional Day of Year to a date string.
%INPUTS:
%doygmt: UTC fractional day of year
%year: 4-digit year
%format: string format identifier, e.g. 'yymmddHHMM'
%070802 GMW
% 20181223 GMW updated for vector year input

function datestring = doy2date(doygmt,year,format)

if nargin<3 %default format
    format = 'yymmdd';
end

if nargin<2 %use current year as default
    rightnow = datevec(now);
    year = rightnow(:,1);
end

mo = ones(size(year));
dy = zeros(size(year));
offset=datenum([year mo dy]);
datestring = datestr(offset+doygmt,format);


