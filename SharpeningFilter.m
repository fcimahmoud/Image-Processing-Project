function Sharp_img = SharpeningFilter(im)

% Convert the image to double format
im = double(im);
[row,col,ch] = size(im);

% Define the sharpening filter mask
sharp_mask = [0 -1 0; -1 5 -1; 0 -1 0];
mask_size = size(sharp_mask, 1);
pad_size = floor(mask_size / 2);

% Pad the image with replicated pixels on all sides
img_padded = padarray(im, [pad_size pad_size], 'replicate', 'both');

% Apply the sharpening filter to the padded image
Sharp_img = zeros(size(im));
for k = 1 : ch
    for i = 1 : row
        for j = 1 : col
            temp = sum(sum(img_padded(i:i+mask_size-1, j:j+mask_size-1,k) .* sharp_mask));
            if temp > 255
                temp = 255;
            end
            if temp <= 0
                temp = 0;
            end
            Sharp_img(i,j,k) = temp;
        end
    end
end


Sharp_img = uint8(Sharp_img);

end