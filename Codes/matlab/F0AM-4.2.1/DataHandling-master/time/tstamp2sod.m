function sod = tstamp2sod(tstamp)
% function tstamp2sod(times)
% Converts a clock-style timestamp string (HH:MM or HH:MM:SS) into seconds of day.
% INPUT times can be a string or cell array of strings.
% OUTPUT is a vector in units of seconds of day.
% 20130608 GMW

v = datevec(tstamp);
sod = v(:,4)*3600 + v(:,5)*60 + v(:,6);
