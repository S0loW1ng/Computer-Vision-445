close all;
I= imread('INTERT/1.jpg');
imshow(I);
Igry = rgb2gray(I);

J = histeq(Igry);
figure, imshow(J);
BW = imbinarize(J);
figure, imshow(BW);
BW = 1- BW;
SE = strel('line', 35, 90)

BW = imopen(BW,SE);
figure, imshow(BW);
E= edge(BW,'canny',[],5);
figure ,imshow(I); title("Lines");

[H,T,R] = hough(E);
peaks = houghpeaks(H,100,'Threshold',10);
lines = houghlines(E,T,R,peaks,'FillGap',15,'MinLength',1);
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    line(xy(:,1),xy(:,2),'LineWidth',3,'Color','r');
end