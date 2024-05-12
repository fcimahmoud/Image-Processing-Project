function outputImage = histogramEqualization(inputImage)

[row, col, ch] = size(inputImage);
numofpixels = row*col;
outputImage = zeros(row,col,ch);

inputImageSecVer=inputImage;


pixelr = zeros(256,1);
pixelg = zeros(256,1);
pixelb = zeros(256,1);

runsumr = zeros(256,1);
runsumg = zeros(256,1);
runsumb = zeros(256,1);

dividedr = zeros(256,1);
dividedg = zeros(256,1);
dividedb = zeros(256,1);

outputr = zeros(256,1);
outputg = zeros(256,1);
outputb = zeros(256,1);

for i = 1 : size(inputImage,1)
    for j = 1 : size(inputImage,2)
        value = inputImage(i,j,1);
        if(value==0)
            value=1;
        end
        pixelr(value)=pixelr(value)+1;
        
        value=inputImage(i,j,2);
        if(value==0)
            value=1;
        end
        pixelg(value)=pixelg(value)+1;
        
        value=inputImage(i,j,3);
        if(value==0)
            value=1;
        end
        pixelb(value)=pixelb(value)+1;

    end

end


sumr=0;
sumg=0;
sumb=0;

no_bins=255;

for i=1:256

   sumr=sumr+pixelr(i);
   runsumr(i)=sumr;
   dividedr(i)=runsumr(i)/numofpixels;
   outputr(i)=round(dividedr(i)*no_bins);
   
   sumg=sumg+pixelg(i);
   runsumg(i)=sumg;
   dividedg(i)=runsumg(i)/numofpixels;
   outputg(i)=round(dividedg(i)*no_bins);
   
   sumb=sumb+pixelr(i);
   runsumb(i)=sumb;
   dividedb(i)=runsumb(i)/numofpixels;
   outputb(i)=round(dividedb(i)*no_bins);

end

for i=1:row

    for j=1:col

        if(inputImage(i,j,1)==0)
            inputImage(i,j,1)=1;
        end
        outputImage(i,j,1)=outputr(inputImage(i,j,1));
        
        if(inputImage(i,j,2)==0)
            inputImage(i,j,2)=1;
        end
        outputImage(i,j,2)=outputr(inputImage(i,j,2));
        
        if(inputImage(i,j,3)==0)
            inputImage(i,j,3)=1;
        end
        outputImage(i,j,3)=outputr(inputImage(i,j,3));

    end

end

inputImage=inputImageSecVer;
inputImage=uint8(inputImage);
outputImage=uint8(outputImage);

end