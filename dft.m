% Compute the DFT using the direct formula
N = length(x);
X = zeros(1, N);
for k = 1:N
for n = 1:N
X(k) = X(k) + x(n) * exp(-1i * 2 * pi * (k-1) * (n-1) / N);
end
end
% Compute the magnitude spectrum of the DFT Xmag = abs(X);
% Compute the phase spectrum of the DFT Xphase = angle(X);
  