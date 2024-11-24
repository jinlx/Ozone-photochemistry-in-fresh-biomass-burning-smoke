 function k = GCJPLPR_abcabc(M, T, a1, b1, c1, a2, b2, c2, fv )
%     ! Third body effect for pressure dependence of rate coefficients.
%     ! a1, b1, c1 are the Arrhenius parameters for the lower-limit rate.
%     ! a2, b2, c2 are the Arrhenius parameters for the upper-limit rate.
%     ! fv         is the falloff curve paramter, (see ATKINSON ET. AL (1992)
%     !           J. Phys. Chem. Ref. Data 21, P. 1145). Usually fv = 0.6.
%     !
%     ! Used to compute the rate for these reactions:
%     !    HNO4 {+M} = HO2 + NO2
%     !    N2O5 {+M} = NO2 + NO3
%     !    MPN  {+M} = MO2 + NO2
%     !
    rlow  = a1 .* ( (300./T).^b1 ) .* exp( c1 ./T ) .* M;
    rhigh = a2 .* ( (300./T).^b2 ) .* exp( c2 ./T );
    xyrat = rlow ./ rhigh;
    blog  = log10( xyrat );
    fexp  = 1.0 ./ ( 1.0 + ( blog .* blog ) );
    k     = rlow .* ( fv.^fexp ) ./ ( 1.0 + xyrat );
 end