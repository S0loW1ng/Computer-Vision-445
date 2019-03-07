close all;
I = imread('29.jpg');
% we get the holes
Ipross = 1-im2bw(I);
imshow(Ipross);
% clean the holes
SE = strel('disk',5);
SE2= strel('disk',3);
SE3 = strel('square',10);
%cleans the immage to make it more square 
IE = imclose(Ipross,SE);
IE = imopen(IE,SE2);
IE = imopen(IE,SE3);
%gets the edge blobs removed.
Im = imclearborder(IE,8);
figure, imshow(Im)

%we can ge the the area of the blobs and put in a histogram.


