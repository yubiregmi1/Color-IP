function [ result ] = greenScreen( image1,image2 )
%   greenScreen Applies green screen 
%   image1 is foreground image with green screen
%   image2 is background image

[p q r] = size(image1);
[m n o] = size(image2);
%result = zeros(m,n,o);
temp = zeros(m,n,o);

%%pad image1 to make square->take average->shrink->pad again to the size of background
%%padding
 if (p<q)
     padded_plane = padColorImage(q-p,0,0,255,0,image1);
 end
 if (p>q)
     padded_plane = padColorImage(0,p-q,0,255,0,image1);
 end
 
 [a b c] = size(padded_plane);
 
% %smoothing
 avg_plane =avgFilterColor(padded_plane,9,1);    %5 is kernel size/1 because image is RGB
 avg_plane = avg_plane(4:(a-3),4:(b-3),:);   %crop out 3 pixel width column and row from edges
 
% %shrinking
scaled_plane = scaleTest(0.25,0.25,avg_plane);
%scaled_plane = scaleTest(0.25,0.25,image1);

%pad again to make size equal to background
[x y z] = size(scaled_plane);
row_padding = m-x;
col_padding = n-y;
greenScreenBackground = padColorImage(row_padding,col_padding,0,255,0,scaled_plane);
gSB_hsi = RGBtoHSI(greenScreenBackground);
image2_hsi = RGBtoHSI(image2);

%apply green screen
for i=1:m
    for j=1:n
        %if (greenScreenBackground(i,j,1)==0)&&(greenScreenBackground(i,j,2)==255)&&(greenScreenBackground(i,j,3)==0)
        if (gSB_hsi(i,j,1)>84)&&(gSB_hsi(i,j,1)<160)
%             result(i,j,1)=image2(i,j,1);
%             result(i,j,2)=image2(i,j,2);
%             result(i,j,3)=image2(i,j,3);
            temp(i,j,1)=image2_hsi(i,j,1);
            temp(i,j,2)=image2_hsi(i,j,2);
            temp(i,j,3)=image2_hsi(i,j,3);
        else
%             result(i,j,1)=greenScreenBackground(i,j,1);
%             result(i,j,2)=greenScreenBackground(i,j,2);
%             result(i,j,3)=greenScreenBackground(i,j,3);
              temp(i,j,1)=gSB_hsi(i,j,1);
              temp(i,j,2)=gSB_hsi(i,j,2); 
              temp(i,j,3)=gSB_hsi(i,j,3); 

        end
    end
end
result = 255*HSItoRGB(temp);


end

