function output_img = WeightedFilter(im, sigma)

% function [mask,mask_size] = GuassianFilter(sigma)

N = floor(3.7*sigma-0.5);
mask_size = 2*N+1;
t = floor(mask_size/2);
x = (-t:t);
mask = zeros(mask_size,mask_size);
coef = (1/(2*pi*(sigma^2)));

for i = 1 : mask_size
   for j = 1 : mask_size
       mask(i,j) = coef*exp(-((x(i)^2)+(x(j)^2))/(2*(sigma^2)));
   end
end

im = double(im);
output_img = zeros(size(im));

boundary = floor(mask_size/2);
paddingImage = padarray(im, [boundary boundary], 'replicate', 'both');
[row,col,ch] = size(paddingImage);

for k = 1 : ch
    for i = 1 : row - mask_size + 1
        for j = 1 : col - mask_size + 1
            temp = paddingImage(i : i+mask_size-1, j : j+mask_size-1, k);
            temp = double(temp);
            conv = temp.*mask;
            output_img(i,j,k) = sum(conv(:));
        end
    end
end

output_img = uint8(output_img);


end