function k = GCARR_abc( T,a0, b0, c0 )

    k = a0 .* exp( c0 ./ T ) .* (300./T).^b0;

end

