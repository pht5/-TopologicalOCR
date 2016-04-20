%Returns histogram of a grayscale, 2-d image:
function hist = histMake(img)
    hist = zeros(1, 256);
    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            k = img(i,j);
            hist(k+1) = hist(k+1) + 1;
        end
    end
    hist = hist./sum(hist);
end