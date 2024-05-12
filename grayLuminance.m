function outputImage = grayLuminance(inputImage)

%inputImage=imread(inputImage);
outputImage = 0.3*inputImage(:,:,1) + 0.59*inputImage(:,:,2) + 0.11*inputImage(:,:,3);

outputImage = uint8(outputImage);

end