function [ result ] = correctRGB( r,g,b,I )
%   correctRGB changes RGB values of image by r,g,b

[m n o] = size(I);
result = zeros(m,n,o);
for i=1:m
    for j=1:n
if (I(i,j,1)+r)>0 || (I(i,j,1)+r)<255
    result(i,j,1) = I(i,j,1)+r;
elseif(I(i,j,1)+r)<0
    result(i,j,1) = 0;
elseif (I(i,j,1)+r)>255
    result(i,j,1) = 255;
end

if (I(i,j,2)+g)>0 || (I(i,j,2)+g)<255
    result(i,j,2) = I(i,j,2)+g;
elseif(I(i,j,2)+g)<0
    result(i,j,2) = 0;
elseif (I(i,j,2)+g)>255
    result(i,j,2) = 255;
end

if (I(i,j,3)+b)>0 || (I(i,j,3)+b)<255
    result(i,j,3) = I(i,j,3)+b;
elseif(I(i,j,3)+b)<0
    result(i,j,3) = 0;
elseif (I(i,j,3)+b)>255
    result(i,j,3) = 255;
end

    end
end



end

