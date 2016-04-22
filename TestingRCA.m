tic
for i = 1:5
imageName = sprintf('%c%d.png','O',i);
APC = imageToPointCloud(rgb2gray(imread(imageName)),0);
distances = pdist(APC);
dm = squareform(distances);
%compute persistence from distance matrix
%Change distLimit to optimize:
distLimit = 0.8;
distanceBoundOnEdges = distLimit*max(distances);
init;
I = rca1dm(dm,distanceBoundOnEdges);
sortedI = sortbypersistence(I);
end
disp('time is:')
toc


figure;plot(sortedI(:,3),'r*');
%choose appropriate title and axis labels
title(sprintf('Sorted Persistence List'));
xlabel('Ranking');
ylabel('Persistence');