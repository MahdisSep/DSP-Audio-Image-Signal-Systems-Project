clear all;
close all;
clc;



subplot(2,3,1)
[signal, rate] = audioread('clean.wav');
dt = 1/rate;
t = 0:dt:(length(signal) * dt) - dt;
df = rate / length(signal);
audio_f = -(rate / 2):df:(rate / 2) - df;
FT = fftshift(fft(signal)) / length(fft(signal));

for i=1:length(FT)
    FT(i)=FT(i)*0.5;
end
plot(audio_f, abs(FT));
title('FT of song');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

subplot(2, 3, 2)
low_speed_wave = ifft(ifftshift(FT) * length(signal));
plot(t, low_speed_wave); 
title('Signal of 0.5x');
xlabel('Time (s)'); 
ylabel('Amplitude');



subplot(2,3,3)
spectrogram(low_speed_wave, 1000, 100, 1000, rate*0.5, 'yaxis');
title('Spectrogram of 0.5x')

audiowrite('slow.wav', low_speed_wave, rate*0.5);



subplot(2,3,4)
[signal, rate] = audioread('clean.wav');
dt = 1/rate;
t = 0:dt:(length(signal) * dt) - dt;
df = rate / length(signal);
audio_f = -(rate / 2):df:(rate / 2) - df;
FT = fftshift(fft(signal)) / length(fft(signal));

for i=1:length(FT)
    FT(i)=FT(i)*2;
end
plot(audio_f, abs(FT));
title('FT of song');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

subplot(2, 3, 5)
fast_speed_wave = ifft(ifftshift(FT) * length(signal));
plot(t, fast_speed_wave); 
title('Signal of 2x');
xlabel('Time (s)'); 
ylabel('Amplitude');



subplot(2,3,6)
spectrogram(fast_speed_wave, 1000, 100, 1000, rate*2, 'yaxis');
title('Spectrogram of 2x')

audiowrite('fast.wav', fast_speed_wave, rate*2);








