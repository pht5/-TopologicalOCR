function scaledAverage = averageDistanceFromCenterX(PC)
centerX = (max(PC(:,2)) + min(PC(:,2)))./2;
distances = abs(PC(:,2) - centerX);
avgDistance = mean(distances);
%scale down by width of letter
scaledAverage = avgDistance./(max(PC(:,2)) - min(PC(:,2)));
end


