
I= imread('INTERT/1.jpg');
imshow(I);
Igry = rgb2gray(I);

J = histeq(Igry);
%figure, imshow(J);
BW = imbinarize(J);
%figure, imshow(BW);
BW = 1- BW;
SE = strel('line', 40, 90);

BW = imopen(BW,SE);
%figure, imshow(BW);
E= edge(BW,'canny',[],3);
figure ,imshow(E); title("Lines");
% Potential improvement later.
% [H,T,R] = hough(E);
% peaks = houghpeaks(H,125,'Threshold',30);
% lines = houghlines(E,T,R,peaks,'FillGap',20,'MinLength',1);
s = size(E);
c1 = 0;
c2 = 0;
D = padarray(E,[1 1],'both');
o = s(1);
for i = 1:s(2)
    if((D(18,i) == true) &&(D(18,i+1) == false))
        c1=c1+1;
    end
end

Strings = c1/2;