%% Spinning sinc functions
% The goal of this is to analyze what happens to a shifted filter and how
% the convolution of an edge with a spinning filter changes the output.  

close all;
% Filter Initialization
firLength = 510;%should be odd and small (make it simple)
transitionLength = .01;
edgeLength = 511;
lpfWidth = 0.2;
freqShift1 = 0.25;
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
x = makeEdge(edgeLength,.25,1,0);
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

range = 400:600;
phase(ys(512))
figure;
lPhase = mod(phase(ys(range)), 2*pi);  % Local Phase
plot(range, lPhase);
title('Phase around sample');
figure;
dPhase = zeros(1,length(range));  % dPhase/dn
for i = range
    dPhase(i) = phase(ys(i))- phase(ys(i-1));
    if(dPhase(i)<0)
       dPhase(i) = 2*pi + dPhase(i);
    end
end
plot(range, dPhase(range));
title('Derivative of phase in the neighborhood of 512');


