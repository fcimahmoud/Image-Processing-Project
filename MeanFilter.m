function output_img = MeanFilter(im, mask_size)

im = double(im);
output_img = zeros(size(im));


boundary = floor(mask_size/2);
paddingImage = padarray(im, [boundary, boundary], 'replicate', 'both');

[row,col,ch] = size(paddingImage);

mask = double(ones(mask_size, mask_size)/(mask_size^2));

for k = 1 : ch
    for i = 1 : row - mask_size + 1
        for j = 1 : col - mask_size + 1
            temp = paddingImage(i : i+mask_size-1, j : j+mask_size-1, k);
            conv = temp.*mask;
            output_img(i,j,k) = sum(conv(:));
        end
    end
end

output_img = uint8(output_img);

end