function img_edges = EdgeDetectionFilter(im)

% Convert the image to grayscale
if (size(im, 3) == 3)
    pic_gray = grayLuminance(im);
else
    pic_gray = im;
end

% Convert the grayscale image to double format
pic_gray = double(pic_gray);
[row,col] = size(pic_gray);

% Define the edge detection filter mask
% Sobel_mask = [-1 0 1; -2 0 2; -1 0 1];
mask = [1 1 1; 1 -8 1; 1 1 1];
mask_size = size(mask, 1);
pad_size = floor(mask_size / 2);

% Pad the grayscale image with replicated pixels on all sides
img_padded = padarray(pic_gray, [pad_size pad_size], 'replicate', 'both');

% Apply the edge detection filter to the padded image
img_edges = zeros(size(pic_gray));
for i = 1 : row
    for j = 1 : col
        temp = sum(sum(img_padded(i:i+mask_size-1, j:j+mask_size-1) .* mask));
        if temp >= 128
            temp = 1;
        else
            temp = 0;
        end
        img_edges(i,j) = temp;
    end
end


pic_gray = uint8(pic_gray);




end