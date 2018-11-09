function result = avgFilterColor(I,K,i)       %i is identifier for color model: 1:RGB, 2:HSI, 3:YCbCr
                                              %I is input color image
                                              %K is averaging kernel size
[m n o] = size(I); 

result = zeros(m,n,o);

switch i
    case 1
        result(:,:,1) = avgFilter(I(:,:,1),K);  %smooth R
        result(:,:,2) = avgFilter(I(:,:,2),K);  %smooth G
        result(:,:,3) = avgFilter(I(:,:,3),K);  %smooth B
    case 2
        result(:,:,1) = I(:,:,1);               %return H
        result(:,:,2) = I(:,:,2);               %return S
        result(:,:,3) = avgFilter(I(:,:,3),K);  %smooth I
    case 3
        result(:,:,1) = avgFilter(I(:,:,1),K);  %Filter Y
        result(:,:,2) = I(:,:,2);               %return Cb
        result(:,:,3) = I(:,:,3);               %smooth Cr
    otherwise
        disp('Color model not supported')

end