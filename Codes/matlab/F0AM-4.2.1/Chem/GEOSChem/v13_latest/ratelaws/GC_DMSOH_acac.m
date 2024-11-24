function k = GC_DMSOH_acac(M, T,a0, c0, a1, c1 )
%     ! Reaction rate for:
%     !    DMS + OH = 0.750SO2 + 0.250MSA + MO2
%     !
%     ! For this reaction, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0
%     !    (300/T)**b1
%     ! Because b0 = b1 = 0.  Therefore we can skip computing these
%     ! terms.  This avoids excess CPU cycles. (bmy, 12/18/20)
    k0 = a0 .* exp( c0 ./ T );
    k1 = a1 .* exp( c1 ./ T );
    k  = ( k0 .* M .* 0.2095 ) ./ ( 1.0 + k1 .* 0.2095 );
end

