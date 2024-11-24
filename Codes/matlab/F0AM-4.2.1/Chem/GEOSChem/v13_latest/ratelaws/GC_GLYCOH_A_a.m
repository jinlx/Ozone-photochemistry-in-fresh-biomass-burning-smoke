function k = GC_GLYCOH_A_a(T, a0 )
%      ! Used to compute the rate for this reaction:
%     !    GLYC + OH = 0.732CH2O + 0.361CO2  + 0.505CO    + 0.227OH
%     !              + 0.773HO2  + 0.134GLYX + 0.134HCOOH
%     ! which is the "A" branch of GLYC + OH.
%     !
%     ! For this reaction, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0 * EXP(c0/T)
%     ! Because b0 = c0 = 0.  Therefore we can skip computing these
%     ! terms.  This avoids excess CPU cycles. (bmy, 12/18/20)
%     !
    exp_arg = -1.0 ./ 73.0;
    glyc_frac = 1.0 - 11.0729 .* exp( exp_arg .* T );
    %glyc_frac = max( [glyc_frac, glyc_frac.*0.0] );
    k         = a0 .* glyc_frac;

end

