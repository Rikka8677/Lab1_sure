clear all;
close all;
[x,fs] = audioread('C:\Users\謝政熹\Desktop\謝政熹_106360114\introduce.wav');
x = x(:,1); %取左聲道的聲音訊號
t = (0:length(x)-1)/fs;
figure;
subplot(6,2,1); plot(t,x);
title('原始音檔時域');
subplot(6,2,2); spectrogram(x, 1024, 1000, [], fs, 'yaxis');
title('原始音檔頻譜');

fprintf('音檔最小值為%g\n\n',min(x));
fprintf('音檔最大值為%g\n\n',max(x));
fprintf('音檔平均值為%g\n\n',mean(x));
sound(x,fs);

audioFile = '2倍取樣頻率.wav';
audiowrite(audioFile, x, 2*fs);
[x2,fs2] = audioread('C:\Users\謝政熹\Desktop\謝政熹_106360114\2倍取樣頻率.wav');
x2 = x2(:,1); %取左聲道的聲音訊號
t2 = (0:length(x2)-1)/fs2;
subplot(6,2,3); plot(t2,x2);
title('2倍取樣頻率音檔時域');
subplot(6,2,4); spectrogram(x, 1024, 1000, [], fs2, 'yaxis');
title('2倍取樣頻率音檔頻譜');
sound(x2,fs2);

audioFile = '0.5倍取樣頻率.wav';
audiowrite(audioFile, x, 0.5*fs);
[x3,fs3] = audioread('C:\Users\謝政熹\Desktop\謝政熹_106360114\0.5倍取樣頻率.wav');
x3 = x3(:,1); %取左聲道的聲音訊號
t3 = (0:length(x3)-1)/fs3;
subplot(6,2,5); plot(t3,x3);
title('0.5倍取樣頻率音檔時域');
subplot(6,2,6); spectrogram(x, 1024, 1000, [], fs3, 'yaxis');
title('0.5倍取樣頻率音檔頻譜');
sound(x3,fs3);

f = 10000;
t4 = linspace(0,4.89,215708);
am = (1+0.5*x').*cos(2*pi*f*t4);
subplot(6,2,7); plot((1:length(am))/fs,am);
title('AM調變時域');
subplot(6,2,8); spectrogram(am, 1024, 1000, [], fs, 'yaxis');
title('AM調變頻譜');

fm = cos((2*pi*f*t4)+cumsum(x)');
subplot(6,2,9); plot((1:length(fm))/fs,fm);
title('FM調變時域');
subplot(6,2,10); spectrogram(fm, 1024, 1000, [], fs, 'yaxis');
title('FM調變頻譜');

aam = 5*(x)'.*cos(2*pi*f*t4);
subplot(6,2,11); plot((1:length(am))/fs,aam);
title('AAM調變時域');
subplot(6,2,12); spectrogram(aam, 1024, 1000, [], fs, 'yaxis');
title('AAM調變頻譜');






