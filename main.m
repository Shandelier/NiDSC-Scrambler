function [scrambledRandomSignal, scrambledZerosSignal, scrambledOnesSignal] = main(codeLen)
    %% Testowanie sygna³u losowego
    random = rand(1, codeLen);        % losowanie codeLen wartoœci z przedzia³u <0; 1>
    randomSignal = round(random);     % zamiana wartoœci losowych na zera i jedynki poprzez zaokr¹glenie
    scrambledRandomSignal = makeTests(randomSignal, 1);
    
    %% Testowanie sygna³u samych zer
    zerosSignal = zeros(1, codeLen);
    scrambledZerosSignal = makeTests(zerosSignal);
    
    %% Testowanie sygna³u samych jedynek
    onesSignal = ones(1, codeLen);
    scrambledOnesSignal = makeTests(onesSignal);
end