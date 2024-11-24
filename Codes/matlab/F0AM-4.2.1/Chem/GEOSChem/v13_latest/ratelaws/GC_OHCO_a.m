function k = GC_OHCO_a(M, T, a0)

%      ! Reaction rate for:
%     !    OH + CO = HO2 + CO2 (cf. JPL 15-10)
%     !
%     ! For this reaction, these Arrhenius law terms evaluate to 1:
%     !    (300/T).^b0 .* EXP(c0/T)
%     ! because b0 = c0 = 0.  Therefore we can skip computing these
%     ! terms.  This avoids excess CPU cycles. (bmy, 12/18/20)
%     !
    klo1   = 5.9E-33 .* (300./T);
    khi1   = 1.1E-12 .* (300./T).^(-1.3);
    xyrat1 = klo1 .* M ./ khi1;
    blog1  = log10( xyrat1 );
    fexp1  = 1.0 ./ ( 1.0 + blog1.*blog1 );
    kco1   = klo1 .* M .* 0.6.^fexp1 ./ ( 1.0 + xyrat1 );
    klo2   = 1.5E-13;
    khi2   = 2.1E+09 .* (300./T).^(-6.1);
    xyrat2 = klo2 .* M ./ khi2;
    blog2  = log10( xyrat2 );
    fexp2  = 1.0 ./ ( 1.0 + blog2.*blog2 );
    kco2   = klo2 .* 0.6.^fexp2 ./ ( 1.0 + xyrat2 );
    k      = kco1 + kco2;

end

