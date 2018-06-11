function  detectSyncSeq(sequence, async_signal)
syncSeq = sequence;
seqLenght = length(sequence);
i = 1;
j = 1;
while(j <= length(async_signal))
    if syncSeq(i) == async_signal(j)
        i=i+1;
        if i == seqLenght
            i = 1;
            resetDesc();
        end
    else 
        i=0;
    end
    j = j + 1;
end

