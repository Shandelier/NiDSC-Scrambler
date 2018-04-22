function [random, rawSignal, scrambledSignal] = main(codeLen)
    random = rand(1, codeLen);        % losowanie codeLen wartoœci z przedzia³u <0; 1>
    rawSignal = round(random);             % zamiana wartoœci losowych na zera i jedynki
    %key = resetSYNC();              % ustalenie pocz¹tkowego kodu
    scrambledSignal = scramble(rawSignal);
    
    differences = zeros(1, length(scrambledSignal));
    for i = 1 : length(scrambledSignal)
        differences(i) = xor(rawSignal(i), scrambledSignal(i));
        if differences(i) == 1
            differences(i) = -0.25;
        else
            differences(i) = 1.25;
        end
    end
    
    [~, lengths0] = getLengths(rawSignal);
    [~, lengths1] = getLengths(scrambledSignal);
    if length(lengths0) < length(lengths1)
        for i = length(lengths0) + 1 : 1 : length(lengths1)
            lengths0(i) = 0;
        end
    end
    if length(lengths1) < length(lengths0)
        for i = length(lengths1) + 1 : 1 : length(lengths0)
            lengths1(i) = 0;
        end
    end
    
    
    y = [lengths0', lengths1'];
    
    figure;
        subplot(2, 1, 1);
        ylim([-0.5 1.5]); 
        hold on;
            plot(rawSignal, 'r.'); 
            plot(scrambledSignal, 'g'); 
            plot(differences, 'b.');
            title('Sygna³y przed i po scramblingu; wskazanie ró¿nic');
        hold off;
    
        subplot(2, 1, 2);
        bar(y);
        hold on;
            text(1 : length(lengths0), lengths0, num2str(lengths0'), 'vert', 'bottom', 'horiz', 'right');
            text(1 : length(lengths1), lengths1, num2str(lengths1'), 'vert', 'bottom', 'horiz', 'left');
            legend('Sygnal przed scramblingiem', 'Sygnal po scramblingu');
            title('D³ugoœci ci¹gów');
        hold off;
end