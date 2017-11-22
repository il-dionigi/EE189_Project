function [t] = mod_inverse(s,n)
%%% Extended Euclidian Algorithm for solving s*t + y*n = 1;

t= [0 1];
r = [n s];
while r(2) ~= 0
    q = floor(r(1) / r(2));
    t  = [t(2) , t(1) - q * t(2)];
    r  = [r(2) , r(1) - q * r(2)];
end
if t(1) < 0
    t(1) = t(1) + n;
end
t = t(1);
end