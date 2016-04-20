% Loads the data and sets up the powerData class
load('tracebasedata.mat')

% Extract features
dataClass.extractFeatures ;

% Plot cluster features (first two dimensions)
dataClass.plotClusters

% Create a cross validation object. This approach factors classes (or
% groups) into the sampling, so that each of the k-folds has a roughly
% equal number of samples from each class
groups = dataClass.category ;
kFolds = 10 ;
crossValPartition = cvpartition(groups,'KFold',kFolds) ;

% For each of the k-Folds, train a kNN classifier on the training data
% features and test on the test features
classEstimates = []; 
classLabels = [] ;
for k = 1:kFolds
    % Get the data for the k-th fold
    trainIndices = crossValPartition.training(k) ;
    testIndices  = crossValPartition.test(k) ;
    
    % Train the classifier on the k-th fold
    knnModel = fitcknn(dataClass.features(trainIndices,:),dataClass.category(trainIndices)) ;
    classEstimatesFold = predict(knnModel,dataClass.features(testIndices,:)) ;
    classLabelsFold = dataClass.category(testIndices) ;
    
    % Store the results of classification for each fold
    classEstimates = [classEstimates ; classEstimatesFold] ;
    classLabels    = [classLabels ; classLabelsFold] ;
end

% Create the confusion matrix based on the estimates
figure(2)
accuracy = confusionMatrix( classLabels,classEstimates,1 ) ;