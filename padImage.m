function [ result ] = padImage( row,col,value,I )
%   padImage Pads a 2D image at front and bottom with padding having 'value'
%   elements
%   row x col are padding required at row and column for original image
%   'value' is the value for padded part of the image
%   image is the original image
%   result is the result image

[m n]=size(I);
%result = zeros(m+row,n+col);
if (row~=0)
    row_padding = zeros(row,n)+(value);
    I = vertcat(I,row_padding);
end
if (col~=0)
    col_padding = zeros(m+row,col)+(value);
    I = horzcat(col_padding,I);
end



result = uint8(I);
end

