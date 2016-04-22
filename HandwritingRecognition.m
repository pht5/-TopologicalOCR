% Uses an instance of letterData to perform k-nearest-neighbor classifier
load('letterimagedata.mat') 

% Extract features
dataClassLetter.extractFeatures ;

% TODO: figure out what this is and comment on it
groups = dataClassLetter.type;
kFolds = 10;
crossValPartition = cvpartition(groups,'KFold',kFolds) ;

% TODO: recomment all this when you understand it better:
% For each of the k-Folds, train a kNN classifier on the training data
% features and test on the test features
classEstimates = []; 
classLabels = [];
for k = 1:kFolds
    % Get the data for the k-th fold
    trainIndices = crossValPartition.training(k) ;
    testIndices  = crossValPartition.test(k) ;
    
    % Train the classifier on the k-th fold
    knnModel = fitcknn(dataClassLetter.features(trainIndices,:),dataClassLetter.type(trainIndices)) ;
    classEstimatesFold = predict(knnModel,dataClassLetter.features(testIndices,:)) ;
    classLabelsFold = dataClassLetter.type(testIndices) ;
    
    % Store the results of classification for each fold
    classEstimates = [classEstimates ; classEstimatesFold] ;
    classLabels    = [classLabels ; classLabelsFold] ;
end

% Create the confusion matrix based on the estimates
figure(2)
accuracy = confusionMatrix( classLabels,classEstimates,1 ) ;