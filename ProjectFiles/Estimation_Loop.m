function [x_] = Estimation_Loop(x,B,I,G,G_,n,w)


s = randi([1 n]);
s = s + (1 - mod(s,2));   %%% Make sure a is odd
t = 0;   %%%% when doing estimation, just drop the phase shift.

index = t;
z = zeros(1,B);
for i = 0:(w-1) 
    z(1+mod(i,B)) = z(1+mod(i,B)) + x(1+index) * G(1+i);
    index = mod((index+s),n);
end

Z = fft(z);

h_I = hashing(I,s,B,n);
%offset_I = mod(h_I,n/B);
offset_I = mod(s*I,n/B);
Ofix = offset_I > n/B/2;
offset_I(Ofix) = offset_I(Ofix) - n/B;
h_I(Ofix) = mod(h_I(Ofix)+1,B);

x_ = Z(h_I+1) ./ G_(mod(n-offset_I,n)+1);

% offset_I = mod(mod(s*I,n) - h_I*(n/B),n);
% offset_I = mod(mod(s*I,n),n/B);
% offset_I(offset_I > n/B/2)- h_I*(n/B),n);


end