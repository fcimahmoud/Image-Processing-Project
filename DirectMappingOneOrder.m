function inputImage = DirectMappingOneOrder(inputImage, fact)
inputImage=imread(inputImage);
[r,c,ch] = size(inputImage);
new_r = r * fact;
new_c = c * fact;
outputImage = zeros(new_r, new_c, ch);

for k = 1 : ch
    for i = 1 : r
        for j = 1 : c
            outputImage(i*fact+1-fact, j*fact+1-fact, k) = inputImage(i,j,k);
        end
    end
end

for k = 1 : ch
    for i = 1 : r
        x = 1 + (i-1) * fact;
        for j = 1 : c
            c = 1;
            if(j + 1 > c)
                max = inputImage(i,j,k);
                min = inputImage(i,j,k);
                y = 1 + (j-1) * fact;
                d = 1;
            elseif(inputImage(i,j,k) > inputImage(i,j+1,k))
                max = inputImage(i,j,k);
                min = inputImage(i,j+1,k);
                y = 1 + j * fact;
                d = -1;
            else
                max = inputImage(i,j+1,k);
                min = inputImage(i,j,k);
                d = 1;
                y = 1 + (j-1) * fact;
            end 
            while( c <= fact - 1)
                outputImage(x,y,k) = round((max-min)/fact * c + min);
                y = y + d;
                c = c + 1;
            end
        end
    end
end

for k = 1 : ch
    for i = 1 : new_c
        for j = 1 : r
            curRow = 1 + (j-1) * fact;
            nextRow = 1 + j * fact;
            c = 1;
            if(j + 1 > r)
                max = outputImage(curRow,i,k);
                min = outputImage(curRow,i,k);
                y = curRow;
                d = 1;
            elseif(outputImage(curRow,i,k) > outputImage(nextRow,i,k))
                max = outputImage(curRow,i,k);
                min = outputImage(nextRow,i,k);
                y = nextRow;
                d = -1;
            else
                max = outputImage(nextRow,i,k);
                min = outputImage(curRow,i,k);
                y = curRow;
                d = 1;
            end
            while(c <= fact - 1)
                y = y + d;
                outputImage(y,i,k) = round((max-min)/fact * c + min);
                c = c + 1;
            end
        end
    end
end

outputImage = uint8(outputImage);

end