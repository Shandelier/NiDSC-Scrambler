function mp_descrambled = mp_descrambler(scrambled)
    %% Multiplicative descrambling
    
    register = zeros(1, 23);
    mp_descrambled = zeros(1, length(scrambled));
    
    for i = 1 : length(scrambled)
        t = xor(register(18), register(23));
        mp_descrambled(i) = xor(scrambled(i), t);
        
        for j = 23 : -1 : 2
            register(j) = register(j-1);
        end
        register(1) = scrambled(i);
    end    
end