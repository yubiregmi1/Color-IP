% MAIN FUNCTION

bayer_image = bayerImage();
figure(1);
image(bayer_image);
title('Bayer Image');
axis equal;
axis tight;

hsi = RGBtoHSI(bayer_image);
ycbcr = RGBtoYCbCr(bayer_image);

figure(1);
subplot(2,2,1);
image(bayer_image);
title('RGB Color Model');
axis equal;
axis tight;
subplot(2,2,2);
ip_disp(255*bayer_image(:,:,1));
title('R component');
subplot(2,2,3);
ip_disp(255*bayer_image(:,:,2));  %scaling
title('G component');
subplot(2,2,4);
ip_disp(255*bayer_image(:,:,3));  %scaling
title('B component');

figure(2);
subplot(2,2,1);
image(bayer_image);
title('HSI Color Model');
axis equal;
axis tight;
subplot(2,2,2);
ip_disp(255*hsi(:,:,1)/360);
title('H component');
subplot(2,2,3);
ip_disp(255*hsi(:,:,2));  %scaling
title('S component');
subplot(2,2,4);
ip_disp(255*hsi(:,:,3));  %scaling
title('I component');

figure(3);
subplot(2,2,1);
image(bayer_image);
title('YCbCr Color Model');
axis equal;
axis tight;
subplot(2,2,2);
ip_disp(255*ycbcr(:,:,1));
title('Y component');
subplot(2,2,3);
ycbcr(:,:,2)=ycbcr(:,:,2)-min(min(ycbcr(:,:,2)));   %normalization of 2nd plane(Cb)
ycbcr(:,:,2)=ycbcr(:,:,2)/max(max(ycbcr(:,:,2)));
ip_disp(255*ycbcr(:,:,2));
title('Cb component');
subplot(2,2,4);
ycbcr(:,:,3)=ycbcr(:,:,3)-min(min(ycbcr(:,:,3)));   %normalization of 3rd plane(Cr)
ycbcr(:,:,3)=ycbcr(:,:,3)/max(max(ycbcr(:,:,3)));
ip_disp(255*ycbcr(:,:,3));                          %display
title('Cr component');

avgRGB = avgFilterColor(bayer_image,9,1);                %average RGB
avgHSI = avgFilterColor(hsi,9,2);
avgYCbCr = avgFilterColor(ycbcr,9,3);

figure(4);
subplot(2,2,1);
image(bayer_image);
title('Original Image');
axis equal;
axis tight;
subplot(2,2,2);
image(avgRGB);
title('After smoothing RGB');
axis equal;
axis tight;
subplot(2,2,3);
image(HSItoRGB(avgHSI));
title('After smoothing HSI');
axis equal;
axis tight;
subplot(2,2,4);
image(YCbCrtoRGB(avgYCbCr));
title('After smoothing YCbCr');
axis equal;
axis tight;


lena = imread('lena_color_512.tif');
lena_hsi = RGBtoHSI(lena);
figure(5);
subplot(2,2,1);
image(lena);
title('RGB Color Model');
axis equal;
axis tight;
subplot(2,2,2);
ip_disp(lena(:,:,1));
title('R component');
subplot(2,2,3);
ip_disp(lena(:,:,2));  %scaling
title('G component');
subplot(2,2,4);
ip_disp(lena(:,:,3));  %scaling
title('B component');

figure(6);
subplot(2,2,1);
image(lena);
title('HSI Color Model');
axis equal;
axis tight;
subplot(2,2,2);
ip_disp(255*lena_hsi(:,:,1)/360);
title('H component');
subplot(2,2,3);
ip_disp(255*lena_hsi(:,:,2));  %scaling
title('S component');
subplot(2,2,4);
ip_disp(lena_hsi(:,:,3));  %scaling
title('I component');

load green_screen;
greenscreen_res = greenScreen(F16,AFA);
figure(7);
image(uint8(greenscreen_res));
title('Green Screen');


