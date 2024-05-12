function [arr,arg,arb] = drawHistogram(inputImage)


[row,col,~]=size(inputImage);

arr=zeros(1,256);
arg=zeros(1,256);
arb=zeros(1,256);

for i = 1 : row
    for j = 1 : col
        
       m = inputImage(i,j,1);
       arr(m+1) = arr(m+1)+1;
       
       n = inputImage(i,j,2);
       arg(n+1) = arg(n+1)+1;
       
       o = inputImage(i,j,3);
       arb(o+1) = arb(o+1)+1;
       
    end
end


