clc
close all
clear all

% load data
xy=load('xy.mat').xy; 
x=xy(1,:);
y=xy(2,:);

abc = [1 1 1];
eta = 1e-8;

for i = 1:1000
    grad = [2*sum(x.*(abc(1)*x + abc(2)*y + abc(3))) 2*sum(y.*(abc(1)*x + abc(2)*y + abc(3))) 2*sum(abc(1)*x + abc(2)*y + abc(3))];
    abc = abc - eta*grad;
end

x_line = min(x):0.1:max(x);
y_line = (-abc(1)*x_line - abc(3))/abc(2);

% plot the graph

figure(1);
scatter(x, y, 'b.')
hold on
plot(x_line, y_line, 'r','LineWidth',2)

xlabel('x')
ylabel('y')
title('Line fitting using gradient descent')
legend('Data', 'Fitted Line')
