function [ bestPeriod ] = PeriodDetector_william( rawData, useSFFT )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    %useSFFT = 0;
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
    if x == 1
        x = 2;
    end
    
%     iteratively refine what we think the fundamental harmonic is
%     weight = zeros(size(f));
%     harmonic = zeros(size(f));
%     for i = 1:numel(f)
%         weight(i) = transform(f(i)+1);
%         for j = 1:i
%             harmonic(j) = single(uint8(f(j)/x));
%         end
%         a linear regression function
%         x = lscov(transpose(harmonic(1:i)), transpose(f(1:i)), transpose(weight(1:i)));
%     end
    
    bestPeriod = l/x;
end