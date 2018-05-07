function mp_scrambled = mp_scrambler(input)
    %% Multiplicative scrambling
    
    register = zeros(1, 23);
    mp_scrambled = zeros(1, length(input));
    
    for i = 1 : length(input)
        t = xor(register(18), register(23));
        mp_scrambled(i) = xor(input(i), t);
        for j = 2 : 23
            register(j) = register(j-1);
        end
        register(1) = mp_scrambled(i);
    end
end