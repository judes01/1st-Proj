% Create an impulse response `ir` with zeros initially
ir = zeros(1, 50000);

% Assign values at specific indices to represent an impulse response
ir([1, 1000, 5000, 10000, 15000]) = [1, 0.8, 0.7, 0.6, 0.5]; 
% This defines the impulse response with an initial impulse at time 1 (strength 1),
% followed by echoes at times 1000, 5000, 10000, and 15000 with diminishing amplitudes.

% Read the audio signal 'pluck.wav' and store it in `sig` with its sampling frequency `fs`
[sig, fs] = audioread('pluck.wav'); 
% The audio signal `sig` is the sound wave data, and `fs` is the sampling frequency.

% Convolve the signal `sig` with the impulse response `ir` to create a new signal `y`
y = conv(sig, ir); 
% Convolution applies the impulse response to the signal, simulating the effect of the echo system
% The result `y` is a new signal where the original signal is modified by the impulse response (echoes).

% Plot the original signal `sig` in the first subplot (top) of the figure
subplot(211), plot(sig);
% 211 specifies the position of the subplot (2 rows, 1 column, first subplot)
% % title('Original Signal');
% % xlabel('Time (samples)');
% % ylabel('Amplitude');

% Plot the convolved signal `y` in the second subplot (bottom) of the figure
subplot(212), plot(y);
% 212 specifies the position of the subplot (2 rows, 1 column, second subplot)
% % title('Convolved Signal');
% % xlabel('Time (samples)');
% % ylabel('Amplitude');


[sig_pluck, Fs] = audioread('pluck.wav');
t = [0.0001, 0.5, 1, 1.5, 2];  % Times in seconds

Ir = zeros(Fs*3, 1);  % Create a 3-second long impulse response

% Ensure the index is rounded to the nearest integer
Ir(round(Fs*t(1))) = 1;   % Set impulse at t(1)
Ir(round(Fs*t(2))) = 0.3; % Set impulse at t(2)
Ir(round(Fs*t(3))) = 0.25; % Set impulse at t(3)
Ir(round(Fs*t(4))) = 0.17; % Set impulse at t(4)
Ir(round(Fs*t(5))) = 0.1;  % Set impulse at t(5)

% Plot the impulse response
figure(1);
stem(Ir);
ylabel('Amplitude');

% Convolve the signal with the impulse response
y = conv(sig_pluck, Ir);

% Play the sound after convolution
sound(y, Fs);



