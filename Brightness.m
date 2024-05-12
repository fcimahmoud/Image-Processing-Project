function outputImage = Brightness(im, offset)


[row, col, ch] = size(im);
outputImage = zeros(row, col, ch);

for k = 1 : ch
    for i = 1 : row
        for j = 1 : col
            new_val = im(i,j,k) + offset;
            
            %post_processing /Cut off the rang :)
            if(new_val > 255)
                new_val = 255;
            end
            if(new_val < 0)
                new_val = 0;
            end
            
            outputImage(i,j,k) = new_val;
        end
    end
end

outputImage = uint8(outputImage);

end