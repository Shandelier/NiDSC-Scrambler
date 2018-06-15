function BERTests_zeros(randomSignal, P, zerosToMake)
    unsyncedSignal = randomSignal;
    len_signal = length(randomSignal) - zerosToMake;
    rand_begin = randi(len_signal);
    for i = rand_begin : rand_begin + zerosToMake
        unsyncedSignal(i) = 0;
    end
    %% BER dla scramblingu DVB
    [~, y_r_dvb] = DVB_BERTest(randomSignal, P);
    [~, y_z_dvb] = DVB_BERTest(unsyncedSignal, P);
    
    %% BER dla scramblingu V.34
    [~, y_r_v34] = mp_BERTest(randomSignal, P);
    [~, y_z_v34] = mp_BERTest(unsyncedSignal, P);
    
    %% Wykresy
    P = P * 100;
    
    figure;
    subplot(1, 2, 1);
        plot(P, y_r_dvb, '-o', P, y_r_v34, '-o');
        title('BER dla sygna³u losowego');
        legend('DVB', 'V.34');
        xlabel('Prawdopodobieñstwo (procent)');
        ylabel('Iloœæ b³êdów (procent)');
    
    subplot(1, 2, 2);
        plot(P, y_z_dvb, '-o', P, y_z_v34, '-o');
        title('BER dla sygna³u losowego z b³êdem');
        legend('DVB', 'V.34');
        xlabel('Prawdopodobieñstwo (procent)');
        ylabel('Iloœæ b³êdów (procent)');
end