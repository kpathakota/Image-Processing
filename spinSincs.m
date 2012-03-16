%% Spinning sinc functions
% The goal of this is to analyze what happens to a shifted filter and how
% the convolution of an edge with a spinning filter changes the output.  

close all;
% Filter Initialization
firLength = 510;%should be odd and small (make it simple)
transitionLength = .01;
edgeLength = 511;
lpfWidth = 0.2;
freqShift1 = 0.2;
h = firpm(firLength,[0 lpfWidth lpfWidth+transitionLength 1],[1 1 0 0]);


% Spinning the sinc!
hs = zeros(1,firLength);
for k = 1:length(h)
    hs(k) = h(k)*exp(1i*(k-(length(h)+1)/2)*freqShift1*2*pi); 
end

% Showing shifted low pass filter
[HShift,W] = plotdtft(hs,1);
figure;
plot(W/pi, abs(fftshift(HShift)));
title('Frequency response of shifted filter');

% Spinning low-pass in 3-D
figure;
plot3(1:length(hs), real(hs),imag(hs));
title('Spinning low pass filter');
grid

%%  Introducing the edge

% Plotting the edge that has been created
x = (1+erf((0:edgeLength-1)-(edgeLength)/2))/2;
figure;
plot(x);
axis([-1 512 -0.1 1.1]);
title('Edge using erf');
 
% Plotting DTFT of the edge (1/jW)
[X,W] = plotdtft(x,4);
figure;
plot(W/pi, abs(fftshift(X)/length(X)));
title('DTFT of edge');

% Output of edge with real filter
y = conv(x,h);
figure;
plot(y)
title('Edge low pass filtered ');
 
% DTFT of edge with real filter
[Y,W] = plotdtft(y,6);
figure;
plot(W/pi, abs(fftshift(Y)));
title('DTFT of real filtered edge');

%% Complex filter response

% Output of edge with shifted (spinning) filter
ys = conv(x,hs);
figure;
plot3(1:length(ys), real(ys), imag(ys));
title('Edge complex filtered');

% DTFT of shifted edge
[YShift, W] = plotdtft(ys,7);
figure;
plot(W/pi, abs(fftshift(YShift)));
title('DTFT of complex filtered edge');

%% Sample 512 phase

phase(ys(512))
figure;
lPhase = phase(ys(508:515));  % Local Phase
plot(508:515, lPhase);
title('Phase around sample');

figure;
dPhase = zeros(1,10);  % dPhase/dn
for i= 1:10
    dPhase(i) = phase(ys(509+i))- phase(ys(508+i));
end
plot(510:519, dPhase);
title('Derivative of phase in the neighborhood of 512');


