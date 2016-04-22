function showPC(PC)
blankImage = zeros(max(PC(:,1)),max(PC(:,2)));
for i = 1:size(PC,1)
    blankImage(PC(i,1),PC(i,2)) = 255;
end
figure(); clf;
imshow(blankImage);
end