function k = GC_RO2NO_B2_aca(M, T, a0, c0, a1 ) 
% 
%     ! Reaction rate for the "B" branch of these RO2 + NO reactions:
%     !    ETO2 + NO = NO2 +     HO2 + ...
%     !    A3O2 + NO = NO2 +     HO2 + ...
%     !    R4O2 + NO = NO2 + 0.27HO2 + ...
%     !    B3O2 + NO = NO2 +     HO2 + ...
%     ! in which the "a1" parameter is greater than 1.0.
%     !
%     ! For these reactions, these Arrhenius law terms evaluate to 1:
%     !    (300/T).^b0
%     !    (300/T).^b1 .* exp(c1/T)
%     ! because b0 = c0 = c1 = 0.  Therefore we can skip computing
%     ! these terms.  This avoids excess CPU cycles. (bmy, 1/4/20)
%     !
%     ! Use this function when a1 input argument is greater than 1.0.
%     ! This avoids IF statements, which saves CPU cycles (bmy, 1/4/20)
    k0     = a0 .* exp( c0 ./ T );
    xxyn   = 1.94e-22 .* exp(  0.97 .* a1 ) .* M;
    yyyn   = 0.826 .* ( (300./T).^8.1 );
    aaa    = log10( xxyn ./ yyyn );
    zzyn   = ( 1.0 ./ ( 1.0 + ( aaa  .* aaa  ) ) );
    rarb   = ( xxyn   ./ ( 1.0 + ( xxyn ./ yyyn ) ) ) .* ( 0.411.^zzyn );
    fyrno3 = ( rarb   ./ ( 1.0 +   rarb          ) );
    k      = k0 .* ( 1.0 - fyrno3 );

end

