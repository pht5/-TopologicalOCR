classdef letterData < handle
    %This class holds all letter data, including both training and test,
    %and can be used to view the data and extract features. 
    %Heavily based on powerData.m (Bradbury, Huettel, 2015)
    properties
        data = []; %This will be a 3-dimensional matrix made up of many images
        type = []; %The different letters (capital A-Z for now)
        nImages = []; 
        features = [];
        
        uniqueType     = [] ;   % A unique list of types
        nType          = [] ;   % Number of distinct types
        countType      = [] ;   % The number of observations of each type
    end
    
    methods
        function D = letterData()
            %initializer
        end
        
        function viewData(D)
            %View images, may or may not be implemented
        end
        
        function extractFeatures(D)
            % Initialize the receptable for the features to be extracted to
            nFeatures = 1;
            D.features = nan(D.nImages,nFeatures) ;
            
            % Extract features from each of the power time series
            for i = 1:D.nImages
                D.features(i,1) = min(D.data(1,1,i)) ; % 100th value in the timeseries
            end       
        end
    end  
  
end
