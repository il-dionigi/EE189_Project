function [ bestPeriod ] = PeriodDetector_brian( rawData, useSFFT )
    bestPeriod = numel(rawData);
    rawData = rawData - mean(rawData(:));
    
    if useSFFT
        k = 4;
        l = best_length(length(rawData), k);
        transformed = 0;
        while ~transformed
            try
                transformed = 1;
                [transform, f] = SFFT(rawData(1:l), k);
            catch
                transformed = 0;
            end
        end
        transform = abs(transform);
    else
        l = length(rawData);
        transform = fft(rawData(1:l));
        transform = abs(transform);
        mx = max(transform);
        transform = transform.*(transform > 0.25*mx);
        [~, f] = findpeaks(transform);
    end

    %simple hypothesis for what the first harmonic of ther period is
    if numel(f) > 0
        f = f-1;
        x = f(1);
    else
        return
    end
    if x == 1 || x == 0
        x = 2;
    end
    
    bestPeriod = l/x;
end