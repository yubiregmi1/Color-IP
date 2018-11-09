function result = RGBtoYCbCr(I)

sizeImage = size(I);

result = zeros(sizeImage(1),sizeImage(2),sizeImage(3));

%transformation matrix:
T = [0.2988 0.5869  0.1143; -0.1689 -0.3311 0.5; 0.5 -0.4189 -0.0811];

for i=1:sizeImage(1)
    for j=1:sizeImage(2)
        temp = T*[I(i,j,1);I(i,j,2);I(i,j,3)];
        result(i,j,1) = temp(1);    %Y component
        result(i,j,2) = temp(2);    %Cb component
        result(i,j,3) = temp(3);    %Cr component
    end
end