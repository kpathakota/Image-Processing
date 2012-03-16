%% Exploration of fir1 and the DTFT

h = fir1(128,0.3);
figure(1);
plot(h);

H = plotdtft(h,2);

hshift = zeros(1,length(h));
modFreq = 0.8;
for k = 1:length(h)
    hshift(k) = h(k)*exp(-1i*k*modFreq*2*pi);
end



HS = plotdtft(hshift,10);

x = (1+erf((0:255)-128))/2;
figure(3);
plot(x);

X = plotdtft(x,4);

rex = real(X);
rim = imag(X);

figure(5);
stem3(rex,imx,1:256);

y = conv(x,real(hshift));
figure(6);
plot(y);

Y = plotdtft(y,7);
