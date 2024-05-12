function newimage  = Quantization( oldimage,k )

[row,column,pages]=size(oldimage);
newimage=zeros(row,column,pages,'uint8');
%quantization
%k=input('Enter aluer of k = ');
grayLevel=2^k;
gap=256/grayLevel;
colors=gap:gap:256;

for k=1:pages
for i=1:row
      for j=1:column
          
       temp=oldimage(i,j,k)/gap;
       index=floor(temp);
       
       if index<1
          index=1;
       end
       
       newimage(i,j,k)=colors(index);
      end
end 
end
newimage=uint8(newimage);

end
