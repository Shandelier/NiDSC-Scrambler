function [descrambledSignal] = DVB_descramble(scrambledSignal)
    %% Descrambling sygna³u
    
    descrambledSignal = zeros(1, length(scrambledSignal));
    syncCode = resetSYNC();
    
    j = 1;
    for i = 1 : length(scrambledSignal)
            t = xor(syncCode(14), syncCode(15));
            syncCode = moveRight(syncCode, t);
            descrambledSignal(j) = xor(scrambledSignal(i), t);

            if mod(i, 32) == 0
                syncCode = resetSYNC();
            end

            j = j + 1;
    end
end