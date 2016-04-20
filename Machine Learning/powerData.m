classdef powerData < handle
    %POWERDATA Class for processing power meter data
    %
    % Relevant methods
    %
    %   viewTraces() Plots each of the time-series traces of power data
    %
    %   extractFeatures() Extracts features from the high-dimensional data
    %
    %   plotClusters() Plots clusters of features
    properties
        % Key properties
        data     = [] ;         % Stores the data where each row is an observation of power over time at 1-second intervals
        category = [] ;         % The general category of the device
        type     = [] ;         % The specific identifier for the exact type of device (if there are two lamps, this distinguishes one lamp from another)
        catType  = [] ;         % This is a concatenated string of category and type
        nTraces  = [] ;         % Total number of power traces (number of observations)
        features = [] ;         % This contains a matrix of features extracted from data (this should have the same number of rows as 'data')
        
        % Other properties
        uniqueCategory = [] ;   % A unique list of categories
        uniqueType     = [] ;   % A unique list of types
        uniqueCatType  = [] ;   % A unique list of concatenated strings of categories and type
        nCategory      = [] ;   % Number of distinct categories
        nType          = [] ;   % Number of distinct types
        nCatType       = [] ;   % Number of distinct concatenated strings of categories and type
        countCategory  = [] ;   % The number of observations of each category
        countType      = [] ;   % The number of observations of each type
        countCatType   = [] ;   % The number of observations of each concatenated strings of categories and type
    end
    
    methods
        %------------------------------------------------------------------
        % powerdata
        %------------------------------------------------------------------
        function D = powerData()
            % Used for loading raw data - not needed for this module
        end
        
        %------------------------------------------------------------------
        % viewTraces
        %------------------------------------------------------------------
        function viewTraces(D)
            % Runs through power traces one by one
            for i = 1:D.nTraces ;
                plot(D.data(i,:)) ;
                title(D.category{i}) ;
                pause ;
            end
        end
        
        %------------------------------------------------------------------
        % extractFeatures
        %------------------------------------------------------------------
        function extractFeatures(D)
            % In this function, you want to extract features that will lead
            % to the best classification performance as measured in the
            % confusion matrix a sample below is given. The performance of
            % this approach is sub-optimal so you should adjust it - you
            % can adjust the features as well as the number of features
            % (there are two in the given example here).
            
            % Initialize the receptable for the features to be extracted to
            nFeatures = 2 ;
            D.features = nan(D.nTraces,nFeatures) ;
            
            % Extract features from each of the power time series
            for i = 1:D.nTraces
                D.features(i,1) = min(D.data(i,100)) ; % 100th value in the timeseries
                D.features(i,2) = min(D.data(i,500)) ; % 500th value in the timeseries
            end            
            
        end
        
        %------------------------------------------------------------------
        % plotClusters
        %------------------------------------------------------------------
        function plotClusters(D)
            figure
            clf
            % Plots clusters of features of 1 or 2 dimensions - adjust as necessary!
            if size(D.features,2) == 1
                % This plots the data with some noise to 'spread the values
                % out'
                gscatter(D.features(:,1),randn(size(D.features(:,1))),D.category,'rgbkmc','s.odv',12,'on') ;
                set(legend,'FontSize',12)
                xlabel('Feature 1')
                ylabel('')
            elseif size(D.features,2) == 2
                gscatter(D.features(:,1),D.features(:,2),D.category,'rgbkmc','s.odv',12,'on') ;
                set(legend,'FontSize',12)
                xlabel('Feature 1')
                ylabel('Feature 2')
            end
        end
    end
end
