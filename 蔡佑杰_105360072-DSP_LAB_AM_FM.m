clear all;
close all;
[x,fs] = audioread('C:\Users\�¬F�Q\Desktop\�¬F�Q_106360114\introduce.wav');
x = x(:,1); %�����n�D���n���T��
t = (0:length(x)-1)/fs;
figure;
subplot(6,2,1); plot(t,x);
title('��l���ɮɰ�');
subplot(6,2,2); spectrogram(x, 1024, 1000, [], fs, 'yaxis');
title('��l�����W��');

fprintf('���ɳ̤p�Ȭ�%g\n\n',min(x));
fprintf('���ɳ̤j�Ȭ�%g\n\n',max(x));
fprintf('���ɥ����Ȭ�%g\n\n',mean(x));
sound(x,fs);

audioFile = '2�������W�v.wav';
audiowrite(audioFile, x, 2*fs);
[x2,fs2] = audioread('C:\Users\�¬F�Q\Desktop\�¬F�Q_106360114\2�������W�v.wav');
x2 = x2(:,1); %�����n�D���n���T��
t2 = (0:length(x2)-1)/fs2;
subplot(6,2,3); plot(t2,x2);
title('2�������W�v���ɮɰ�');
subplot(6,2,4); spectrogram(x, 1024, 1000, [], fs2, 'yaxis');
title('2�������W�v�����W��');
sound(x2,fs2);

audioFile = '0.5�������W�v.wav';
audiowrite(audioFile, x, 0.5*fs);
[x3,fs3] = audioread('C:\Users\�¬F�Q\Desktop\�¬F�Q_106360114\0.5�������W�v.wav');
x3 = x3(:,1); %�����n�D���n���T��
t3 = (0:length(x3)-1)/fs3;
subplot(6,2,5); plot(t3,x3);
title('0.5�������W�v���ɮɰ�');
subplot(6,2,6); spectrogram(x, 1024, 1000, [], fs3, 'yaxis');
title('0.5�������W�v�����W��');
sound(x3,fs3);

f = 10000;
t4 = linspace(0,4.89,215708);
am = (1+0.5*x').*cos(2*pi*f*t4);
subplot(6,2,7); plot((1:length(am))/fs,am);
title('AM���ܮɰ�');
subplot(6,2,8); spectrogram(am, 1024, 1000, [], fs, 'yaxis');
title('AM�����W��');

fm = cos((2*pi*f*t4)+cumsum(x)');
subplot(6,2,9); plot((1:length(fm))/fs,fm);
title('FM���ܮɰ�');
subplot(6,2,10); spectrogram(fm, 1024, 1000, [], fs, 'yaxis');
title('FM�����W��');

aam = 5*(x)'.*cos(2*pi*f*t4);
subplot(6,2,11); plot((1:length(am))/fs,aam);
title('AAM���ܮɰ�');
subplot(6,2,12); spectrogram(aam, 1024, 1000, [], fs, 'yaxis');
title('AAM�����W��');






