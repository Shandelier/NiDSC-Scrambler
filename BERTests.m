function BERTests(randomSignal, zerosSignal, onesSignal, P)
    %% BER dla scramblingu DVB
    [~, y_r_dvb] = DVB_BERTest(randomSignal, P);
    [~, y_z_dvb] = DVB_BERTest(zerosSignal, P);
    [~, y_o_dvb] = DVB_BERTest(onesSignal, P);
    
    %% BER dla scramblingu V.67
    [~, y_r_v67] = mp_BERTest(randomSignal, P);
    [~, y_z_v67] = mp_BERTest(zerosSignal, P);
    [~, y_o_v67] = mp_BERTest(onesSignal, P);
    
    %% Wykresy
    P = P * 100;
    
    figure;
    subplot(1, 3, 1);
        plot(P, y_r_dvb, '-o', P, y_r_v67, '-o');
        title('BER dla sygna�u losowego');
        legend('DVB', 'V.34');
        xlabel('Prawdopodobie�stwo (procent)');
        ylabel('Ilo�� b��d�w (procent)');
    
    subplot(1, 3, 2);
        plot(P, y_z_dvb, '-o', P, y_z_v67, '-o');
        title('BER dla sygna�u zer');
        legend('DVB', 'V.34');
        xlabel('Prawdopodobie�stwo (procent)');
        ylabel('Ilo�� b��d�w (procent)');
    
    subplot(1, 3, 3);
        plot(P, y_o_dvb, '-o', P, y_o_v67, '-o');
        title('BER dla sygna�u jedynek');
        legend('DVB', 'V.34');
        xlabel('Prawdopodobie�stwo (procent)');
        ylabel('Ilo�� b��d�w (procent)');
end