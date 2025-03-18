fs = 4000; 
nyquist = fs/2;

fc = 300/nyquist;
       % Sampling frequency
f1 = 150;         % Frequency 1 (150 Hz)
f2 = 800;         % Frequency 2 (800 Hz)


%b = ratio*sinc(ratio*(-30:30));

% Time vector
t = 0:1/fs:1-(1/fs);  % 1 second duration

% Create the original signal (150 Hz + 800 Hz)
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);
n=30;
% Create the sinc filter
b = fc * sinc( fc * (-(n):n));  % Sinc filter centered at fc
win = hamming(2*n+1);

window_sinc = win.*b';
% Apply the filter to the signal
y = conv(x, window_sinc, 'same');  % Convolve the signal with the filter


freqz(window_sinc)