function [Z,J,score_update] = Location_Loop(x,B,G,max_size,w)

n = length(x);
s = randi([1 n]);
s = s + (1 - mod(s,2));   %%% Make sure a is odd
t = randi([1 n]);


%y = G.*x(mod(s*(0:(n-1)) + t,n) +1);
%z = sum(reshape(y,B,n/B).');

index = t;
z = zeros(1,B);
for i = 0:(w-1) 
    z(1+mod(i,B)) = z(1+mod(i,B)) + x(1+index) * G(1+i);
    index = mod((index+s),n);
end



Z = fft(z)*n/B;

%%%% Haitham's Code
index = t;
z2 = zeros(1,B);
for i = 0:1:(n-1) 
    z2(mod(i,B)+1) = z2(mod(i,B)+1) + x(index+1) * G(i+1);
    index = mod(index+s,n);
end
%%%%%%%%%%%%%%%%%%%
 
[~,sortingIndices] = sort(abs(Z),'descend');
J = sortingIndices(1:max_size)-1;

%%%% Spread Hashing
s_ = mod_inverse(s,n);
[~,score_update] = hashingSpread(J,s_,B,n);



end