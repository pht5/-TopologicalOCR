APC = imageToPointCloud(rgb2gray(imread('Z1.png')),0);

distances = pdist(APC);
dm = squareform(distances);
%compute persistence from distance matrix
distanceBoundOnEdges = 0.8*max(distances);
init;
[I,J] = rca1dm(dm,distanceBoundOnEdges);
sortedI = sortbypersistence(I);

figure;plot(sortedI(:,3),'r*');
%choose appropriate title and axis labels
title(sprintf('Sorted Persistence List'));
xlabel('Ranking');
ylabel('Persistence');