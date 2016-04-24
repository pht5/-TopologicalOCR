function numCycles = computeNumCycles(I, groupSize)
threshold = groupSize;
if isempty(I)
    numCycles = 0;
else
    numCycles = sum(I(:,3) > threshold);
end
end