%
% Uses an instance of letterData to perform k-nearest-neighbor classifier
DCL = [];
size = 3;
switch size
    case 1
        load('testLetterDataSmall.mat'); 
        DCL = dataClassLetterSmall;
    case 2
        load('testLetterDataMedium.mat'); 
        DCL = dataClassLetterMedium;
    case 3
        load('letterImageData.mat'); 
        DCL = dataClassLetter;
    case 4
        DCL = dataClassLetterSpecial;
end
% Extract features
DCL.extractFeatures(5);

groups = DCL.type;
kFolds = 5;
crossValPartition = cvpartition(groups,'KFold',kFolds) ;

% For each of the k-Folds, train a kNN classifier on the training data
% features and test on the test features
classEstimates = []; 
classLabels = [];
for k = 1:kFolds
    % Get the data for the k-th fold
    trainIndices = crossValPartition.training(k) ;
    testIndices  = crossValPartition.test(k) ;
    
    % Train the classifier on the k-th fold
    knnModel = fitcknn(DCL.features(trainIndices,:),DCL.type(trainIndices)) ;
    classEstimatesFold = predict(knnModel,DCL.features(testIndices,:)) ;
    classLabelsFold = DCL.type(testIndices) ;
    
    % Store the results of classification for each fold
    classEstimates = [classEstimates ; classEstimatesFold] ;
    classLabels    = [classLabels ; classLabelsFold] ;
end

% Create the confusion matrix based on the estimates
figure(2)
accuracy = confusionMatrix( classLabels,classEstimates,1 ) ;