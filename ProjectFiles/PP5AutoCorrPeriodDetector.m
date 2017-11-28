function [m] = PP5AutoCorrPeriodDetector(Y)

% Y: input vector containing signal values
% m: output variable containing estimateed period of signal

    adjusted = Y - mean(Y);
    corr = PP5xcorr(adjusted, adjusted);
    [peaks, locs] = findpeaks(corr(2:end-1));
    indices = find(abs(peaks)>corr(1)*0.42);
    locs = locs(indices);
    peaks = peaks(indices);
    if ~isempty(locs)
        period = locs(1);
        peakVal = peaks(1);
        completedP = 1;
        for n = 2:1:length(locs)
            if locs(n) - (completedP * period) < period / 2
                period = round((locs(2)-locs(1))/2);
                peakVal = round((peaks(2) + peaks(1))/2);
                if n == 2
                    period = (locs(2) + locs(1))/2;
                    continue;
                elseif n < length(locs) - 1
                    period = ((period + (locs(n)-(period*completedP)) + ...
                        (locs(n+1)-(period*completedP)))/2);
                    completedP = completedP + 1;
                    n = n + 1;
                    continue;
                end
            end
            if abs(peakVal - peaks(n)) < 0.17 * peakVal
                proposedP = locs(n) - locs(1);
                if proposedP > period
                    period = proposedP;
                elseif proposedP < locs(1)
                    period = locs(1);
                end
                m = period;
                return;
            end
        end
        m = period;
    else
        m = length(Y);
    end
end
