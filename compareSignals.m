%%%     FUNKCJA POR�WJNUJACA CIAGI BIT�W        %%%
function [signalMatches] = compareSignals(sourceSignal, scrambledSignal)
    %% Testowanie sygna�u losowego
    signalMatches = sourceSignal == scrambledSignal; %macierz logiczna posiadaj�ca 1 w miejscach gdzie tablice mia�y identyczn� warto��
end