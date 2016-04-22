function PC = imageToPointCloud(image)
    %Testing only:
    image = rgb2gray(image);
    %Given a grayscale image, makes a point-cloud (numPoints x 2 array)
    %where each point is a black pixel in the image
    [R,C] = size(image);
    %For testing only:
    newImage = zeros(R,C);
    %Try a hard-coded threshold, change later if have time:
    threshold = 120;
    %Unfortunately, we can't pre-allocate PC, don't know how many points
    PC = [];
    counter = 1;
    for i = 1:R
        for j = 1:C
            if(image(i,j) <= threshold)
                PC(counter,1) = i;
                PC(counter,2) = j;
                counter = counter + 1;
                newImage(i,j) = 255;
            end
        end
    end
    %Testing only:
    figure()
    clf
    imshow(newImage);
end