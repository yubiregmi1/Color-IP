function [ result ] = YCbCrtoRGB( I )
%YCbCrtoRGB Convert YCbCr color map to RGB
%  Takes a color image I in YCbCr color map and returns an image in RGB color map

sizeImage = size(I);

result = zeros(sizeImage(1),sizeImage(2),sizeImage(3));

%transformation matrix:
T = [1.0 0.0  1.402; 1.0 -0.3441 -0.7141; 1.0 1.772 0.00015];

for i=1:sizeImage(1)
    for j=1:sizeImage(2)
        temp = T*[I(i,j,1);I(i,j,2);I(i,j,3)];
        result(i,j,1) = temp(1);    %R component
        result(i,j,2) = temp(2);    %G component
        result(i,j,3) = temp(3);    %B component
    end
end

result(:,:,1)=result(:,:,1)-min(min(result(:,:,1)));  
result(:,:,1)=result(:,:,1)/max(max(result(:,:,1)));
result(:,:,2)=result(:,:,2)-min(min(result(:,:,2)));
result(:,:,2)=result(:,:,2)/max(max(result(:,:,2)));
result(:,:,3)=result(:,:,3)-min(min(result(:,:,3)));
result(:,:,3)=result(:,:,3)/max(max(result(:,:,3)));

end

