clc;
close all;
clear all;
%%
s= 10 ;
m= 1/s; % pixel density = pixel per micro meter.
f= 16*1e3; % focal length in micro meter.
X_cord= [1;0;8]*1e6 ; % camera co-ordinates of  a point.
X_cord= X_cord./ X_cord(3,:); % dividing by zc for homogenous coordinates.
fx= m*f ; % focal length pixels
O_center= [320; 240]; % center co-ordinates
X_2d= X_cord(1:2,:);
% X_pixel = fx *X_2d + O_center

% calibration matrix

C= [[fx   0  O_center(1)];
    [0   fx  O_center(2)];
    [0  0           0]] ;
X_pixel= C * X_cord % ans in the command window

