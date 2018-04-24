function [x, lengths] = getLengths(signal, alignMatrices)
    %% Przebie¿enie próbek dla znalezienia najd³u¿szego ci¹gu
    maxlen = 0;
    len = 1;
    for i = 2 : length(signal)
        if signal(i) == signal(i - 1)
            len = len + 1;
        else
            if maxlen < len
                maxlen = len;
            end
            len = 1;
        end
    end
    % jeœliby najd³u¿szy mia³ byæ na koñcu sygna³u
    if alignMatrices == 1
        if maxlen < len
            maxlen = len;
        end
    end
    %% Przebie¿enie próbek dla ustalenia iloœci ci¹gów o danej d³ugoœci
    len = 1;
    x = 1 : maxlen;
    lengths = zeros(1, maxlen);
    for i = 2 : length(signal)
        if signal(i) == signal(i - 1)
            len = len + 1;
        else
            lengths(len) = lengths(len) + 1;
            len = 1;
        end
    end
    % jeœliby ci¹g koñczy³ siê na ostatnim elemencie
    if alignMatrices == 1
        if signal(i) == signal(i - 1)
            lengths(len) = lengths(len) + 1;
        end
    end
end