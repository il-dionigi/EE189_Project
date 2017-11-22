function l = best_length(signalLength, k)
%BEST_LENGTH Summary of this function goes here
%   Detailed explanation goes here
    %signalLength is the maximum length of the signal.
    %k is the 
    B = b(signalLength, k);
    l = signalLength;
    while (floor(l/B) ~= l/B)
        l = B*floor(l/B);
        if l < 1
            return
        end
        B = b(l, k);
    end
end
function B = b(n, k)
    d = 2;
    B = floor(4*sqrt(n*k/log2(n)));
    B = 2^floor(log2(B));
    while (B <= d*k)
        B = B*2;
    end
end

