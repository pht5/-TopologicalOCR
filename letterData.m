classdef letterData < handle
    %This class holds all letter data, including both training and test,
    %and can be used to view the data and extract features. 
    %Heavily based on powerData.m (Bradbury, Huettel, 2015)
    properties
        data = []; %This will be a cell array made up of many images
        type = []; %The different letters (capital A-Z)
        nImages = []; 
        features = [];
        
        uniqueType     = [] ;   % A unique list of types
        nType          = [] ;   % Number of distinct types
        countType      = [] ;   % The number of observations of each type
    end
    
    methods
        function D = letterData()
            imagesPerChar = 5;
            %The characters recognized by the classifier. We'll use the
            %capital letters:
            D.uniqueType = {'A','B','C','D','E','F','G','H','I','J','K',...
                'L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}';
            D.nType = length(D.uniqueType);
            D.countType = zeros(D.nType, 1) + imagesPerChar;
            D.nImages = imagesPerChar*D.nType;
            D.data = cell(D.nImages, 1);
            D.type = cell(D.nImages, 1);
            %Fill data with grayscale images of capital letters. Images
            %contained in HandwritingData:
            for i = 1:D.nType
                for j = 1:imagesPerChar
                    imageName = sprintf('%c%d.png',D.uniqueType{i},j);
                    image = imread(imageName);
                    numImage = imagesPerChar*(i-1)+j;
                    D.data{numImage} = rgb2gray(image);
                    D.type{numImage} = D.uniqueType{i};
                end
            end
        end
        
        function viewData(D)
            %View selected images:
            spacing = 5;
            figure()
            for i = 1:spacing:length(D.data)
               imshow(D.data{i});
               pause(0.3);
            end
        end
        
        function extractFeatures(D)
            % Initialize the receptable for the features to be extracted to
            nFeatures = 1;
            D.features = nan(D.nImages,nFeatures) ;
            
            % Extract features from each of the power time series
            for i = 1:D.nImages
                image = D.data{i};
                D.features(i,1) = image(1,1) ; % 1st pixel in image
            end       
        end
    end  
  
end