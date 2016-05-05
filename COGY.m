function centerGravity = COGY(PC)
%Computes center of gravity in the y direction, as a percentage of total
%height
scaledY = (PC(:,1) - min(PC(:,1)))./(max(PC(:,1)) - min(PC(:,1)));
centerGravity = mean(scaledY);
end