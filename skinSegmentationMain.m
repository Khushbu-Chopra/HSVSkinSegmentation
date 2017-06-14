    clc 
clear all
X=load('hsvSkin_NonSkin.txt');
x1=X(:,1:3);
x = [ones(size(x1,1),1) x1];   %Adding Bias value
y=X(:,4);   
%pos1=find(y==1);6
%y(pos1)=0;
pos2=find(y==2);
y(pos2)=0;

m=size(x,1);
n=size(x,2);
[xtrain,ytrain,xtest,ytest]=trainTest(x,y,m,n);
neurons=5;
outIters=1;
sumSuccess=0;
max=0;
for i=1:outIters
    theta1=-1+2*rand(4,neurons);
    theta2=-1+2*rand(neurons,1);
    inIters=2000;
    error=zeros(inIters,1);
    g1=zeros(size(xtrain,1),neurons);
    g2=zeros(neurons,1);
    for i=1:inIters
        %theta1
        %theta2
        [g1,g2]=feedforward(xtrain,theta1,theta2);
        [theta1,theta2]=backpropagation(g1,g2,theta1,theta2,xtrain,ytrain);
        error(i)=sum((ytrain-g2).^2); %Mean Square Error Calculation
        
    end
    
    figure,plot(error);
    [g2test,h,success]=testfunc(theta1,theta2,xtest,ytest);
    %check(theta1,theta2);
    sumSuccess=sumSuccess+success;
    %if(success>max)
    %    max=success;
    %    theta2_final=theta2;
    %    theta1_final=theta1;
    %    plot(error);
    %    hold on;
  %  end
end
grayscaleImg=check1(theta1,theta2);
avgSuccess=sumSuccess/outIters;
%fprintf('Average succes rate:%f',avgSuccess);
    
