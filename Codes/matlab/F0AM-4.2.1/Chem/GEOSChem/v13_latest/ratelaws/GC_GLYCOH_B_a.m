function k =GC_GLYCOH_B_a(T, a0)
%     ! Used to compute the rate for this reaction:
%     !    GLYC + OH = HCOOH + OH + CO
%     ! which is the "B" branch of GLYC + OH.
%     !
%     ! For this reaction, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0 * exp(c0/T)
%     ! Because b0 = c0 = 0.  Therefore we can skip computing these
%     ! terms.  This avoids excess CPU cycles. (bmy, 12/18/20)
%     !
     exp_arg = -1.0 ./ 73.0;
    glyc_frac = 1.0 - 11.0729 .* exp( exp_arg .* T );
    %glyc_frac = max( [glyc_frac, 0.0] );
    %ind = find(glyc_frac < 0);
    %glyc_frac(ind) = 0;
    k         = a0 .* ( 1.0 - glyc_frac );

end

