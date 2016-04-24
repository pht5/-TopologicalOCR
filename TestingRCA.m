init;
distLimit = 0.8;
numCycles = zeros(5,5);
for i = 1:5
    imageName = sprintf('%c%d.png','O',i);
    APC1 = imageToPointCloud(rgb2gray(imread(imageName)),0,5);
    for j = 1:4
        APC = PCMirror(APC1,j);
        %compute persistence from distance matrix
        %Change distLimit to optimize:
        distances = pdist(APC);
        dm = squareform(distances);
        distanceBoundOnEdges = distLimit*max(distances);
        I = rca1dm(dm,distanceBoundOnEdges);
        sortedI = sortbypersistence(I);
        %Set a threshold, compute numCycles:
        threshold = 7;
        numCycles(i,j+1) = sum(sortedI(:,3) > threshold);
        %Show persistences and PC
        figure;plot(sortedI(:,3),'r*');
        title(sprintf('Sorted Persistence List'));
        xlabel('Ranking');
        ylabel('Persistence');
        showPC(APC);
    end
    
end
numCycles