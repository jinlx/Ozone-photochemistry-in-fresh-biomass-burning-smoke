function k =  GC_RO2NO_A1_ac(T, a0, c0 )
%     ! Reaction rate for the "A" branch of these RO2 + NO reactions:
%     !    MO2  + NO = MENO3
%     ! in which the "a1" parameter equals exactly 1.
%     !
%     ! For these reactions, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0
%     !    (300/T)**b1 * EXP(c1/T)
%     ! because b0 = b1 = c1 = 0.  Therefore we can skip computing
%     ! these terms.  This avoids excess CPU cycles. (bmy, 1/4/20)
%     !
%     ! Special treatment for methyl nitrate based on observations
%     ! as Carter and Atkinson formulation does not apply to C1.
%     ! Value based on upper limit of Flocke et al. 1998 as applied
%     ! in Fisher et al. 2018
%     !
 
    k  = a0 .* exp( c0 ./ T ) * 3.0e-4;

end

