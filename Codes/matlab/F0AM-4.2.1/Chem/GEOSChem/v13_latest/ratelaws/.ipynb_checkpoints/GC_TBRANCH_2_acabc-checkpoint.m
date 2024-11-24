function k = GC_TBRANCH_2_acabc(T,a0, c0, a1, b1, c1)
%     ! Temperature Dependent Branching Ratio, used for reactions:
%     !    C3H8 + OH = B3O2
%     !    C3H8 + OH = A3O2
%     !
%     ! For these reactions, this Arrhenius law term evaluates to 1:
%     !    (300/T)**b0
%     ! because b0 = 0.  Therefore we can skip computing this
%     ! term.  This avoids excess CPU cycles. (bmy, 12/18/20)
%     !    !
    k0 = a0 .* exp( c0 ./ T );
    k1 = a1 .* exp( c1 ./ T ) .* (300./T).^b1;
    k  = k0 ./ ( 1.0 + k1 );
end