%% Find rightmost point in convex hull, find longer of 


%Will take in a point-cloud and return the point cloud mirrored along the 
%longest line in it's convex hull
%function mirroredPC = convexHullMirror(PC)
for i = 1:5
    imageName = sprintf('%c%d.png','A',i);
    PC = imageToPointCloud(rgb2gray(imread(imageName)),0,1);
    ch = convhull(PC);
    maxLoc = [];
    maxLocNext = [];
    maxDist = 0;
    for k = 1:length(ch)
        firstPoint = [PC(ch(k),1),PC(ch(k),2)];
        if k == length(ch)
           nextPoint = [PC(ch(1),1),PC(ch(1),2)];
        else
           nextPoint = [PC(ch(k+1),1),PC(ch(k+1),2)];
        end
        dist = sqrt((firstPoint(1)-nextPoint(1))^2 + (firstPoint(2)-nextPoint(2))^2);
        if(dist > maxDist)
            maxLoc = firstPoint;
            nextMaxLoc = nextPoint;
            maxDist = dist;
        end 
    end
    figure(i); clf;
    plot(PC(:,1),PC(:,2), 'b.', [maxLoc(1), nextMaxLoc(1)], [maxLoc(2), nextMaxLoc(2)], 'r-');
    %Try flipping around longest edge
end
    
    
%end