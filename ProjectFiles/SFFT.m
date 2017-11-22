function [x_estimate,best_freq] = SFFT(x,k)

d = 2;
n = length(x);

if ~exist('L','var') || L==0
  L = 2*ceil(log(n));
end

if ~exist('B','var') || B==0
    B = floor(4*sqrt(n*k/log2(n)));
    B = 2^floor(log2(B));
    while (B <= d*k)
        B = B*2;
    end
end

tol = n^-6;

rep_filters = floor((n/B));
lobefrac = 0.5/B;



[Gfilter,Gfilter_F,w] = MakeGaussianFilter(lobefrac, tol,rep_filters,n);

x_estimate = zeros(1,n);

max_size = floor(d*k);

score = zeros(1,n);
score_update_arxiv = cell(1,L);

for l=1:L
    [~,~,score_update_arxiv{l}] = Location_Loop(x,B,Gfilter,max_size,w);
    score = score + score_update_arxiv{l};
    %hits(good_freq) = hits(good_freq)+1;
end

best_freq = find(score > L/2);

x_ = zeros(L,length(best_freq));

for l=1:L
    x_(l,:)= Estimation_Loop(x,B,best_freq-1,Gfilter,Gfilter_F,n,w);
end

x_estimate(best_freq) = median(real(x_)) + 1i*median(imag(x_));   

x_estimate = x_estimate*n;

end
