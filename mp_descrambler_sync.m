function mp_descrambled = mp_descrambler_sync(scrambled, syncSeq)
    %% Multiplicative descrambling
    
    register = zeros(1, 23);
    mp_descrambled = zeros(1, length(scrambled));
    
    j = 1;
    scrambled = removeSyncSequence(scrambled, syncSeq);
    
    for i = 1 : length(scrambled)
        t = xor(register(18), register(23));
        mp_descrambled(j) = xor(scrambled(i), t);
        
        for k = 23 : -1 : 2
            register(k) = register(k-1);
        end
        register(1) = scrambled(j);
        
        j = j + 1;
    end
end