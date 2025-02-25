Filename = 'piano_middle_C.wav';
% First read wav file into memory
[Sig,Fs]=audioread(Filename);
%Sig stores raw audio data in column;
%Fs sampling frequency

Duration = length(Sig)/Fs;
disp(Duration);
Ts = 1/Fs;
Time = 0:Ts:Duration-Ts;
plot(Time' ,Sig);
ylabel('Amplitude');
xlabel('Time Sec');

info1 = audioinfo("piano_middle_C.wav");
audioinfo(Filename);

t1 = 0.5;
t2 = 1;
%sample indices
t1samples = t1*Fs;
t2samples = t2*Fs;

partSig = Sig(t1samples:t2samples);
partTime = Time(t1samples:t2samples);
plot(partTime ,partSig);


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
audiowrite(filename, Stereo_Signal', Fs); % Transpose to 2 x N format
