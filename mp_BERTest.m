function [P, errors] = mp_BERTest(rawSignal, P)
    %% Przygotowanie danych
    if(~exist('P', 'var'))
        P = [0.0001 0.00015 0.0002 0.00025 0.0003 0.00035 0.0004 0.00045 0.0005];
    end
    
    syncSeq = [0 1 0 0 0 1 1 1];
    scrambledSignal = mp_scrambler(rawSignal);
    %scrambledSignalWithSyncSeq = addSyncSequence(syncSeq, 120, scrambledSignal);
    scrambledSignalWithSyncSeq = scrambledSignal;
    P_len = length(P);
    errors = zeros(1, P_len);
    
    %% Testowanie dla ka¿dego p z P
    for i = 1 : P_len
        noisySignal = addNoise(scrambledSignalWithSyncSeq, P(i));
        descrambledSignal = mp_descrambler(noisySignal, syncSeq);
        errors(i) = sum(~compareSignals(rawSignal, descrambledSignal(1:length(rawSignal)))); % Konieczna negacja.
    end
    
    %% Zamiana iloœci b³êdów na procent b³êdnych bitów
    errors = errors / length(rawSignal);
    errors = errors * 100;
    
end