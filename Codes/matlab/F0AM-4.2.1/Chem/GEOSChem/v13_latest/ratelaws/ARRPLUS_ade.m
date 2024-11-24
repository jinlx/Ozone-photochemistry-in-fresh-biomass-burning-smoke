function k = ARRPLUS_ade(T, a0, d0, e0)
%     ! Modified Arrhenius law, skipping computation of EXP( -b0/T )
%     ! and ( 300/T )**c0 terms, which evaluate to 1 when b0 = c0 = 0.
%     ! This avoids excess CPU cycles. (bmy, 12/18/20)
%     !
%     ! Used to compute the rate for these reactions:
%     !    IHOO1 + IHOO1 = 2MVK  + 2HO2 + 2CH2O
%     !    IHOO4 + IHOO4 = 2MACR + 2HO2 + 2CH2O
%     !    IHOO1 + IHOO4 = MACR + MVK + 2HO2 + 2CH2O
%     !    IHOO1 + IHOO1 = HO2 + HC5A + CO + OH +  MVKHP
%     !    IHOO4 + IHOO4 = HO2 + HC5A + CO + OH +  MCRHP
%     !    IHOO1 + IHOO4 = HO2 + HC5A + CO + OH +  0.5MVKHP + 0.5MCRHP
%     !    IHOO1 + MO2   = MVK + 2HO2 + 2CH2O :
%     !    IHOO1 + MO2   = CH2O + 0.5HC5A + 1.5HO2 + 0.5MVKHP + 0.5CO + 0.5OH
%     !    IHOO4 + MO2   = MACR + 2HO2 + 2CH2O
%     !    IHOO4 + MO2   = CH2O + 0.5HC5A + 1.5HO2 +  0.5MCRHP + 0.5CO + 0.5OH
%     !

    k = a0 .* ( d0 + ( T .* e0 ) );
   % k = max( [k, 0.0] );
  
end