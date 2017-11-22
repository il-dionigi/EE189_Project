function [h_I] = hashing(I,s,B,n)

h_I = floor(mod(s*I,n)*(B/n));

end