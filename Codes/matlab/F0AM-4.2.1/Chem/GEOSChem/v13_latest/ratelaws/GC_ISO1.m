function k = GC_ISO1(T, a0, b0, c0, d0, e0, f0, g0 )
    %! Used to compute the rate for these reactions:
    %!    ISOP + OH = LISOPOH + IHOO1
    %!    ISOP + OH = LISOPOH + IHOO4
    
    k0 = d0 .* exp( e0 ./ T ) .* exp( 1.0E8 ./ T.^3 );
    k1 = f0 .* exp( g0 ./ T );
    k2 = c0 .* k0 ./ ( k0 + k1 );
    k  = a0 .* exp( b0 ./ T ) .* ( 1.0 - k2 );
  
end