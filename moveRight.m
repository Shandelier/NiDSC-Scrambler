function movedSYNC = moveRight(SYNC, xorOutput)
    movedSYNC = SYNC;
    for i = 15 : -1 : 2
        movedSYNC(i) = movedSYNC(i - 1);
    end
    movedSYNC(1) = xorOutput;
end
