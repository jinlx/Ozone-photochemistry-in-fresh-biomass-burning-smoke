function dv = Jday2datevec(doy,year)
% function dv = Jday2datevec(doy,year)
% Converts Julian fractional Day of Year to a 6-column date vector (year, month, day, hour, minute, second).
%
% INPUTS:
% doygmt: array fractional day of year
% year: (OPTIONAL) scalar 4-digit year. Default is current year.
%
% 20150609 GMW

if nargin<2 %use current year as default
    rightnow = datevec(now);
    year = rightnow(:,1);
end

offset = datenum([year 01 00]);
dv = datevec(offset + doy);