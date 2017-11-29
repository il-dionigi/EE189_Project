function [C] = PP5xcorr(x,y)

%%% PLEASE FILL THIS CODE WITH YOUR IMPLEMENTATION %%%

% x,y: input vectors containing signal values for the two input signals
% C: output vector containing the circular cross-correlation of the two
% vectors x,y
    %pad the shorter list with zeros
    sizeDiff = numel(x) - numel(y);
    if sizeDiff > 0
        y(end+1:end+sizeDiff) = 0;
    elseif sizeDiff < 0
        x(end+1:end-sizeDiff) = 0;
    end
    C = zeros(size(x));
    N=numel(x);
    for i = 0:N-1
        yShift(1:N-i) = y(i+1:N);
        yShift(N-i+1:N) = y(1:i);
        mult = yShift.*x;
        C(i+1) = sum(mult);
    end

end
