%Preprocessing image to get a point-cloud for topological analysis
%Take in image, return new image with background all 255's, foreground all
%0's
function newImage = segment(img)
    %Make the histogram:
    %hist = histMake(img);
%     %Use Otsu's algorithm to find threshold:
%     q1 = zeros(1, 256);
%     q2 = zeros(1, 256);
%     u1 = zeros(1, 256);
%     u2 = zeros(1, 256);
%     q1(1) = hist(1);
%     q2(1) = 1-hist(1);
%     u1(1) = 0;
%     u2(1) = sum(((1:256) - 1).*hist)./q2(1);
%     for t = 2:256
%         q1(t) = q1(t-1) + hist(t);
%         q2(t) = q2(t-1) - hist(t);
%         %u1 is tricky - see if there's a more elegant solution:
%         if q1(t) == 0 && hist(t) == 0
%             u1(t) = u1(t-1) + t;
%         else
%         u1(t) = u1(t-1) + t*hist(t)/q1(t);
%         end
%         u2(t) = u2(t-1) - t*hist(t)/q2(t);
%     end
%     BetweenClassVariance = q1.*q2.*(u1-u2).^2;
%     figure(3)
%     clf
%     plot(BetweenClassVariance)
%     [~, threshold] = max(BetweenClassVariance);
    %threshold = graythresh(img).*255;
    %Now that we have our threshold, construct the new image:
    newImage = zeros(size(img, 1), size(img, 2));
    %newImage = newImage + 255;
    for i = 2:(size(img, 1)-1)
        for j = 2:(size(img, 2)-1)
          %  if img(i, j) < threshold;
                grad = max(abs([img(i,j)- img(i-1, j); img(i,j)- img(i+1, j);img(i,j)- img(i, j-1);img(i,j)- img(i, j+1)]));
                if mod(i, 100) == 0 && mod(j, 100) == 0
                    grad
                end
                newImage(i,j) = grad;
          %  end
        end
    end
end
% 
% %This was copied from online. See why it works, while yours doesn't:
% function level = otsu(histogramCounts, total)
% %% OTSU automatic thresholding method
% sumB = 0;
% wB = 0;
% maximum = 0.0;
% sum1 = sum((0:255).*histogramCounts);
% for ii=1:256
%     wB = wB + histogramCounts(ii);
%     if (wB == 0)
%         continue;
%     end
%     wF = total - wB;
%     if (wF == 0)
%         break;
%     end
%     sumB = sumB +  (ii-1) * histogramCounts(ii);
%     mB = sumB / wB;
%     mF = (sum1 - sumB) / wF;
%     between = wB * wF * (mB - mF) * (mB - mF);
%     if ( between >= maximum )
%         level = ii;
%         maximum = between;
%     end
% end
% end