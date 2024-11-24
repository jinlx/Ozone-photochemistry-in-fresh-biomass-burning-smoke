%function datevec = doy2datevec(doy,year)
%Converts fractional Day of Year to a date vector.
%INPUTS:
%doygmt: fractional day of year
%year: 4-digit year
%020717 GMW

function dv = doy2datevec(doy,year)

if nargin<2 %use current year as default
    rightnow = datevec(now);
    year = rightnow(:,1);
end

offset=datenum([year 01 00]);
dv = datevec(offset+doy);