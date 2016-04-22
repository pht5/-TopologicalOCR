PCC = imageToPointCloud(rgb2gray(imread('Z1.png')),1);
PCMir = PCMirror(PCC,1);
blankImage = zeros(100,200);
for i = 1:size(PCMir,1)
    blankImage(PCMir(i,1),PCMir(i,2)) = 255;
end
figure(); clf;
imshow(blankImage);