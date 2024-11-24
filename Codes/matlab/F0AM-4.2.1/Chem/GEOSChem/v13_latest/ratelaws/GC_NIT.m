function k = GC_NIT(M,T,a0, b0, c0, n, x0, y0)
   % ! Used to compute the rate for these reactions:
   % !    IHOO1    + NO = IHN2
   % !    IHOO4    + NO = IHN4
   % !    IHPOO1   + NO = IHTN
   % !    IHPOO2   + NO = IHTN
   % !    IHPOO2   + NO = IHTN
   % !    IEPOXAOO + NO = IHTN
   % !    IEPOXBOO + NO = IHTN
   % !    IHCOO    + NO = IHTN
   % !    ISOPNOO1 + NO = IDN
   % !    ISOPNOO2 + NO = IDN
   % !    IDHNDOO1 + NO = IDN
    %!    IDHNDOO2 + NO = IDN
    %!    INO2B    + NO = IDN
    %!    INO2D    + NO = IDN
    %!    IHPNBOO  + NO = IDN
    %!    IHPNDOO  + NO = IDN
    %!    MVK0HOO  + NO = 0.438MVKN
    %!    MCROHOO  + NO = MCRHN
    %!
    
    k0 = 2.0E-22 .* exp( n );
    k1 = 4.3E-1 .* ( T ./ 298.0 ).^(-8);
    k0 = k0 .* M;
    k1 = k0 ./ k1;
    k2 = ( k0 ./ ( 1.0 + k1 ) ) .* 4.1E-1.^( 1.0 ./ ( 1.0 + ( log10(k1) ).^2) );
    k3 = k2 ./ ( k2 + c0 );
    k4 = a0 .* ( x0 - T.*y0 );
    k  = k4 .* exp( b0 ./ T ) .* k3;
    %k  = max( [k, 0.0] );

  
end

