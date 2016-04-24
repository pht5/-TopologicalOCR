function PC = imageToPointCloud(image, testing, groupSize)
    %Testing only:
%     if(testing)
%     image = rgb2gray(image);
%     end
    %Given a grayscale image, makes a point-cloud (numPoints x 2 array)
    %where each point a group of pixels, in which some are black
    [R,C] = size(image);
%     %For testing only:
    if(testing)
    newImage = zeros(R,C);
    end
    %Try a hard-coded threshold, change later if have time:
    threshold = 120;
    %Unfortunately, we can't pre-allocate PC, don't know how many points
    PC = [];
    counter = 1;
    for i = 1:groupSize:R-groupSize+1
        for j = 1:groupSize:C-groupSize+1
            %Take a groupsize X groupsize section of image:
            section = image(i:(i+groupSize-1),j:(j+groupSize-1));
            [rowInd, colInd] = find(section<=threshold);
            hasBlack = length([rowInd,colInd]);
            if(hasBlack)
                %Place dot according to where black actually is:
                rLoc = round(mean(rowInd));
                cLoc = round(mean(colInd));
%                 rLoc = floor(groupSize/2);
%                 cLoc = floor(groupSize/2);
                PC(counter,1) = i + rLoc;
                PC(counter,2) = j + cLoc;
                counter = counter + 1;
                %Testing only:
                if(testing)
                newImage(i + rLoc,j + cLoc) = 255;
                end
            end
        end
    end
    %Testing only:
    if(testing)
    figure()
    clf
    imshow(newImage);
    end
end