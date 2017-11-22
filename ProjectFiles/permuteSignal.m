function [y] = permuteSignal(x,s,t)

n = length(x);
y = x(mod((0:(n-1))*s +t,n)+1);

end

