function Img = ImproveImage(A,bright)

    Agray = rgb2gray(A);

    % subplot(2,1,1), imshow(A), title('OG image');

    AInv = imcomplement(Agray);
    BInv = imreducehaze(AInv, 'Method','approx','ContrastEnhancement','none');
    BImp = imcomplement(BInv);

    B = imguidedfilter(BImp);

    % set bright variable to yes if you want high flash in image
    if bright == 'yes'
        B = B-20;
    end

    Img = B;

    % subplot(2,1,2), imshow(B), title('better fixed image');
end
