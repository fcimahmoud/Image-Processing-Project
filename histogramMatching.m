function [transformed_img, trans_histogram ,ref_gray_img,ref_histogram, gray_img,histogram] = histogramMatching(img, ref_img)
    % Convert images to grayscale
    if(size(img,3)==3)
    ref_gray_img = grayLuminance(ref_img);
    end
    if(size(ref_img,3)==3)
    gray_img = grayLuminance(img);
    end

    % Perform histogram equalization
    equalized_ref_img = histogramEqualizationGray(ref_gray_img);
    equalized_gray_img = histogramEqualizationGray(gray_img);

    % Compute histograms of the equalized images
    ref_histogram = computeHistogram(equalized_ref_img);
    histogram = computeHistogram(equalized_gray_img);

    % Compute cumulative distribution functions (CDFs)
    ref_cdf = computeCDF(ref_histogram);
    cdf = computeCDF(histogram);

    % Perform histogram matching
    transformed_img = zeros(size(gray_img), 'uint8');
    
    for i = 1:size(gray_img, 1)
        for j = 1:size(gray_img, 2)
            intensity = gray_img(i, j) + 1; % MATLAB arrays are 1-indexed
            transformed_intensity = findClosestCDFIndex(cdf, ref_cdf, intensity);
            transformed_img(i, j) = uint8(transformed_intensity - 1); % Adjust for MATLAB indexing
        end
    end

    % Display original and matched images
    trans_histogram = computeHistogram(equalized_ref_img);
   
end

function histogram = computeHistogram(image)
    histogram = zeros(1, 256);
    [rows, cols] = size(image);
    for i = 1:rows
        for j = 1:cols
            intensity = image(i, j) + 1; % Shift intensity to range [1, 256]
            histogram(intensity) = histogram(intensity) + 1;
        end
    end
end

function cdf = computeCDF(histogram)
    cdf = zeros(1, 256);
    sum = 0;
    for i = 1:256
        sum = sum + histogram(i);
        cdf(i) = sum;
    end
end

function index = findClosestCDFIndex(cdf, ref_cdf, intensity)
    [~, index] = min(abs(cdf - ref_cdf(intensity)));
end


