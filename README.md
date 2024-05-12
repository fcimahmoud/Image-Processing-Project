# Image Processing Project
This project focuses on image processing techniques and provides a collection of functions and filters to manipulate images. The project is implemented in MATLAB

## Functions and Filters
The project includes the following functions and filters:

![alt text](https://github.com/fcimahmoud/Image-Processing-Project.git/blob/[main]/Screen_Shots/Mapping.PNG?raw=true)


### DirectMappingZeroOrder:
    Performs zero-order direct mapping on the input image. This function directly maps pixel values from the input image to the output image without any modifications.
### ReverseMappingZeroOrder: 
    Applies zero-order reverse mapping on the input image. This function maps pixel values from the input image to the output image using a reverse mapping approach.
### DirectMappingOneOrder: 
    Implements first-order direct mapping on the input image. This function applies a linear transformation to adjust the pixel values based on a defined slope and intercept.
### ReverseMappingOneOrder: 
    Utilizes first-order reverse mapping on the input image. This function applies a reverse linear transformation to adjust the pixel values based on a defined slope and intercept.

### Brightness: 
    Adjusts the brightness of the input image by adding or subtracting a constant value to each pixel.
### Contrast: 
    Enhances the contrast of the input image by stretching the range of pixel values.
### Addition: 
    Performs pixel-wise addition of two input images.
### Subtraction: 
    Performs pixel-wise subtraction of two input images.
### Gray_Averaging: 
    Converts the input image to grayscale using the averaging method, which calculates the average value of the RGB channels.
### Gray_Decomposing: 
    Decomposes the input image into separate grayscale channels.
### Gray_Desaturation: 
    Converts the input image to grayscale using the desaturation method, which calculates the luminance of the RGB channels.
### Gray_Luminance: 
    Converts the input image to grayscale using the luminance method, which calculates the weighted average of the RGB channels.
### Gray_Single_Channel: 
    Converts the input image to grayscale by selecting a single color channel.
### Draw_Histogram: 
    Generates a histogram for the input image, displaying the distribution of pixel intensities.
### Histogram_Equalization: 
    Performs histogram equalization on the input image to improve contrast and enhance details.
### Histogram_Matching: 
    Matches the histogram of the input image to a specified reference histogram, transferring the tonal distribution.
### Negative: 
    Produces the negative image of the input image by inverting the pixel values.
### Power_Law: 
    Applies a power-law transformation to adjust the gamma value of the input image, allowing for contrast enhancement.

### Max_Filter: 
    Applies a maximum filter to the input image, replacing each pixel with the maximum value within its neighborhood.
### Min_Filter: 
    Applies a minimum filter to the input image, replacing each pixel with the minimum value within its neighborhood.
### Mean_Filter: 
    Applies a mean filter to the input image, replacing each pixel with the average value within its neighborhood.
### Median_Filter: 
    Applies a median filter to the input image, replacing each pixel with the median value within its neighborhood.
### Weighted_Filter: 
    Applies a weighted filter to the input image, calculating the weighted average of pixel values within its neighborhood.
### Edge_Detection_Filter: 
    Applies an edge detection filter to highlight edges and boundaries in the input image.
### Sharpening_Filter: 
    Enhances image sharpness by emphasizing high-frequency components using a sharpening filter.
### Unsharp_Mask_Filter: 
    Improves image details by subtracting a blurred version of the image from the original using an unsharp mask filter.


## Feel free to explore and experiment with these functions and filters to gain a deeper understanding of image processing techniques.