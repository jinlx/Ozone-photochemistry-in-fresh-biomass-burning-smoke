function k = TUNPLUS_abcde(T, a0, b0, c0, d0, e0 )
    %! Used to compute the rate for these reactions:
    %!    IHOO1 = 1.5OH + ...
    %!    IHOO4 = 1.5OH + ...
    %!
    k = a0 .* ( d0 + ( T.* e0 ) );
    k = k .* exp( b0 ./ T ) .* exp( c0 ./ T.^3 );
    %k = max( [k, 0] );
  
end