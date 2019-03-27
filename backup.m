function hole = backup(I)

% we get the holes
Ipross = 1-im2bw(I);
imshow(Ipross);
% clean the holes
SE = strel('square',5);
SE2= strel('square',2);
SE3 = strel('square',3);
%cleans the immage to make it more square 
IE = imclose(Ipross,SE);
IE = imopen(IE,SE2);
IE = imdilate(IE,SE3);
%gets the edge blobs removed.
Im = imclearborder(IE,8);
%we can ge the the area of the blobs and put in a histogram.
[L,N] = bwlabel(IE);

figure, imshow(label2rgb(L));
f = regionprops(L);

% histogram
areas = cat(2,f(:).Area);

histogram(areas);
end