close all;
I = imread('INTERT/1.jpg');
%I = imread('25.jpg');

%We get the image clean Eunice and Yue
I = ImproveImage(I,'yes');
% we detec if there are holes or not Adrian
b = hasHoles(I);
% if holes
if( b == 1)
    %count holes
    backup(I);
    %Count threads
    verical = VerticalThreadCount(I);
    hori = HorizontalThreadCount(I);
    %if not
else
    %count interThreads
    inter = InterFunction(I);
end