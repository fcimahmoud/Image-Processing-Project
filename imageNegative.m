function output_img = imageNegative(im)

[row, col, ch]=size(im);
output_img=zeros(row,col,ch);

for k=1:ch
    for i=1:row 
        for j=1:col
            output_img(i,j,k) = 255-im(i,j,k);
        end
    end
end
output_img = uint8(output_img);

end