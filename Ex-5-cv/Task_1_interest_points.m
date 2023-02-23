clc
close all
clear all


%% (a) & (b)
sigma_1=1.6;
all_sigma = [sigma_1, sqrt(2)*sigma_1, 2*sigma_1, 2*sqrt(2)*sigma_1, 4*sqrt(2)^4];

Image = im2double(imread('lena_bw.png'));
Image_transformed = im2double(imread('lena_bw_transformed.png'));


DoG = zeros(size(Image,1), size(Image,2), length(all_sigma)-1);
DoG_transformed = zeros(size(Image_transformed,1), size(Image_transformed,2), length(all_sigma)-1);


for i = 1:length(all_sigma)-1
    g1 = imgaussfilt(Image, all_sigma(i));
    g2 = imgaussfilt(Image, all_sigma(i+1));
    DoG(:,:,i) = g1 - g2;

    g1_transformed = imgaussfilt(Image_transformed, all_sigma(i));
    g2_transformed = imgaussfilt(Image_transformed, all_sigma(i+1));
    DoG_transformed(:,:,i) = g1_transformed - g2_transformed;
end


DoG_max = imregionalmax(DoG, 26);
DoG_min = imregionalmin(DoG, 26);
DoG_max_transformed = imregionalmax(DoG_transformed, 26);
DoG_min_transformed = imregionalmin(DoG_transformed, 26);

%% (c) 
threshold = 0.03;
DoG_max(abs(DoG)<threshold) = 0;
DoG_min(abs(DoG)<threshold) = 0;
DoG_max_transformed(abs(DoG_transformed)<threshold) = 0;
DoG_min_transformed(abs(DoG_transformed)<threshold) = 0;

[y_max,x_max] =find(DoG_max);
[y_min,x_min] = find(DoG_min);
[y_transformed_max,x_transformed_max] = find(DoG_max_transformed);
[y_transformed_min,x_transformed_min] = find(DoG_min_transformed);

%% (d) & (e) 
figure(1)
imshow(Image); 
hold on;
plot(x_max,y_max,'yx');
hold on;
plot(x_min,y_min,'ro');
title('Interest Points in Original Image');

% Do those points look like good features? How can they be improved?
% Answer: The points look like good features, but they can be improved 
% by other techniques such as SIFT


% Compare the plots from step (d)
%step (d) 
figure(2);
subplot(1,2,1);
imshow(Image); 
hold on;
plot(x_max,y_max,'yx');
hold on;
plot(x_min,y_min,'ro');
title('Interest Points in Original Image');

subplot(1,2,2);
imshow(Image_transformed); 
hold on;
plot(x_transformed_max,y_transformed_max,'yx');
hold on;
plot(x_transformed_min,y_transformed_min,'ro');
title('Interest Points in Transformed Image');

% Are features extracted from the transformed image different from the original features?
% Answer: The extracted features in both images are not so different. They
% are located almost in similar positions.
