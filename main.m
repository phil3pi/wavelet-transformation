close all;clear

%% Load data
fs=250; % sampling rate
load('DATAall_cleaneog_A01T_Fs250')
data = eeg(1,:,1);

%% Create morlet wavelet
fw=10;  % frequency of wavelet
[wavelet,~]=generate_morlet_wavelet(fw,fs,2,0,(10 / (2*pi*fw)));

%% Convolution
convolution_length = length(data) + length(wavelet) - 1;

wavelet_f = fft(wavelet,convolution_length);
% normalize amplitude
wavelet_f = wavelet_f ./ max(wavelet_f);
data_f = fft(data,convolution_length);

% apply convolution theorem
% convolution in time domain is multiplication in frequency domain
convolution = data_f ./ wavelet_f;

frequencies = linspace(0,fs/2,floor(convolution_length/2)+1);

%% plot data
figure('Name','wavelet transformation'), clf

time = linspace(0,6,1500);

subplot(4,1,1)
plot(time,data);
xlabel('time [s]'), ylabel('mV')
title('Signal data in time domain')

% plot spectrum of data
subplot(4,1,2)
plot(frequencies,abs(data_f(1:length(frequencies))))
xlabel('frequency [hz]'), ylabel('Amplitude')
title('spectrum of data')

% plot spectrum of wavelet
subplot(4,1,3)
plot(frequencies,abs(wavelet_f(1:length(frequencies))))
xlabel('frequency [hz]'), ylabel('Amplitude')
title('spectrum of wavelet')

% plot spectrum of convolution result
subplot(4,1,4)
plot(frequencies,abs(convolution(1:length(frequencies))))
xlabel('frequency [hz]'), ylabel('Amplitude')
title('spectrum of convolution')