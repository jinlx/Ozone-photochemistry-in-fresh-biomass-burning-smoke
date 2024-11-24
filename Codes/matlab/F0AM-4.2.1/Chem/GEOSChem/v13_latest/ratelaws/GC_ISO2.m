function k = GC_ISO2(T, a0, b0, c0, d0, e0, f0, g0 )
    %   ! Used to compute the rate for these reactions:
    %    ISOP + OH = 0.3MCO3 + 0.3MGLY + 0.3CH2O
    %              + 0.15HPALD3 + 0.25HPALD1 + 0.4HO2
    %              + 0.6CO + 1.5OH + 0.3HPETHNL + LISOPOH
    %    ISOP + OH = 0.3CH2O + 0.15HPALD4 + 0.25HPALD2
    %              + 1.5OH + 0.9CO + 0.7HO2 + 0.3MGLY
    %              + 0.3ATOOH + LISOPOH
    %
    k0 = d0 .* exp( e0 ./ T ) .* exp( 1.0E8 ./ T.^3 );
    k1 = f0 .* exp( g0 ./ T );
    k2 = c0 .* k0 ./ ( k0 + k1 );
    k  = a0 .* exp( b0 ./ T ) .* k2;
  
end