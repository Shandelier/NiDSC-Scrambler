function distorted_signal = addNoise(rawSignal)
    %% Function simulates transmission through a channel by adding a noise
    
    noise = randn(1, size(rawSignal, 2));
    distorted_signal = zeros(1, length(rawSignal));
    
    for i = 1 : length(rawSignal)
        if(noise(i) > 1.6) || (noise(i) < -1.6)
            distorted_signal(i) = ~rawSignal(i);
        else
            distorted_signal(i) = rawSignal(i);
        end
    end
end