x = randn(1,200);
%b = Hd.Denominator 
a = 1; %Note for FIR filter Denominator is ommitted. 
a=1; y = filter(b,a,x); 
figure(1); 
subplot(211), plot (x, 'DisplayName', 'x', 'YDataSource', 'x');
subplot(212), plot (y, 'DisplayName', 'y', 'YDataSource', 'y');

% Define the filter specifications
Fs = 1000; % Sampling frequency (in Hz)
Fpass = 200; % Passband frequency (in Hz)
Fstop = 300; % Stopband frequency (in Hz)
Apass = 1; % Passband ripple (dB)
Astop = 60; % Stopband attenuation (dB)

%% Create the filter specification object
Hd = fdesign.lowpass('Fp,Fst,Ap,Ast', Fpass, Fstop, Apass, Astop, Fs);

%% Design the filter based on the specification
filterObj = design(Hd, 'butter'); % You can change 'butter' to other filter designs, such as 'cheby1', 'ellip', etc.

%% Apply the filter to the input signal x
% Extract the filter coefficients (Numerator and Denominator for IIR)
b = filterObj.Numerator; % Numerator coefficients
a = filterObj.Denominator; % Denominator coefficients

% Apply the filter to the input signal x
x = randn(1, 200); % Example input signal
y = filter(b, a, x); % Filter the signal

%% Plot the original and filtered signals
figure;
subplot(2,1,1);
plot(x);
title('Original Signal');
xlabel('Sample Index');
ylabel('Amplitude');

subplot(2,1,2);
plot(y);
title('Filtered Signal');
xlabel('Sample Index');
ylabel('Amplitude');
