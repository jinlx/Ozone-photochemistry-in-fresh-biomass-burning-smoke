function k = GC_HACOH_B_ac( T, a0, c0 )
%     ! Used to compute the rate for this reaction:
%     !    HAC + OH = 0.5HCOOH + OH + 0.5ACTA + 0.5CO2 + 0.5CO + 0.5MO2
%     ! which is the "B" branch of HAC + OH.
%     !
%     ! For this reaction, this Arrhenius law term evaluates to 1:
%     !    (300/T).*.*b0}
%     ! because b0 = 0.  Therefore we can skip computing this
%     ! term.  This avoids excess CPU cycles. (bmy, 12/18/20)
    exp_arg = -1.0 ./ 60.0;
    k0       = a0 .* exp( c0 ./ T );
    hac_frac = 1.0 - 23.7 .* exp( exp_arg .* T );
    %hac_frac = max( [hac_frac, 0.0] );
    k        = k0 .* ( 1.0 - hac_frac );
end

