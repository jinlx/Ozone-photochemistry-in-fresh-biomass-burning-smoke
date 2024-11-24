function k= GCJPLEQ_acabab( M, T, a0, c0, a1, b1, a2, b2, fv )
%     ! Calculates the equilibrium constant
%     ! Find the backwards reaction by K=kforward/kbackwards
%     ! Calculates the rate constant of the forward reaction
%     !
%     ! Used to compute the rate for these reactions:
%     !    PPN        = RCO3 + NO2
%     !    PAN        = MCO3 + NO2
%     !    ClOO  {+M} = Cl   + O2 {+M}
%     !    Cl2O2 {+M} = 2ClO      {+M}
%     !
%     ! For these reactions, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0
%     !    exp(c1/T)
%     !    exp(c2/T)
%     ! because b0 = c1 = c2 = 0.  Therefore we can skip computing these terms.
%     ! Also, fct1 = fct2 = 0, so we will skip those terms as well.  This is
%     ! more computationally efficient. (bmy, 1/25/20)
%     !

    k0 = a0 * exp( c0 ./ T )        ;      % ! backwards rxn rate
    k1 = GCJPLPR_abab( M, T, a1, b1, a2, b2, fv ) ; %! forwards rxn rate
    k  = k1 ./ k0;
end

