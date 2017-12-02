function [ bestPeriod ] = PeriodDetectorComparison( rawData, samplingRate )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    rawData = rawData(mod(1:1:length(rawData), samplingRate)==0);

    useSFFT = 1;
    bestPeriod = PeriodDetector_brian(rawData, useSFFT);
    
    bestPeriod = bestPeriod * samplingRate;
end

