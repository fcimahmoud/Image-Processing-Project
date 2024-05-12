function outputImage = grayAveraging(inputImage)
inputImage=imread(inputImage);

outputImage = (inputImage(:,:,1)+inputImage(:,:,2)+inputImage(:,:,3))/3;

outputImage = uint8(outputImage);

end