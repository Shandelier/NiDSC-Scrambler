%%%     FUNKCJA WYKONUJACA PODWOJNY SCRAMBLING I OBLICZAJACA BER        %%%
function [] = doubleScramTest(codeLen)
    %% Testowanie sygna�u losowego
    random = rand(1, codeLen);        % losowanie codeLen warto�ci z przedzia�u <0; 1>
    randomSignal = round(random);     % zamiana warto�ci losowych na zera i jedynki poprzez zaokr�glenie
    scrambledRandomSignal = makeTests(randomSignal, 1);
    scrambledRandomSignal = makeTests(scrambledRandomSignal, 1); %ponowny scrambling dla cel�w eksperymentalnych
    
    %% Obliczanie BER (bledne bity / ilosc bitow)
    matchesArray = compareSignals(randomSignal, scrambledRandomSignal);
    matchingBits = sum(matchesArray(:) == 1);
    lenghtOfArray = size(randomSignal);
    BER = matchingBits./lenghtOfArray;
end