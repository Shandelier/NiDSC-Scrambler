function main(codeLen)
    %% DVB
    disp('Testowanie scramblingu DVB... ')
    
    %% Przygotowanie sygna��w
    random = rand(1, codeLen);        % losowanie codeLen warto�ci z przedzia�u <0; 1>
    randomSignal = round(random);     % zamiana warto�ci losowych na zera i jedynki poprzez zaokr�glenie
    
    zerosSignal = zeros(1, codeLen);
    
    onesSignal = ones(1, codeLen);
    
    %% Testowanie sygna�u losowego
    DVB_makeTests(randomSignal, 1);
    
    %% Testowanie sygna�u samych zer
    DVB_makeTests(zerosSignal);
    
    %% Testowanie sygna�u samych jedynek
    DVB_makeTests(onesSignal);
    
    %% Chwila przerwy
    disp('Gotowe. Wci�nij enter.')
    pause;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% V.34
    disp('Testowanie scramblingu V.34...')
    
    %% Testowanie sygna�u losowego
    mp_makeTests(randomSignal, 1);
    
    %% Testowanie sygna�u samych zer
    mp_makeTests(zerosSignal);
    
    %% Testowanie sygna�u samych jedynek
    mp_makeTests(onesSignal);
    
    %% Chwila przerwy
    disp('Gotowe. Wci�nij enter.')
    pause;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% Kana� transmisyjny, BER
    disp('Testowanie wp�ywu kana�u transmisyjnego na dzia�anie descrambler�w...')
    
    P = [0.0001 0.00015 0.0002 0.00025 0.0003 0.00035 0.0004 0.00045 0.0005];
    BERTests(randomSignal, zerosSignal, onesSignal, P);
    
    %% Koniec
    disp('Gotowe.')
    
end