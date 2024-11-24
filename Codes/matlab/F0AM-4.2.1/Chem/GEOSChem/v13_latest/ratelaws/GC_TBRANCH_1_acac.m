function k = GC_TBRANCH_1_acac(T, a0, c0, a1, c1)
%     ! Temperature Dependent Branching Ratio, used for reactions:
%     !    MO2 + MO2 = CH2O  + MOH + O2
%     !    MO2 + MO2 = 2CH2O + 2HO2
%     !
%     ! For these reactions, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0
%     !    (300/T)**b1
%     ! because b0 = b1 = 0.  Therefore we can skip computing these
%     ! terms.  This avoids excess CPU cycles. (bmy, 12/18/20)
   
    k0 = a0 .* exp( c0 ./ T );
    k1 = a1 .* exp( c1 ./ T );
    k  = k0 ./ ( 1.0 + k1 );
  
end