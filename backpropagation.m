function [theta1,theta2]=backpropagation(g1,g2,theta1,theta2,xtrain,ytrain)

del2=(g2-ytrain).*derivSigmoid(g2);
del1 =del2*(theta2)'.*derivSigmoid(g1);

theta2 = theta2-0.000001*g1'*del2;
theta1 = theta1-0.000001*xtrain'*del1;
end
