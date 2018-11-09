function [ result ] = scale3DImage( p,q,I )
%   scale3DImage scales RGB image
%   pxq is desired size of the result image
%   I is the input RGB image
%   result is scaled RGB image

[m n o ] = size(I);
result = zeros(p,q,o);

result(:,:,1) = scaleImage(p,q,I(:,:,1));   %scale R plane
result(:,:,2) = scaleImage(p,q,I(:,:,2));   %scale G plane
result(:,:,3) = scaleImage(p,q,I(:,:,3));   %scale B plane

end

