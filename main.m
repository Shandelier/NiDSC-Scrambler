function main(codeLen)
    %% DVB
    disp('Testowanie scramblingu DVB... ')
    
    %% Przygotowanie sygna³ów
    random = rand(1, codeLen);        % losowanie codeLen wartoœci z przedzia³u <0; 1>
    randomSignal = round(random);     % zamiana wartoœci losowych na zera i jedynki poprzez zaokr¹glenie
    
    zerosSignal = zeros(1, codeLen);
    
    onesSignal = ones(1, codeLen);
    
    %% Testowanie sygna³u losowego
    DVB_makeTests(randomSignal, 1);
    
    %% Testowanie sygna³u samych zer
    DVB_makeTests(zerosSignal);
    
    %% Testowanie sygna³u samych jedynek
    DVB_makeTests(onesSignal);
    
    %% Chwila przerwy
    disp('Gotowe. Wciœnij enter.')
    pause;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% V.34
    disp('Testowanie scramblingu V.34...')
    
    %% Testowanie sygna³u losowego
    mp_makeTests(randomSignal, 1);
    
    %% Testowanie sygna³u samych zer
    mp_makeTests(zerosSignal);
    
    %% Testowanie sygna³u samych jedynek
    mp_makeTests(onesSignal);
    
    %% Chwila przerwy
    disp('Gotowe. Wciœnij enter.')
    pause;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% Kana³ transmisyjny, BER
    disp('Testowanie wp³ywu kana³u transmisyjnego na dzia³anie descramblerów...')
    
    P = [0.0001 0.00015 0.0002 0.00025 0.0003 0.00035 0.0004 0.00045 0.0005];
    BERTests(randomSignal, zerosSignal, onesSignal, P);
    
    %% Koniec
    disp('Gotowe.')
    
end