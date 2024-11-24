function k =GC_EPO_a(M, T,a1, e1, m1 )
    %! Used to compute the rate for these reactions:
    %!    RIPA   + OH = 0.67IEPOXA   + 0.33IEPOXB   + OH + 0.005LVOC
    %!    RIPB   + OH = 0.68IEPOXA   + 0.321IEPOB   + OH + 0.005LVOC
    %!    IEPOXA + OH = 0.67IEPOXA00 + 0.33IEPOXB00
    %!    IEPOXB + OH = 0.81IEPOXA00 + 0.19IEPOXB00
    %!    IHN2   + OH = 0.67IEPOXA   + 0.33IEPOXB   + NO2
    %!    IHN3   + OH = 0.67IEPOXA   + 0.33IEPOXB   + NO2
    %!    IHN1   + OH = IEPOXD       + NO2
    %!    IHN4   + OH = IEPOXD       + NO2
    %!    INPB   + OH = OH           + ITHN
    %!    INPD   + OH = OH           + ITHN
    %!    INPD   + OH = NO2          + ICHE
    %!    ICN    + OH = NO2          + ICHE
    %!
    k1 = 1.0 ./ ( m1 .* M + 1 );
    k  = a1 * exp( e1 ./ T ) .*  k1;
  
end