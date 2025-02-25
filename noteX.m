function noteX = note(A, keynum, dur)
    % Define the sampling frequency 
    Fs = 11025;
    Ts = 1/Fs;
    A4 = 440;
    ref_key = 49;

    % Define the frequency for the note using the key number
    % The frequency for MIDI key number is calculated using this formula:
    freq = 440 * 2^((keynum - 49) / 12);  % A4 is 440 Hz, key number 49 represents A4

    % Time vector for the duration of the note
    t = 0:Ts:dur;


    % Generate the sine wave
    noteX = A * sin(2 * pi * freq * t);
end

