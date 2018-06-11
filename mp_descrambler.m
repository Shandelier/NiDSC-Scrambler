function mp_descrambled = mp_descrambler(scrambled, syncSeq)
    %% Multiplicative descrambling
    
    register = zeros(1, 23);
    mp_descrambled = zeros(1, length(scrambled));
    len_syncSeq = length(syncSeq);
    
    j = 1;
    seqCount = 0;
    for i = 1 : length(scrambled)
        if scrambled(i : i + len_syncSeq - 1) == syncSeq
            register = zeros(1, 23);
            i = i + len_syncSeq - 1;
            seqCount = seqCount + 1;
            continue;
        end
        
        t = xor(register(18), register(23));
        mp_descrambled(j) = xor(scrambled(i), t);
        
        for k = 23 : -1 : 2
            register(k) = register(k-1);
        end
        register(1) = scrambled(j);
        
        j = j + 1;
    end
    
    mp_descrambled = mp_descrambled(1 : (length(mp_descrambled) - seqCount * len_syncSeq));
end