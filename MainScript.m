close all;
I = imread('29.jpg');
% we get the holes
Ipross = 1-im2bw(I);
imshow(Ipross);
% clean the holes
SE = strel('disk',2);
SE2= steel('disk',1);

IE = imclose(Ipross,SE);

figure, imshow(IE)
