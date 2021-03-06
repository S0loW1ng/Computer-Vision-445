function [horizontalThreadCount] = HorizontalThreadCount(img)
%HORIZONTALTHREADCOUNT Summary of this function goes here
%   Detailed explanation goes here
I2 = im2bw(img,0.3);
I2 = 1-I2;
SE = strel('square',10);
SE2 = strel('line',150,0);
I3 = imdilate(I2,SE);
SE = strel('square',15);
I3 = imdilate(I3,SE2);
I4 = imopen(I3,SE);

imshow(I2);
imshow(I3);
imshow(I4);
I5 = 1 - I4;
imshow(I5);


[r,c,layers] = size(I5);

left = I5(1:2,1:c);
right = I5(r-1:r,1:c);
[B,leftItems] = bwlabel(left,8);

[C,rightItems] = bwlabel(right,8);

I6 = zeros(r+2,c);
I6 = 1 - I6;
I6(2:r+1,1:c) = I5;
imshow(I6);
[A,totalItems] = bwlabel(I6,8);

if leftItems == 0
    totalItems = totalItems-1;
end
if rightItems == 0
    totalItems = totalItems-1;
end


horizontalThreadCount = totalItems;
end

