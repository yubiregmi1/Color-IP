function [ result ] = correctHue( p,I )
%   correctHue shifts hue by n degrees

[m n o] = size(I);
result = zeros(m,n,o);

if(I(:,:,1)+p)<360
    result(:,:,1) = I(:,:,1)+p;
else
    result(:,:,1) = p + I(:,:,1) - 360;
end
% for i=1:m
%     for j=1:n
%         if(I(i,j,1)+p)<360
%             result(i,j,1) = I(i,j,1)+p;
%         else
%             result(i,j,1) = p + I(i,j,1) - 360;
%         end
%     end
% end
result(:,:,2) = I (:,:,2);
result(:,:,3) = I (:,:,3);

end

