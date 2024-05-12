function output_img = Subtraction(im1,im2)
[row, col, ch]=size(im1);
im2=imresize(im2,[row,col]);
output_img = zeros(row,col,ch);

for k=1:ch
    for i=1:row 
        for j=1:col
           new_val=im1(i,j,k)-im2(i,j,k);
           if new_val > 250
              new_val=250;
           end
           if new_val < 0
              new_val=0;
           end
           output_img(i,j,k)=new_val;
           
        end
    end
end

output_img = uint8(output_img);


end
