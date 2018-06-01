function sync_signal = addSyncSequence(sequence, freq, async_signal)
    i = freq;
    sync_signal = async_signal;
    while i < length(sync_signal)
        sync_signal = [sync_signal(1:i-1), sequence, sync_signal(i:end)];
        i = i + freq+1;
    end
end