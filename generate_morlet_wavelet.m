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
end

