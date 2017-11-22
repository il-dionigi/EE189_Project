function [h_i,score_update] = hashingSpread(I,s_,B,n)

h_i = zeros(length(I),n/B);
count = 0;
for i=I
    count = count +1;
    low = mod(ceil((i - 0.5) * n / B) + n,n);
    high = mod(ceil((i + 0.5) * n / B) + n,n);
    
    if low < high
        h_i(count,:) = mod((low:high-1)* s_,n);
    else
        h_i(count,:) = mod([0:(high-1) low:n-1]*s_,n);
    end
end

h_i = h_i(:);
score_update = hist(h_i,0:(n-1));

end