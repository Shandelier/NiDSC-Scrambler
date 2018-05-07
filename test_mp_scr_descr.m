randomSignal = round(rand(1, 1000000));
scr = mp_scrambler(randomSignal);
descr = mp_descrambler(scr);

ber = 0;

for i = 1 : length(scr)
    if randomSignal(i) ~= descr(i)
        ber = ber + 1;
    end
end

disp(['Ilosc bledow: ', num2str(ber), '. BER: ', num2str(ber/length(scr) * 100), '%.'])
