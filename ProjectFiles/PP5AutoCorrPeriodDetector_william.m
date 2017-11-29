function [m] = PP5AutoCorrPeriodDetector(Y)

%%% PLEASE FILL THIS CODE WITH YOUR IMPLEMENTATION %%%

% Y: input vector containing signal values
% m: output variable containing estimateed period of signal
avg = 0;
count = 0;
Y=Y-mean(Y);

corr=PP5xcorr(Y(1:floor(end/2)), Y);
plot(corr);
trigger=0;
for i = 2:numel(Y)-1
    if corr(i) < 0
        trigger = 1;
    end
    if corr(i) > corr(i+1) && corr(i) > corr(i-1) && trigger == 1 && corr(i) > 0.8*corr(1)
        m = i-1;
        return;
    end
end
m = numel(Y);
end
