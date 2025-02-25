%test

Fs = 44100;   % Sampling rate (samples per second)
Dur = 1;      % Duration in seconds

% Create random noise for left and right channels
Left_channel = randn(1, Fs * Dur);    % 1 second of random noise
Right_channel = randn(1, Fs * Dur);   % 1 second of random noise

% Combine into a stereo signal (2 rows, one for each channel)
Stereo_Signal = [Left_channel; Right_channel]; 

% Normalize the signal to the range [-1, 1]
Stereo_Signal = Stereo_Signal / max(abs(Stereo_Signal(:)));  % Normalize

% Define the filename for the output
filename = 'middleCstereo.wav';  % Make sure this is a string

% Write the stereo signal to a file
audiowrite(filename, Stereo_Signal', Fs); % Transpose