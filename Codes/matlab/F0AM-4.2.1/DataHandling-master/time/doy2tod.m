function tod = doy2tod(doy)
%function tod = doy2tod(doy)
%Converts fractional day-of-year to fractional time-of-day.
%080904 GMW

tod = 24.*(doy - floor(doy));