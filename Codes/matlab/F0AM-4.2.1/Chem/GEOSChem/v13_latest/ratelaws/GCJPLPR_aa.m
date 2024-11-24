function k =GCJPLPR_aa( M,a1, a2, fv )
%     ! Third body effect for pressure dependence of rate coefficients.
%     ! a1 is Arrhenius parameters for the lower-limit rate.
%     ! a2 is Arrhenius parameters for the upper-limit rate.
%     ! fv is the falloff curve paramter, (see ATKINSON ET. AL (1992)
%     ! J. Phys. Chem. Ref. Data 21, P. 1145). Usually fv = 0.6.
%     !
%     ! Used to compute the rate for this reaction:
%     !    Cl + PRPE {+M} = HCl + PO2 {+M}
%     !
%     ! For this reactions, these Arrhenius law terms evaluate to 1:
%     !    (300/T).^b1 * exp(c1/T)
%     !    (300/T).^b2 * exp(c2/T)
%     ! because b1 = b2 = c1 = c2 = 0.  Therefore we can skip computing
%     ! these terms.  Also, fct1 = fct2 = 0, so we will skip computing
%     ! these terms as well.  This is more computationally efficient.
%     ! (bmy, 1/25/20)

    rlow  = a1 .* M;
    xyrat = rlow ./ a2; %         ! rhigh = a2
    blog  = log10( xyrat );
    fexp  = 1.0 ./ ( 1.0 + ( blog .* blog ) );
    k     = rlow .* ( fv.^fexp ) ./ ( 1.0 + xyrat );
end
