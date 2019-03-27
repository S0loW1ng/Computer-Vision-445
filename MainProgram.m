I = imread('24.jpg');

%We get the image clean Eunice and Yue
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
    %count interThreads
    inter = InterFunction(I)
end