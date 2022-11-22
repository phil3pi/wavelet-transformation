fw=10;
fs=1000;
[x,time]=generate_morlet_wavelet(fw,fs,2,0,(3 / (2*pi*fw)));

figure(1), clf
subplot(2,1,1);
plot(time,real(x))
xlabel('time [s]'), ylabel('Amplitude')
title([ 'Real part of wavelet at ' num2str(fw) ' Hz' ])
subplot(2,1,2);
plot(time,imag(x))
xlabel('time [s]'), ylabel('Amplitude')
title([ 'Imaginary part of wavelet at ' num2str(fw) ' Hz' ])


