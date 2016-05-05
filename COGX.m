function centerGravity = COGX(PC)
%Computes center of gravity in the x direction, as a percentage of total
%width
scaledX = (PC(:,2) - min(PC(:,2)))./(max(PC(:,2)) - min(PC(:,2)));
centerGravity = mean(scaledX);
end