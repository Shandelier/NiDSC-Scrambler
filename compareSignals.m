function signalMatches = compareSignals(sourceSignal, scrambledSignal)
    %% Porównanie dwóch sygna³ów
    % Macierz signalMatches bêdzie posiadaæ 1 tam, gdzie sygna³y s¹ zgodne.
    signalMatches = sourceSignal == scrambledSignal;
end