function [X, w3] = plotdtft(x,index )
%PLOTDTFT Given a signal x, this function will plot it's dtft
% - The function takes in the discrete function and it's figure index and
% - will plot the dtft on the axis from -\pi to \pi.  Will also return the 
% - FFT of the signal


N = 2048;
X = fft(x,N);
w = 2*pi*(0:N-1)/N;
w2 = fftshift(w);
w3 = unwrap(w2 - 2*pi);

end

