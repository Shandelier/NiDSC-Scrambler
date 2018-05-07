function distorted_signal = addNoise(rawSignal, probability)
    %% Function simulates transmission through a channel by adding a noise
    
    distorted_signal = zeros(1, length(rawSignal));
    
    for i = 1 : length(rawSignal)
        if rand(1) < probability
            distorted_signal(i) = ~rawSignal(i);
        else
            distorted_signal(i) = rawSignal(i);
        end
    end
end