function k = GC_OHHNO3_acacac(M,T,a0, c0, a1, c1, a2, c2 )
%     ! Used to compute the rate for these reactions:
%     !    HNO3  + OH = H2O + NO3
%     !    HONIT + OH = NO3 + HAC
%     !
%     ! For these reactions, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0
%     !    (300/T)**b1
%     !    (300/T)**b2
%     ! Because b0 = b1 = b2 = 0.  Therefore we can skip computing
%     ! these terms.  This avoids excess CPU cycles. (bmy, 12/18/20)
   %   ! ---  OH + HNO3:   K = K0 + K3[M] / (1 + K3[M]/K2)  ------
    k0   = a0 .* exp( c0 ./ T );
    k1   = a1 .* exp( c1 ./ T );
    k2   = M .* ( a2 * exp( c2 ./ T ) );
    k = k0 + k2 ./ ( 1.0 + k2./k1 );

end

