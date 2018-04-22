function scrambledSignal = scramble(rawSignal)
    scrambledSignal = rawSignal;
    syncCode = resetSYNC();
    for i = 1 : length(scrambledSignal)
        t = xor(syncCode(14), syncCode(15));
        syncCode = moveRight(syncCode, t);
        scrambledSignal(i) = xor(scrambledSignal(i), t);
    end
end