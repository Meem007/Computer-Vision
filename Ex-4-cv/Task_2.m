clc
clear all
close all

Image = imread('blocks_bw.png');
Image = double(Image)/255;

[corners] = find_corners(Image, 4,1,0.04);
size(corners)

figure(1);
imshow(Image)
hold on
plot(corners(:,1),corners(:,2),'ob')
title("Harris Corner Detector")
% Comment:
% We can see the algorithm can detect corners well. But there are some
% unwanted detections in the edges of the image. It can be happned because
% of some noises in those area.

% Tomasi-Kanade corner detector doesn't detect the exactly same corners as
% Harris corner detector. There are significant difference in setting the
% treshold for the corner points. But most of they both are good in
% corner detection. But there may have differences because of noise and
% other parameters of an image.



