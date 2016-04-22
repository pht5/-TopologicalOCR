init;
distLimit = 0.8;
tic
numCycles = zeros(5,1);
for i = 1:5
    imageName = sprintf('%c%d.png','C',i);
    APC1 = imageToPointCloud(rgb2gray(imread(imageName)),0);
    APC = PCMirror(APC1,1);
    distances = pdist(APC);
    dm = squareform(distances);
    %compute persistence from distance matrix
    %Change distLimit to optimize:
    distanceBoundOnEdges = distLimit*max(distances);
    I = rca1dm(dm,distanceBoundOnEdges);
    sortedI = sortbypersistence(I);
    letterHeight = range(APC(:,1));
    numCycles(i) = sum(sortedI(:,3) > letterHeight/20);
    figure;plot(sortedI(:,3),'r*');
    %choose appropriate title and axis labels
    title(sprintf('Sorted Persistence List'));
    xlabel('Ranking');
    ylabel('Persistence');
    showPC(APC);
end
disp('time is:')
toc
numCycles