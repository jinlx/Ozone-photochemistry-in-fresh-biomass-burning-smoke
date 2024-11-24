function k = GC_RO2NO_B1_ac( T, a0, c0 )
%     ! Reaction rate for the "B" branch of these RO2 + NO reactions:
%     !    MO2 + NO = CH2O + NO2 + HO2
%     ! in which the "a1" parameter equals exactly 1.
%     !
%     ! For these reactions, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0
%     !    (300/T)**b1 * EXP(c1/T)
%     ! because b0 = c0 = c1 = 0.  Therefore we can skip computing
%     ! these terms.  This avoids excess CPU cycles. (bmy, 1/4/20)
%     !
    one_minus_fyrno3 = 1.0 - 3.0e-4;
    k = a0 .* exp( c0 ./ T ) * one_minus_fyrno3;
end

