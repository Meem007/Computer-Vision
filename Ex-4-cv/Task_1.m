clc
clear all
close all

% Defining the parameters first
Gx = [-1 0 1; -2 0 2; -1 0 1]; % Sobel 
Gy = Gx';
sigma = 3;
t = 0.055;

% Loading the image and supressing the noise using Gaussian Filter
Image = imread('blocks_bw.png');
Image = double(Image)/255;
f = fspecial('gaussian', 6, sigma);
Image_smooth = imfilter(Image, f);

% Measuring gradiant using sobel filter and applying threshold
Image_grad_x = imfilter(Image_smooth, Gx);
Image_grad_y = imfilter(Image_smooth, Gy);
Image_grad = sqrt(Image_grad_x.^2 + Image_grad_y.^2);
Image_threshold = Image_grad > t;

% Using bwmorph function to get final image
Image_final = bwmorph(Image_threshold, 'thin',20);

%Find suitable threshold t and scale σ (standard deviation of Gaussian kernel for step (a)).
%How does the resulting edge detection change if we omit steps (a) and (c)?

%Answer: 
%The Gaussian filter step (a) is important for smoothing out unwanted edges
%or noises in the image. If this is omitted than edge detection will be
%more noisy and there will be many false edges.The thinning step (c) is important 
% for removing false edges and thinning the edges to one pixel wide, 
% which results in a more accurate representation of the edges in the image.
% Here is the result without step (a) and (c)

Image_grad_x2 = imfilter(Image, Gx);
Image_grad_y2 = imfilter(Image, Gy);
Image_grad2 = sqrt(Image_grad_x2.^2 + Image_grad_y2.^2);
Image_threshold2 = Image_grad2 > t;

figure(1)
imshow(Image_threshold2)
title("Edge detection without step (a) and (c)")



% now applying the canny edge detector to the same image and comparing
Image_canny = edge(Image,'canny');

figure(2)
imshow(Image_final)
title("Canny Practice")

figure(3)
imshow(Image_canny)
title("Canny Matlab")

% We can see both the edge detections are almost similar.

