function [morlet_wavelet,time] = generate_morlet_wavelet(fw,fs,w_size,mu,s)
    %GENERATE_WAVELET Summary of this function goes here
    % This function generates a wavelet based on following args:
    % - fw ... wavelet frequency
    % - fs ... sampling frequency
    % - w_size ... wavelet size in seconds
    % - mu ... expected value of gaussian
    % - s  ... variance of gaussian
    time = -round(w_size / 2):(1/fs):round(w_size / 2);
    
    % formula of morlet wavelet (complex sinusoid)
    % checkout https://www.sciencedirect.com/topics/engineering/complex-wavelet
    sine = exp(1i*2*pi*fw.*time);

    gaussian = exp( (-(time-mu).^2) ./ (2*s^2) );
    
    morlet_wavelet = sine .* gaussian;

    figure('Name','wavelet generation plot'), clf
    subplot(2,1,1);
    plot(time,real(morlet_wavelet))
    xlabel('time [s]'), ylabel('Amplitude')
    title([ 'Real part of wavelet at ' num2str(fw) ' Hz' ])
    subplot(2,1,2);
    plot(time,imag(morlet_wavelet))
    xlabel('time [s]'), ylabel('Amplitude')
    title([ 'Imaginary part of wavelet at ' num2str(fw) ' Hz' ])
end

