clc
clear all
close all

img = imread('lego1.jpg');

% Converting the image to gray scale
img_gray = rgb2gray(img);

% Thresholding based on Intensity of the pixels
t1=0;
t2=mean(img_gray)*0.7;
img_binary=(img_gray>t1).*(img_gray<=t2)==1;

regions = regionprops(img_binary, 'Area', 'Centroid', 'Circularity', 'Eccentricity', 'MajorAxisLength', 'MinorAxisLength', 'Orientation','Boundingbox');

% Showing the image in bounding boxes
imshow(img_binary)
hold on
for p = 1 : length(regions)
     Box = regions(p).BoundingBox;
     rectangle('Position', [Box(1),Box(2),Box(3),Box(4)],'EdgeColor','g','LineWidth',1) ;
end

% We can use other features of the regions to get more accurate visual
% representation
