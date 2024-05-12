function output_img = powerLaw(im,gamma)


im=im2double(im);
[row, col, ch] = size(im);
output_img=zeros(row,col,ch);

for k=1:ch
    for i = 1 : row
        for j = 1 : col
            new_val=im(i,j,k)^gamma;
            output_img(i, j,k) = new_val;  
        end
    end
end

% Post-processing: Normalization (contrast with new range = [0~255])
output_img=Contrast(255,0,output_img);


end