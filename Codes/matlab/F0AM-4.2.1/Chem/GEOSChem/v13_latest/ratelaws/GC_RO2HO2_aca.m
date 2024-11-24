function k = GC_RO2HO2_aca(T,a0, c0, a1)
%     ! Carbon Dependence of RO2+HO2, used in these reactions:
%     !    A3O2 + HO2 = RA3P
%     !    PO2  + HO2 = PP
%     !    KO2  + HO2 = 0.150OH + 0.150ALD2 + 0.150MCO3 + 0.850ATOOH
%     !    B3O2 + HO2 = RB3P
%     !    PRN1 + HO2 = PRPN
%     !
%     ! For these reactions, these Arrhenius law terms evaluate to 1:
%     !    (300/T)**b0
%     !    (300/T)**b1 * EXP(c1/T)
%     ! Because b0 = b1 = c1 = 0.  Therefore we can skip computing these
%     ! terms.  This avoids excess CPU cycles. (bmy, 12/18/20)
    
    k = a0 .* exp( c0 ./ T );
    k = k .* ( 1.0 - exp( -0.245 .* a1 ) );
end

