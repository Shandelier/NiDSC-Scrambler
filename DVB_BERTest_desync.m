function [P, errors] = DVB_BERTest_desync(rawSignal, P, frequency, syncSeq)
    %% Przygotowanie danych
    if(~exist('P', 'var'))
        P = [0.0001 0.00015 0.0002 0.00025 0.0003 0.00035 0.0004 0.00045 0.0005];
    end
    
    scrambledSignal = DVB_scramble(rawSignal);
    scrambledSignalWithSyncSeq = addSyncSequence(syncSeq, frequency, scrambledSignal);
    P_len = length(P);
    errors = zeros(1, P_len);
    
    %% Testowanie dla ka¿dego p z P
    for i = 1 : P_len
        noisySignal = addNoise(scrambledSignalWithSyncSeq, P(i));
        descrambledSignal = DVB_descramble_sync(noisySignal, syncSeq);
        errors(i) = sum(~compareSignals(rawSignal, descrambledSignal(1:length(rawSignal)))); % Konieczna negacja.
    end
    
    %% Zamiana iloœci b³êdów na procent b³êdnych bitów
    errors = errors / length(rawSignal);
    errors = errors * 100;
    
end