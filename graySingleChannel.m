function outputImage = graySingleChannel(inputImage)
inputImage=imread(inputImage);

outputImage = inputImage(:,:,1);

end