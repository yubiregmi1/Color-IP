function result = RGBtoHSI(I)

I = double(I);
sizeImage = size(I);

result = zeros(sizeImage(1),sizeImage(2),sizeImage(3));

for i = 1:sizeImage(1)
    for j = 1:sizeImage(2)
        %calculation of hue
        theta = acosd((1/2)*(2*I(i,j,1)-I(i,j,2)-I(i,j,3))/(sqrt((I(i,j,1)-I(i,j,2))^2+eps+((I(i,j,1)-I(i,j,3))*(I(i,j,2)-I(i,j,3))))));
        if (I(i,j,3)<=I(i,j,2))
            result(i,j,1) = theta;
        else
            result(i,j,1) = 360-theta;
        end
        
        %calculation of saturation
        result(i,j,2) = 1-(3/(I(i,j,1)+I(i,j,2)+I(i,j,3)+eps)*min([I(i,j,1) I(i,j,2) I(i,j,3)]));
        
        %calculation of intensity
        result(i,j,3) = (1/3)*(I(i,j,1)+I(i,j,2)+I(i,j,3)+eps);
      
    end
end
end