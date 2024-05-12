function outputImage =ReverseMappingOneOrder(inputImage,fact_r,fact_c)
inputImage=imread(inputImage);
[r,c,ch]=size(inputImage);
new_r=r*fact_r;
new_c=c*fact_c;
r_ratio=r/new_r;
c_ratio=c/new_c;
outputImage=zeros(new_r,new_c,ch);
for k=1:ch
    for new_x=1:new_r
        old_x=new_x*r_ratio;
        x1=floor(old_x);
        if(x1==0)
            x1=1;
        end
        x2=x1+1;
        if(x2>r)
            x2=r;
        end
        x_fraction = abs(old_x-x1);
        for new_y=1:new_c
            old_y=new_y*c_ratio;
            y1=floor(old_y);
            if(y1==0)
            y1=1;
            end
            y2=y1+1;
            if(y2>c)
                y2=c;
            end
            p1=inputImage(x1,y1,k);
            p2= inputImage(x2,y1,k);
            p3=inputImage(x1,y2,k);
            p4=inputImage(x2,y2,k);
            y_fraction = abs(old_y-y1);
            z1=p1*(1-x_fraction)+p2*(x_fraction);
            z2=p3*(1-x_fraction)+p4*(x_fraction);
            new_pixel= z1*(1-y_fraction)+z2*(y_fraction);
            outputImage(new_x,new_y,k)=floor(new_pixel);
        end
    end
end
outputImage=uint8(outputImage);
end