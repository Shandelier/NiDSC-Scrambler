function descrambledSignal = DVB_descramble(scrambledSignal, syncSeq)
    %% Descrambling sygna³u
    
    descrambledSignal = zeros(1, length(scrambledSignal));
    syncCode = resetSYNC();
    len_syncSeq = length(syncSeq);
    
    j = 1;
    seqCount = 0;
    for i = 1 : length(scrambledSignal)
        if scrambledSignal(i : i + len_syncSeq - 1) == syncSeq
            syncCode = resetSYNC();
            i = i + len_syncSeq - 1;
            seqCount = seqCount + 1;
            continue;
        end
        
        t = xor(syncCode(14), syncCode(15));
        syncCode = moveRight(syncCode, t);
        descrambledSignal(j) = xor(scrambledSignal(i), t);
        
        if mod(i, 32) == 0
            syncCode = resetSYNC();
        end
        
        j = j + 1;
    end
    
    descrambledSignal = descrambledSignal(1 : (length(descrambledSignal) - seqCount * len_syncSeq));
end