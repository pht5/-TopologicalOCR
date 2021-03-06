        function sortedI = findPersistences(PointCloud)
            distLimit = 0.8;
            distances = pdist(PointCloud);
            dm = squareform(distances);
            %compute persistence from distance matrix
            %Change distLimit to optimize:
            distanceBoundOnEdges = distLimit*max(distances);
            I = rca1dm(dm,distanceBoundOnEdges);
            sortedI = sortbypersistence(I);
        end