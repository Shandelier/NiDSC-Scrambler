function signalMatches = compareSignals(sourceSignal, scrambledSignal)
    %% Por�wnanie dw�ch sygna��w
    % Macierz signalMatches b�dzie posiada� 1 tam, gdzie sygna�y s� zgodne.
    signalMatches = sourceSignal == scrambledSignal;
end