function [ result ] = padColorImage( row,col,val1,val2,val3,I )
%   padColorImage pads a color image at front and bottom with padding
%   having values 'val1/val2/val3' in respective planes
%   row x col is the required padding for rows and columns
%   val1/val2/val3 are the values for padding in respective planes
%   I is the input color image
%   result is the padded image

[m n o] = size(I);
result = zeros(m+row,n+col,o);
%1st plane
result(:,:,1) = padImage(row,col,val1,I(:,:,1));
%2nd plane
result(:,:,2) = padImage(row,col,val2,I(:,:,2));
%3rd plane
result(:,:,3) = padImage(row,col,val3,I(:,:,3));


end

