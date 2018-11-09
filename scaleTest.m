function [ result ] = scaleTest( xscale,yscale,I )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

I = double(I);
sz=size(I); 
numchans=size(I,3); 
yy=linspace(1,sz(1),ceil(sz(1)*yscale)); 
xx=linspace(1,sz(2),ceil(sz(2)*xscale));

result=zeros([ceil(sz(1:2).*[yscale xscale]) 3]); 
for c=1:numchans 
result(:,:,c)=interp2(I(:,:,c),xx',yy,'bilinear'); 
end 

end

