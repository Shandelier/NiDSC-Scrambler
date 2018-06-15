function BERTests_desynced(randomSignal, zerosSignal, onesSignal, P, frequency, syncSeq)
    %% BER dla scramblingu DVB
    [~, y_r_dvb] = DVB_BERTest_desync(randomSignal, P, frequency, syncSeq);
    [~, y_z_dvb] = DVB_BERTest_desync(zerosSignal, P, frequency, syncSeq);
    [~, y_o_dvb] = DVB_BERTest_desync(onesSignal, P, frequency, syncSeq);
    
    %% BER dla scramblingu V.34
    [~, y_r_v34] = mp_BERTest_desync(randomSignal, P, frequency, syncSeq);
    [~, y_z_v34] = mp_BERTest_desync(zerosSignal, P, frequency, syncSeq);
    [~, y_o_v34] = mp_BERTest_desync(onesSignal, P, frequency, syncSeq);
    
    %% Wykresy
    P = P * 100;
    
    figure;
    subplot(1, 3, 1);
        plot(P, y_r_dvb, '-o', P, y_r_v34, '-o');
        title('BER dla sygna�u losowego');
        legend('DVB', 'V.34');
        xlabel('Prawdopodobie�stwo (procent)');
        ylabel('Ilo�� b��d�w (procent)');
    
    subplot(1, 3, 2);
        plot(P, y_z_dvb, '-o', P, y_z_v34, '-o');
        title('BER dla sygna�u zer');
        legend('DVB', 'V.34');
        xlabel('Prawdopodobie�stwo (procent)');
        ylabel('Ilo�� b��d�w (procent)');
    
    subplot(1, 3, 3);
        plot(P, y_o_dvb, '-o', P, y_o_v34, '-o');
        title('BER dla sygna�u jedynek');
        legend('DVB', 'V.34');
        xlabel('Prawdopodobie�stwo (procent)');
        ylabel('Ilo�� b��d�w (procent)');
end