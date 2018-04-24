function [x, lengths] = getLengths(signal, alignMatrices)
    %% Przebie�enie pr�bek dla znalezienia najd�u�szego ci�gu
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
    % je�liby najd�u�szy mia� by� na ko�cu sygna�u
    if alignMatrices == 1
        if maxlen < len
            maxlen = len;
        end
    end
    %% Przebie�enie pr�bek dla ustalenia ilo�ci ci�g�w o danej d�ugo�ci
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
    % je�liby ci�g ko�czy� si� na ostatnim elemencie
    if alignMatrices == 1
        if signal(i) == signal(i - 1)
            lengths(len) = lengths(len) + 1;
        end
    end
end