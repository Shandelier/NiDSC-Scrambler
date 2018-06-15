function [descrambledSignal, seqCount] = DVB_descramble_sync(scrambledSignal, syncSeq)
    %% Descrambling sygna³u z bitami synchronizacji
    
    descrambledSignal = zeros(1, length(scrambledSignal));
    syncCode = resetSYNC();
    
    j = 1;
    seqCount = 0;
    %while i < len_scrambledSignal
    scrambledSignal = removeSyncSequence(scrambledSignal, syncSeq);
    for i = 1 : length(scrambledSignal)
        %% Descrambling
        t = xor(syncCode(14), syncCode(15));
        syncCode = moveRight(syncCode, t);
        descrambledSignal(j) = xor(scrambledSignal(i), t);

        if mod(j, 32) == 0
            syncCode = resetSYNC();
        end

        j = j + 1;
    end
   
    %descrambledSignal = descrambledSignal(1 : (len_scrambledSignal - seqCount * len_syncSeq +  1));
end