function k = GC_HO2HO2_acac(H2O, M,T,a0, c0, a1, c1 )
%     ! Used to compute the rate for these reactions:
%     !    HO2 + HO2 = H2O2 + O2
%     !
%     ! For this reaction, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0
%     !    (300/T)**b1
%     ! because b0 = b1 = 0.  Therefore we can skip computing these
%     ! terms.  This avoids excess CPU cycles. (bmy, 12/18/20)

    k0 = a0 .* exp( c0 ./ T );
    k1 = a1 .* exp( c1 ./ T );
    k  = ( k0 + k1 .* M  ) .* ( 1.0 + 1.4E-21 .* H2O .* exp( 2200.0 ./ T ) );

end

