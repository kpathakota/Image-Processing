%% Function to create edge

% Create edge based on the following arguments:
% i. length - number of samples of the edge
% ii. spread- float from 0 to 1 determining how spread out the edge is
% iii. height - 
% iv. shift - 
% v.

function [edge] = makeEdge (edgeLength, spread, height, shift)
edgeSize = edgeLength*spread;
range = 1:spread:edgeSize;
edge = (1+erf(((range)-(edgeSize+1-shift)/2))*height)/2;
end