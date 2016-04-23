PCC = imageToPointCloud(rgb2gray(imread('X1.png')),1);
PCMir = PCMirror(PCC,4);
showPC(PCMir);