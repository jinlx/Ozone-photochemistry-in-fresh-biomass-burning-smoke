
function doy = date2doy(dates,format)

if nargin==1
    format = 'yymmdd';
end

L = size(dates,1);
dn = datenum(dates,format);
dv = datevec(dates,format);
yr = dv(:,1);

firstofyear = [yr ones(L,2) zeros(L,3)];
firstofyear = datenum(firstofyear);

doy = dn - firstofyear + 1;
