function final=check1(theta1,theta2)
data = imread('skinCheck5.jpg');
figure,imshow(data);
final=zeros(size(data));
hsvMap = rgb2hsv(data);
for i=1:size(data,1)
    for j=1:size(data,2)
       
        h=hsvMap(i,j,1);
        s=hsvMap(i,j,2);
        v=hsvMap(i,j,3);
       
        xtest=double([1 h s v]);
        g1=sigmoid(double(xtest*theta1));
        g2=sigmoid(g1*theta2);
        if g2>0.3
            final(i,j,:)=1;
            %final(i,j,1)=r;
            %final(i,j,2)=g;
            %final(i,j,3)=b;
        else
            final(i,j,:)=0;
        end
    end
end
figure,imshow(final);