function [ result ] = HSItoRGB(I)
%HSItoRGB Convert HSI color map to RGB
%   Takes a color image I in HSI color map and returns an image in RGB color map

I = double(I);
sizeImage = size(I);

result = zeros(sizeImage(1),sizeImage(2),sizeImage(3));

for i = 1:sizeImage(1)
    for j = 1:sizeImage(2)
        if (I(i,j,1)>=0 && I(i,j,1)<120)
            result(i,j,3) = I(i,j,3)*(1-I(i,j,2));
            result(i,j,1) = I(i,j,3)*(1+(I(i,j,2)*cosd(I(i,j,1))/cosd(60-I(i,j,1))+eps));
            result(i,j,2) = 3*I(i,j,3)-(result(i,j,1)+result(i,j,3));
        elseif (I(i,j,1)>=120 && I(i,j,1)<240)
            I(i,j,1) = I(i,j,1)-120;
            result(i,j,1) = I(i,j,3)*(1-I(i,j,2));
            result(i,j,2) = I(i,j,3)*(1+(I(i,j,2)*cosd(I(i,j,1))/cosd(60-I(i,j,1))+eps));
            result(i,j,3) = 3*I(i,j,3)-(result(i,j,1)+result(i,j,2));
        elseif (I(i,j,1)>=240 && I(i,j,1)<360)
            I(i,j,1) = I(i,j,1)-240;
            result(i,j,2) = I(i,j,3)*(1-I(i,j,2));
            result(i,j,3) = I(i,j,3)*(1+(I(i,j,2)*cosd(I(i,j,1))/cosd(60-I(i,j,1))+eps));
            result(i,j,1) = 3*I(i,j,3)-(result(i,j,2)+result(i,j,3));
        end
        
    end
end
result(:,:,1)=result(:,:,1)-min(min(result(:,:,1)));  
result(:,:,1)=result(:,:,1)/max(max(result(:,:,1)));
result(:,:,2)=result(:,:,2)-min(min(result(:,:,2)));
result(:,:,2)=result(:,:,2)/max(max(result(:,:,2)));
result(:,:,3)=result(:,:,3)-min(min(result(:,:,3)));
result(:,:,3)=result(:,:,3)/max(max(result(:,:,3)));

end

