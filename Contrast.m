function output_img = Contrast(New_max,New_min,im)

[row,col,ch] = size(im);
output_img = zeros(row,col,ch);

for k = 1 : ch
    i = im(:,:,ch);
    min_row = min(i);         % find the min. value of pixels in all the columns (row vector)
    old_min = min(min_row);   % find the min. value of pixel in the image
    max_row = max(i);         % find the max. value of pixels in all the columns (row vector)
    old_max = max(max_row);   % find the max. value of pixel in the image
    
    for i = 1 : row
        for j = 1 : col
            x = ((im(i,j,k)-old_min)/(old_max-old_min))*(New_max-New_min)+New_min;
            if x > 255
               x = 255;
            elseif x < 0
               x = 0;
            end
            output_img(i,j,k) = x;
        end
    end
end

output_img = uint8(output_img);


end