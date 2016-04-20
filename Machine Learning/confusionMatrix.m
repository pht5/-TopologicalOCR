function [accuracy,scaledConfusion] = confusionMatrix( classLabels,classEstimates,plotMatrix )
%PLOTCONFUSIONMATRIX Plots a confusion matrix for the input data

[confusion,labels] = confusionmat(classLabels,classEstimates) ;
% confusion = confusion' ;
accuracy = sum(diag(confusion)) / sum(confusion(:)) ;

% confusionDivider = repmat(sum(confusion,1),size(confusion,2),1) ;
confusionDivider = repmat(sum(confusion,2),1,size(confusion,1)) ;
scaledConfusion  = confusion ./ confusionDivider ;

% Plot the confusion matrix
if plotMatrix
    imagesc(1-scaledConfusion); colormap gray
    nLabels = size(scaledConfusion,1) ;
    % Plot the lines between pizels of the confusion matrix
    for i = 1:nLabels+1
        line([0.5 nLabels + 0.5],i*ones(1,2)-0.5,'color','k') ; % Plot horizontal lines
        line(i*ones(1,2)-0.5,[0.5 nLabels + 0.5],'color','k') ; % Plot vertical lines
    end
    for i = 1:nLabels
        for j = 1:nLabels
            toPrint = sprintf('%4.1f%%',scaledConfusion(i,j)*100) ;
            if scaledConfusion(i,j) > 0.75
                text(j,i,toPrint,...
                    'horizontalAlignment', 'center',...
                    'verticalAlignment', 'middle',...
                    'FontSize',12,...
                    'color','w')
            else
                text(j,i,toPrint,...
                    'horizontalAlignment', 'center',...
                    'verticalAlignment', 'middle',...
                    'FontSize',12,...
                    'color','k')
            end
        end
        % Place the number of instances of each type on the right of the plot
        nValues = sum(strncmp(labels{i},classLabels(:),50)) ;
        text(nLabels + 1,i,sprintf('[%g]',nValues))
    end
    
    text(nLabels/2,nLabels+1,sprintf('Accuracy = %4.2f%%',accuracy*100))
    ylabel('True Label')
    xlabel('Assigned Label')
    set(gca,'XTick',1:nLabels,'XTickLabel',labels)
    set(gca,'YTick',1:nLabels,'YTickLabel',labels)
    set(gca,'XAxisLocation','top')
    rotateXLabels(gca, 45)
%     set(gca,'XTickLabelRotation',45)
end
end
