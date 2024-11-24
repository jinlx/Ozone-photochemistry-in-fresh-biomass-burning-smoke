function k = GC_GLYXNO3_ac(M, T, a0, c0 )
%     ! Reaction rate for:
%     !    GLYX + NO3 = HNO3 + HO2 + 2CO
%     !    i.e. the HO2 + 2*CO branch
%     !
%     ! For this reaction, this Arrhenius term evaluates to 1:
%     !    (300/T)**b0
%     ! because b0 = 0.  Therefore we can skip computing this
%     ! term.  This avoids excess CPU cycles. (bmy, 12/18/20)
%     !
%    ! ---  K = K1*([O2]+3.5D18)/(2*[O2]+3.5D18)
    O2 = M .* 0.2095;
    k  = a0 .* exp( c0 ./ T );
    k   = k .* ( O2 + 3.5E+18 ) ./ ( 2.0 .* O2 + 3.5E+18 );
end

