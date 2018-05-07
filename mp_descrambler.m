function mp_descrambled = mp_descrambler(scrambled)
    %% Multiplicative descrambling
    
    register = zeros(1, 23);
    mp_descrambled = zeros(1, length(scrambled));
    
    for i = 1 : length(scrambled)
        register(1) = scrambled(i);
        for j = 23 : -1 : 2
            register(j) = register(j-1);
        end
        t = xor(register(18), register(23));
        mp_descrambled(i) = xor(scrambled(i), t);
    end    
end