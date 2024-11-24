function k =GC_PAN_abab(M, T,a0, b0, a1, b1, cf )
    %! Used to compute the rate for these reactions:
    %!    MACR1OO + NO2 = MPAN
    %!    MACRNO2 + NO2 = MPAN + NO2
    %!
    %! For these reactions, these Arrhenius law terms evaluate to 1:
    %!    EXP(b0/T)
    %!    EXP(b1/T)
    %! because b0 = b1 = 0.  Therefore we can skip computing these
    %! terms.  This avoids excess CPU cycles. (bmy, 12/18/20)
    %!
    %! Sept 27 2012: Added GC_PAN_abab per Kelvin Bates' requirements
    %!               for aromatic chem.
    k0 = a0 .* exp( b0 ./ T );
    k1 = a1 .* exp( b1 ./ T );
    k0 = k0 .* M;
    kr = k0 ./ k1;
    nc = 0.75 - 1.27 .* ( log10( cf ) );
    f  = 10.0.^( log10( cf ) ./ ( 1 + ( log10( kr ) ./ nc ).^2 ) );
    k  = k0 .* k1 .* f ./ ( k0 + k1 );
  
end