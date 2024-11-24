function k =GC_RO2NO_A2_aca( M, T, a0, c0, a1 )
%     ! Reaction rate for the "A" branch of these RO2 + NO reactions,
%     !    ETO2 + NO = ETNO3
%     !    A3O2 + NO = NPRNO3
%     !    R4O2 + NO = R4N2
%     !    B3O2 + NO = IPRNO3
%     ! in which the "a1" parameter is greater than 1.0.
%     !
%     ! For these reactions, these Arrhenius law terms evaluate to 1:
%     !    (300/T).^b0
%     !    (300/T).^b1 * exp(c1/T)
%     ! because b0 = b1 = c1 = 0.  Therefore we can skip computing
%     ! these terms.  This avoids excess CPU cycles. (bmy, 1/4/20)
%     !
    k0     = a0 .* exp( c0 ./ T );
    xxyn   = 1.94e-22 .* exp( 0.97 .* a1 ) .* M;
    yyyn   = 0.826 .* ( ( 300.0 ./ T ).^8.1 );
    aaa    = log10( xxyn ./ yyyn );
    zzyn   = ( 1.0 ./ ( 1.0 + ( aaa .*  aaa  ) ) );
    rarb   = ( xxyn   ./ ( 1.0 + ( xxyn ./ yyyn ) ) ) .* ( 0.411.^zzyn );
    fyrno3 = ( rarb   ./ ( 1.0 +   rarb          ) );
    k      = k0 .* fyrno3;
end

