function scrambledSignal = DVB_makeTests(rawSignal, alignMatrices)
    if ~exist('alignMatrices', 'var')
        alignMatrices = 0;
    end

    %% Wykonanie scramblingu
    scrambledSignal = DVB_scramble(rawSignal);
    
    %% Znalezienie r�nic mi�dzy sygna�em przed i po scramblingu
    % R�nice zostan� ukazane jako punkty pod wykresem (na prostej y = -0.25)
    % Te same warto�ci zostan� ukazane jako punkty nad wykresem (na prostej y = 1.25).
    differences = zeros(1, length(scrambledSignal));
    for i = 1 : length(scrambledSignal)
        differences(i) = xor(rawSignal(i), scrambledSignal(i));
        if differences(i) == 1
            differences(i) = -0.25;
        else
            differences(i) = 5; % Aby usun�� punkt z wykresu.
        end
    end
    
    %% Szukanie ilo�ci ci�g�w o danej d�ugo�ci
    [~, lengths0] = getLengths(rawSignal, alignMatrices);
    [~, lengths1] = getLengths(scrambledSignal, alignMatrices);
    
    %% Wyr�wnanie macierzy powy�ej dla celu rysowania wykresu
    if length(lengths0) < length(lengths1)
        for i = length(lengths0) + 1 : 1 : length(lengths1)
            lengths0(i) = 0;
        end
    end
    
    if alignMatrices == 1 && length(lengths1) < length(lengths0)
        for i = length(lengths1) + 1 : 1 : length(lengths0)
            lengths1(i) = 0;
        end
    end
    
    %% Rysowanie wykresu
    y = [lengths0', lengths1'];
    
    figure;
        subplot(2, 1, 1);
        ylim([-0.5 1.5]); 
        hold on;
            plot(rawSignal, 'r.'); 
            stairs(scrambledSignal, 'g'); 
            plot(differences, 'b.');
            title('Sygna�y przed i po scramblingu DVB; wskazanie r�nic');
        hold off;
        
        subplot(2, 1, 2);
        bar(y);
        hold on;
            text(1 : length(lengths0), lengths0, num2str(lengths0'), 'vert', 'bottom', 'horiz', 'right');
            text(1 : length(lengths1), lengths1, num2str(lengths1'), 'vert', 'bottom', 'horiz', 'left');
            legend('Sygna� przed scramblingiem', 'Sygna� po scramblingu');
            title('D�ugo�ci ci�g�w');
        hold off;