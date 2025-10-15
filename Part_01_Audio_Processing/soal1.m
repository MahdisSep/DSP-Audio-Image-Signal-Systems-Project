clear all;
close all;
clc;

subplot(2, 3, 1)
[signal, r] = audioread('noisy_tlou.wav');
step = 1/r;
t = 0:step:(length(signal) * step) - step;
plot(t, signal); 
xlabel('Time (s)'); 
ylabel('Amplitude');
title('Signal of song')



subplot(2, 3, 2)
damne = r / length(signal);
audio_f = -(r / 2):damne:(r / 2) - damne;

FT = fftshift(fft(signal)) / length(fft(signal));
plot(audio_f, abs(FT));
title('FT of song');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

subplot(2, 3, 3)
spectrogram(signal, 1000, 20, 1000, r, 'yaxis');
title('Spectrogram of song')



Low_Pass_Filter= FT;
Low_Pass_Filter(abs(audio_f) > 1000) = 0;

subplot(2, 3, 4)
low_pass_filter = ifft(ifftshift(Low_Pass_Filter) * length(signal));
plot(t, low_pass_filter); 
xlabel('Time (s)'); 
ylabel('Amplitude');
title('Signal of Low Pass Filtered')



subplot(2, 3, 5)
plot(audio_f, abs(Low_Pass_Filter));
title('FT of Low Pass Filter');
xlabel('Frequency(Hz)');
ylabel('Amplitude');


subplot(2, 3, 6)
spectrogram(low_pass_filter, 1000, 50, 1000, r, 'yaxis');
title('Spectrogram of Low Pass Filter')

audiowrite('clean.wav', low_pass_filter, r);

