%% Plotting function

function handles = makeplots(handles)

firLength = 511;%should be odd
transitionLength = .01;

lpfWidth = get(handles.bandslider,'Value');
freqShift1 = get(handles.phaseslider,'Value');
h = firpm(firLength,[0 lpfWidth lpfWidth+transitionLength 1],[1 1 0 0]);

hshift = zeros(1,firLength);
for k = 1:length(h)
    hshift(k) = h(k)*exp(1i*k*freqShift1*2*pi); 
end

[HShift, W] = plotdtft(hshift,3);

plot(handles.dtftplot, W/pi, abs(fftshift(HShift)));

plot3(handles.timeplot,1:length(hshift), real(hshift),imag(hshift));
grid

end