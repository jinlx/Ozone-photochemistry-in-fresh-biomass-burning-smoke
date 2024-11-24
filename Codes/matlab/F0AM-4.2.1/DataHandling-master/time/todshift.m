function t_out = todshift(t_in,hours2shift)
% function t_out = todshift(t_in,hours2shift)
% shifts a time-of-day vector by the number of hours specified.
% corrections are applied to keep the scale from 0-24.
% 20131216 GMW

t_out = t_in + hours2shift;

tooSmall = t_out<0;
tooBig = t_out>=24;

t_out(tooSmall) = t_out(tooSmall) + 24;
t_out(tooBig) = t_out(tooBig) - 24;