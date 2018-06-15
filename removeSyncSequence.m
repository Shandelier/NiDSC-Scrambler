function out_signal = removeSyncSequence(signal, syncSequence)
    len_signal = length(signal);
    len_syncSequence = length(syncSequence);
    len_out = len_signal;
    
    out_signal = zeros(1, len_signal);
    
    i = 1; j = 1;
    while i <= len_signal
        if i + len_syncSequence - 1 < len_signal
            if signal(i : i + len_syncSequence - 1) == syncSequence
                i = i + len_syncSequence;
                len_out = len_out - len_syncSequence;
            else
                out_signal(j) = signal(i);
                i = i + 1;
                j = j + 1;
            end
        else
            out_signal(j) = signal(i);
            i = i + 1;
            j = j + 1;
        end
        
    end
    
    out_signal = out_signal(1 : len_out);
end