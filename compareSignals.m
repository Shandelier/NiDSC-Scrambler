%%%     FUNKCJA PORÓWJNUJACA CIAGI BITÓW        %%%
function [signalMatches] = compareSignals(sourceSignal, scrambledSignal)
    %% Testowanie sygna³u losowego
    signalMatches = sourceSignal == scrambledSignal; %macierz logiczna posiadaj±ca 1 w miejscach gdzie tablice mia³y identyczn± warto¶æ
end