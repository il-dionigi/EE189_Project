function [ bestPeriod ] = PeriodDetector( rawData )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    bestPeriod = 0;
    %try pointing to other functions:
    bestPeriod = PP5AutoCorrPeriodDetector_william(rawData);

end

