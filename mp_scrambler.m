function mp_scrambled = mp_scrambler(rawSignal)
    %% Multiplicative scrambling
    
    register = zeros(1, 23);
%     for k = 1:23
%         register(k) = rawSignal(k);
%     end
    mp_scrambled = zeros(1, length(rawSignal));
    
    for i = 1 : length(rawSignal)
        t = xor(register(18), register(23));
        mp_scrambled(i) = xor(rawSignal(i), t);
        for j = 23 : -1 : 2
            register(j) = register(j-1);
        end
        register(1) = mp_scrambled(i);
    end
end