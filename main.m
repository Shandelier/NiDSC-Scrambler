function [scrambledRandomSignal, scrambledZerosSignal, scrambledOnesSignal] = main(codeLen)
    %% Testowanie sygna�u losowego
    random = rand(1, codeLen);        % losowanie codeLen warto�ci z przedzia�u <0; 1>
    randomSignal = round(random);     % zamiana warto�ci losowych na zera i jedynki poprzez zaokr�glenie
    scrambledRandomSignal = makeTests(randomSignal, 1);
    
    %% Testowanie sygna�u samych zer
    zerosSignal = zeros(1, codeLen);
    scrambledZerosSignal = makeTests(zerosSignal);
    
    %% Testowanie sygna�u samych jedynek
    onesSignal = ones(1, codeLen);
    scrambledOnesSignal = makeTests(onesSignal);
end