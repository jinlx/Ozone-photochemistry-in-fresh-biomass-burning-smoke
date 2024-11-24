function k = ARRPLUS_abde(T, a0, b0, d0, e0)
    % ! Modified Arrhenius law, skipping computation of ( T/300 )**c0,
    %! which evaluates to 1 when c0=0.  This avoids excess CPU cycles.
    %! (bmy, 12/18/20)
    %!
    %! Used to compute the rate for these reactions:
    %!    IHOO1 + HO2 = 0.063MVK + 0.063OH + 0.063HO2 + 0.063CH2O + 0.937RIPA
    %!    IHOO1 + HO2 = RIPC
    %!    IHOO4 + HO2 = 0.063MACR + 0.063OH + 0.063HO2 + 0.063CH2O + 0.937RIPB
    %!    IHOO4 + HO2 = RIPD
    %!    IHOO1       = CH2O + OH + MVK
    %!    IHOO4       = MACR + OH + CH2O
    %!
    
    k = a0 .* ( d0 + ( T .* e0 ) ) .* exp( -b0 ./ T );
    %k = max( [k, 0.0] );
  
end