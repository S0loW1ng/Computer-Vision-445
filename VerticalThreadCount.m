function [vertCount] = VerticalThreadCount(img)
%VERTICALTHREADCOUNT Summary of this function goes here
%   Detailed explanation goes here

I2 = im2bw(img,0.3);
I2 = 1-I2;
SE = strel('square',15);
SE2 = strel('line',90,90);
I3 = imdilate(I2,SE);
SE = strel('square',15);
I3 = imdilate(I3,SE2);
I4 = imopen(I3,SE);
imshow(I);
imshow(I2);
imshow(I3);
imshow(I4);
I5 = 1 - I4;
imshow(I5);


[r,c,layers] = size(I5);
I6 = zeros(r,c+2);
I6 = 1 - I6;
I6(1:r,2:c+1) = I5;
imshow(I6);
[A,totalItems] = bwlabel(I6,8);
vertCount = totalItems;

end
