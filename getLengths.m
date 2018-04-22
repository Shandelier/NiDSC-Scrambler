function [x, lengths] = getLengths(signal)
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
    
    len = 1;
    x = 1 : 1 : maxlen;
    lengths = zeros(1, maxlen);
    for i = 2 : length(signal)
        if signal(i) == signal(i - 1)
            len = len + 1;
        else
            lengths(len) = lengths(len) + 1;
            len = 1;
        end
    end
end