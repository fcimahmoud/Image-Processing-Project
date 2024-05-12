function outputImage = histogramEqualizationGray(inputImage)
  
    [row, col] = size(inputImage);
    numofpixels = row * col;
    outputImage = zeros(row, col);

    pixel = zeros(256, 1);
    runsum = zeros(256, 1);
    divided = zeros(256, 1);
    output = zeros(256, 1);

    for i = 1 : row
        for j = 1 : col
            value = inputImage(i, j);
            if value == 0
                value = 1;
            end
            pixel(value) = pixel(value) + 1;
        end
    end

    sum = 0;
    no_bins = 255;

    for i = 1:256
       sum = sum + pixel(i);
       runsum(i) = sum;
       divided(i) = runsum(i) / numofpixels;
       output(i) = round(divided(i) * no_bins);
    end

    for i = 1:row
        for j = 1:col
            if inputImage(i, j) == 0
                inputImage(i, j) = 1;
            end
            outputImage(i, j) = output(inputImage(i, j));
        end
    end

    outputImage = uint8(outputImage);
end
