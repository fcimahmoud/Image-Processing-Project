function outputImage = grayDecomposing(inputImage)
inputImage=imread(inputImage);

[row,col,~] = size(inputImage);

outputImage = zeros(row,col);


for i = 1 : row
    for j = 1 : col
        
         outputImage(i, j) = min([inputImage(i, j, 1), inputImage(i, j, 2), inputImage(i, j, 3)]);
       % outputImage(i, j) = max([inputImage(i, j, 1), inputImage(i, j, 2), inputImage(i, j, 3)]);
      
    end
end

outputImage = uint8(outputImage);

end