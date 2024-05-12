function outputImage = DirectMappingZeroOrder(inputImage, scaleFactor)
    inputImage= imread(inputImage);
    
    [rows, cols, channels] = size(inputImage);
    newRows = ceil(rows * scaleFactor);
    newCols = ceil(cols * scaleFactor);
    
    outputImage = zeros(newRows, newCols, channels);

    for c = 1:channels
        for i = 1:newRows
            for j = 1:newCols
                % Compute corresponding pixel location in input image
                x = min(ceil(i / scaleFactor), rows);
                y = min(ceil(j / scaleFactor), cols);

                % Copy pixel value from input image to output image
                outputImage(i, j, c) = inputImage(x, y, c);
            end
        end
    end
    outputImage = uint8(outputImage);
end
