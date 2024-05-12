function unSharp_img = UnsharpMaskFilter(im, sigma)


blurred_img = WeightedFilter(im, sigma);

% Compute the gmask filtered image
pic_g = Subtraction(double(im), double(blurred_img));

% Add the gmask filtered image to the original image, scaled by the factor = 1
unSharp_img = Addition(double(im), pic_g);

% Clip the pixel values to the range [0, 255]
unSharp_img(unSharp_img < 0) = 0;
unSharp_img(unSharp_img > 255) = 255;

% Convert the image to uint8 format for display
unSharp_img = uint8(unSharp_img);



end