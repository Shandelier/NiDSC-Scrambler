%%%     FUNKCJA WYKONUJACA PODWOJNY SCRAMBLING I OBLICZAJACA BER        %%%
function [] = doubleScramTest(codeLen)
    %% Testowanie sygna³u losowego
    random = rand(1, codeLen);        % losowanie codeLen wartoœci z przedzia³u <0; 1>
    randomSignal = round(random);     % zamiana wartoœci losowych na zera i jedynki poprzez zaokr¹glenie
    scrambledRandomSignal = makeTests(randomSignal, 1);
    scrambledRandomSignal = makeTests(scrambledRandomSignal, 1); %ponowny scrambling dla celów eksperymentalnych
    
    %% Obliczanie BER (bledne bity / ilosc bitow)
    matchesArray = compareSignals(randomSignal, scrambledRandomSignal);
    matchingBits = sum(matchesArray(:) == 1);
    lenghtOfArray = size(randomSignal);
    BER = matchingBits./lenghtOfArray;
end