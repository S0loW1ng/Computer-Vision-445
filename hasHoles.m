function b = hasHoles(I)
   Ipross = 1-im2bw(I);
    figure, imshow(Ipross);
    % clean the holes
    SE = strel('square',5);
    SE2= strel('square',2);
    SE3 = strel('square',5);
    %cleans the image to make it more square 
    IE = imclose(Ipross,SE);
    IE = imopen(IE,SE2);
    IE = imdilate(IE,SE3);
    figure, imshow(IE);
    %gets the edge blobs removed.
    Im = imclearborder(IE,8);
    %if there are more than 10 blobs, this means that the image has holes in it
    %and it is ready for hole extraction. Also less than 1000 in the event of
    %many noise holes that did not get smoothed by the noise removal.
    [L,N] = bwlabel(Im);
    b = 0;
    if(N < 1000 && N > 10)
        b = 1;
    else
        b = 0;
    end
    %Get The average area of all holes in the image

    if(b == 1)
        f = regionprops(L);
        avgArea = 0;
        for i = 1:length(f)
            avgArea = avgArea + f(i).Area(1);
        end
        avgArea =avgArea/length(f); 
        %Get the standard deviation of the blobs
        sigma = 0;
        for i = 1:length(f)
            t = f(i).Area(1) - avgArea;
            sigma = sigma + (t*t);
        end
        sigma = sigma / length(f);
        sigma = sqrt(sigma);

        %count again leaving out the outliers. 
        count = 0;
        lb = avgArea -(1.5*sigma);
        hb = avgArea +(1.5*sigma);
        for i = 1:length(f)
            x = f(i).Area(1);
            if( x < hb && x > lb)
                count = count + 1;
            end
        end

        %Once again, if the new count is greater than 10 we can be fairly
        %certain that there are enough holes in the image to make an estimation
        %about the quality of the fabric.
        if(count < 1000 && count > 10)
            b = 1;
        else
            b = 0;
        end
    end
    %At the end, if the output is 1 there are approppriate holes, if it is
    %0 there are no appropriate holes.
end
