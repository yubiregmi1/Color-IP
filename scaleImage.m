function [ result ] = scaleImage(p,q, I )
%   scale a 2D image
%   I is the input image
%   p and q are desired rows and columns

[m n] = size(I);

%padding the image by one layer of zeros 
I = vertcat(zeros(1,n),I,zeros(1,n));
I = horzcat(zeros(m+2,1),I,zeros(m+2,1));

%scaling factors:
factor_x = (p-1)/(m-1); factor_y = (q-1)/(n-1);   

%result = zeros(p,q);
%to calculte dx and dy later
x=0; y=0;
dx = 1; dy = 1;

%k and l used in indexing result image; b and a to calculate new values of x and y
k=1;l=1;
a=1;b=1;

for i = 1:(1/factor_x):m
    for j = 1:(1/factor_y):n 
        
        result(k,l) = (1-dy)*[(1-dx)*double(I(round(i),round(j)))+dx*double(I(round(i+1),round(j)))]...
                        + dy*[(1-dx)*double(I(round(i),round(j+1)))+dx*double(I(round(i+1),round(j+1)))];
        
        
        new_y = a*(1/factor_y);
        dy = new_y - y;
        y = new_y;
        a = a+1;
        
        l=l+1;
    end
    
    new_x = b*(1/factor_x);
    dx = new_x - x;
    x = new_x;
    b = b+1;
    
    l = 1;a = 1;dy = 1;        %resetting values of l,a and dy for next row of pixels
    
    k = k+1;            
end


end

