function [ result ] = bayerImage()
%bayerImage Makes a 256x256 Bayer image with each pixel size of 32x32
I = 256;    %size of image 
P = 32;     %size of each pixel 

%create 64x64 (repeating) tiles for R,G and B plane
Z = zeros(P,P);     %each pixel size=32x32
O = ones(P,P);
r = [Z Z;Z O];        %64x64 repeating tile for red plane
g = [Z O;O Z];        %64x64 rpeating tile for green plane
b = [O Z;Z Z];        %64x64 repeating tile for blue plane

R = repmat(r,I/(2*P));
G = repmat(g,I/(2*P));
B = repmat(b,I/(2*P));

result = cat(3,R,G,B);


end

