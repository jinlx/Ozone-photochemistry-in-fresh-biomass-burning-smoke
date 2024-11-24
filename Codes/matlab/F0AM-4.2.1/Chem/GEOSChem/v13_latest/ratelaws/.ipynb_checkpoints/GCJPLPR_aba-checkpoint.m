function k =GCJPLPR_aba(M, T, a1, b1, a2, fv ) 
%     ! Third body effect for pressure dependence of rate coefficients.
%     ! a1, b1 are the Arrhenius parameters for the lower-limit rate.
%     ! a2     is  the Arrhenius parameters for the upper-limit rate.
%     ! fv     is the falloff curve paramter, (see ATKINSON ET. AL (1992)
%     !        J. Phys. Chem. Ref. Data 21, P. 1145). Usually fv = 0.6.
%     !
%     ! Used to compute the rate for these reactions:
%     !    OH  + OH  {+M} = H2O2
%     !    NO2 + OH  {+M} = HNO3       {+M}
%     !    Cl  + O2  {+M} = ClOO       {+M}
%     !    SO2 + OH  {+M} = SO4  + HO2
%     !    Br  + NO2 {+M} = BrNO2      {+M}
%     !    NO  + O   {+M} = NO2        {+M}
%     !    I   + NO2 {+M} = IONO       {+M}
%     !    I   + NO  {+M} = INO        {+M}
%     !
%     ! For these reactions, these Arrhenius law terms evaluate to 1:
%     !    EXP(c1/T)
%     !    (300/T).^b2 .* EXP(c2/T)
%     ! because b2 = c1 = c2 = 0.  Therefore we can skip computing these
%     ! terms.  Also, fct1 = fct2 = 0, so we will skip computing these
%     ! terms as well.  This is more computationally efficient.
%     ! (bmy, 1/25/20)
% 
%     !
    rlow  = a1 .* ( (300./T).^b1 ) .* M;
    xyrat = rlow ./ a2 ;          %                     ! rhigh = a2
    blog  = log10( xyrat );
    fexp  = 1.0 ./ ( 1.0 + ( blog .* blog ) );
    k     = rlow .* ( fv.^fexp ) ./ ( 1.0 + xyrat );
end

