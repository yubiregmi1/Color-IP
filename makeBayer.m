clc;

clear all;
%-----------------------------function makeBayer---------------------------
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
%------------------------------function end--------------------------------

figure(1);
image(result);
axis equal;
axis tight;

%ADD IN MAIN FUNCTION
hsi = RGBtoHSI(result);
% for i = 1:3
%     %m = max(max(hsi(:,:,i)));
%     hsi(:,:,i)/m;
% end
%hsi(:,:,1) = hsi(:,:,1)/360;    %normalization
figure(2);
%imshow(uint8(255*hsi(:,:,1)));  %scaling
ip_disp(255*hsi(:,:,1)/360);
%figure(3);
%imshow(uint8(255*hsi(:,:,2)));  %scaling
%figure(4);
%imshow(uint8(255*hsi(:,:,3)));  %scaling

ycbcr = RGBtoYCbCr(result);
figure(5);
imshow(uint8(255*ycbcr(:,:,1)));                %display
%ycbcr(:,:,2)=ycbcr(:,:,2)-min(min(ycbcr(:,:,2)));   %normalization of 2nd plane(Cb)
%ycbcr(:,:,2)=ycbcr(:,:,2)/max(max(ycbcr(:,:,2)));
%figure(6);
%imshow(uint8(255*ycbcr(:,:,2)));                %display
%ycbcr(:,:,3)=ycbcr(:,:,3)-min(min(ycbcr(:,:,3)));   %normalization of 3rd plane(Cr)
%ycbcr(:,:,3)=ycbcr(:,:,3)/max(max(ycbcr(:,:,3)));
%figure(7);
%imshow(uint8(255*ycbcr(:,:,3)));                %display

avgRGB = avgFilterColor(result,9,1);                %average RGB
figure(8);
image(avgRGB);
axis equal;
axis tight;

%hsitorgb = HSItoRGB(hsi);
%ycbcrtorgb = YCbCrtoRGB(ycbcr);
%figure(9);
%image(hsitorgb);
%image(ycbcrtorgb);
%axis equal;
%axis tight;

avgHSI = avgFilterColor(hsi,9,2);                %average HSI
figure(9);
image(HSItoRGB(avgHSI));
axis equal;
axis tight;

avgYCbCr = avgFilterColor(ycbcr,9,3);                %average HSI
figure(10);
image(YCbCrtoRGB(avgYCbCr));
axis equal;
axis tight;