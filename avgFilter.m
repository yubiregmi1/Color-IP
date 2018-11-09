function result = avgFilter(I,K)    %K is the size of square kernel
%function result = avgFilter(I)
[m n] = size(I);    %size of 2D image
    

I = vertcat(zeros(floor(K/2),m),I,zeros(floor(K/2),m));
I = horzcat(zeros(m+2*floor(K/2),floor(K/2)),I,zeros(m+2*floor(K/2),floor(K/2)));

%I = vertcat(zeros(4,256),I,zeros(4,256));
%I = horzcat(zeros(264,4),I,zeros(264,4));
result = zeros(m,n);

%i and j used to iterate through padded image
for i = ceil(K/2):(m+floor(K/2))
    for j = ceil(K/2):(m+floor(K/2))
        
        %temp_res holds unweighted sum from mask
        temp_res = 0;
        
        %k and j used to apply 5x5 mask
        for k = -floor(K/2):floor(K/2)
            for l = -floor(K/2):floor(K/2)
                temp_res = temp_res + double(I(i+k,j+l));
            end
        end
        
        result(i-floor(K/2),j-floor(K/2)) = temp_res/K^2;
        
    end
end

%r = uint8(result);  %r contains result image
%figure(1);
%ip_disp(r);
%title('Image after general averaging mask');