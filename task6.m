%%Task6 
%%Task 1
fs = 22050; % sample rate
dur = 2; % duration
noise = rand(1,fs * dur); % creating noise using randn
%sound(noise,fs);
%signalAnalyzer
%filterDesigner
b = Name.Numerator; %Filter numerator value
a = 1; %
x = noise; %x = the signal
y = filter(b,a,x); % applies the filter to the signal
plot(b)
signalAnalyzer
sound(y,fs) % Y is the sound after the filter