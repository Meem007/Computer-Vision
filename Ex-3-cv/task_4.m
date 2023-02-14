clc;
close all;
clear all;
%%
img = imread('.\data\blocks-col.png');
d_img= im2double(img); %normalized image
red_channel= d_img(:, :, 1); %taking individual channels
green_channel= d_img(:, :, 2);
blue_channel = d_img(:, :, 3);
% mask for detecting objects
red_mask=(red_channel > 0.6) | ((green_channel <0.05) &(green_channel >0.4)) | ((blue_channel <0.2) &(blue_channel <0.3)) ;
% for removing background
gray_img = rgb2gray(d_img);
gray_mask= gray_img < 0.59;
red_mask= red_mask .* gray_mask; %
red_img = d_img;
red_img= red_img .* repmat(red_mask, [1 1 3]);
figure(1)
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(red_img); title('Red Object(In RGB space)');
%%
%IN HSV Color space
% Convert to HSV color space
img= imread('.\data\blocks-col.png');
hsv_img = rgb2hsv(img);
% Threshold hue channel to get red pixels
hue = hsv_img(:,:,1);
hue_mask = hue > 0.94 | hue < 0.1;

red_img = img;
red_img(repmat(~hue_mask,[1 1 3])) = 0;

figure(2);
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(red_img); title('Red Object (In HSV space)');

%% For 2nd Image
img = imread('.\data\circles.png');
d_img= im2double(img); %normalized image
red_channel= d_img(:, :, 1); %taking individual channels
green_channel= d_img(:, :, 2);
blue_channel = d_img(:, :, 3);
% mask for detecting objects
red_mask=(red_channel > 0.6) | ((green_channel <0.05) &(green_channel >0.4)) | ((blue_channel <0.2) &(blue_channel <0.3)) ;
% for removing background
gray_img = rgb2gray(d_img);
gray_mask= gray_img < 0.59;
red_mask= red_mask .* gray_mask; %
red_img = d_img;
red_img= red_img .* repmat(red_mask, [1 1 3]);
figure(3)
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(red_img); title('Red Object(In RGB space)');
%%
%IN HSV Color space
% Convert to HSV color space
img= imread('.\data\circles.png');
hsv_img = rgb2hsv(img);
% Threshold hue channel to get red pixels
hue = hsv_img(:,:,1);
hue_mask = hue > 0.94 | hue < 0.1;

red_img = img;
red_img(repmat(~hue_mask,[1 1 3])) = 0;

figure(4);
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(red_img); title('Red Object(IN HSV space)');

% After inspecting the ouput image we can say that In HSV color space
% theshold works very well but in RGB space theshold don't work properly

% problems: 1. In RGB space, I have  to take threshold all the channel [R G
% B] seperatly and background extraction was tough but in HSV space these
% was done easily as color was stored in hue(color) channel.