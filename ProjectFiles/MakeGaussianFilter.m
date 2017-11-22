function [x_filt,h,w] = MakeGaussianFilter(lobefrac, tol,b,n)

%   w = floor( (2 / pi) * (1/lobefrac) * log(1/tol) );
  
  w = floor(0.5/lobefrac * log(1/tol));
  
  if (w > n)
      w = n;
  end
  std_t = (w/2) / sqrt(2*log(1/tol));
  center = w/2;
    
  dist = abs([0:(w-1)] - center);
  x = exp(-dist.^2 / (2 * std_t * std_t));

  g = fftshift([zeros(1,floor((n-w)/2)) x zeros(1,ceil((n-w)/2))]);   % fftshift acroos n instead of w
  
  G = fft(g,n);
  s = sum(G(1:b));
  max_n = 0;
  offset = floor(b/2);
  
  h2 = zeros(1,n);
  S = [s , G(mod((0:n-1)+b,n)+1) - G(1:n)];
  S =cumsum(S);
  h(mod((0:(n-1)) + n +offset,n)+1) = S(1:(end-1));
%   for i = 0:(n-1)
%     h(mod(i+n +offset,n)+1) = s;
%     if (abs(h2(mod(i+n +offset,n)+1) - h(mod(i+n +offset,n)+1) ) > 1e-10)
%         disp('OK');
%     end
%     max_n = max([max_n,abs(s)]);
%     s = s + G(mod(i+b,n)+1) - G(i+1);
%   end
  
  step = exp(-2*pi * 1i * floor(w/2) / n);
  offsetc = step.^(0:(n-1));
  h = h / max(abs(h));
  
  
  h = h.*offsetc;
  g_out = ifft(h);
  
  x_filt = g_out(1:w);
  x_filt = g_out;
  
end







