function [P, errors] = DVB_BERTest(rawSignal, P)
    %% Przygotowanie danych
    if(~exist('P', 'var'))
        P = [0.0001 0.00015 0.0002 0.00025 0.0003 0.00035 0.0004 0.00045 0.0005];
    end
    
    scrambledSignal = DVB_scramble(rawSignal);
    P_len = length(P);
    errors = zeros(1, P_len);
    
    %% Testowanie dla ka¿dego p z P
    for i = 1 : P_len
        noisySignal = addNoise(scrambledSignal, P(i));
        descrambledSignal = DVB_scramble(noisySignal);
        errors(i) = sum(~compareSignals(rawSignal, descrambledSignal)); % Konieczna negacja.
    end
    
    %% Zamiana iloœci b³êdów na procent b³êdnych bitów
    errors = errors / length(rawSignal);
    errors = errors * 100;
    
end