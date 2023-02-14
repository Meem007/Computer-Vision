clc;
clear all;
close all;
%%
syms x
y= piecewise((0<=x)&(x<=3), 2, (4<=x)&(x<=7), 6) ;
x= 0:1:7;
y= double(subs(y, x)); % convert symbolic expression to numerical array

% median filtering
m= 3; %window size
median_filtered= medfilt1(y, m);

% linear filtering
kernal= [1/4, 1/2, 1/4];
linear_filtered= conv(y, kernal, 'same'); % 1D convolution
%%

% combined all in bar plot
Y= [y; median_filtered; linear_filtered]' ;
bar(x, Y)
legend("Original Values", "Median Filtered", "Linear Filtered")

