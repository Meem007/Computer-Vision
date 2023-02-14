clc;
clear all;
close all;
%%
img= imread(".\data\lena_bw.png");
img= double(img)/ 255; % normalizing
variance= 0.01;
n= sqrt(variance) * randn(size(img));  %noise
noisy_img= img + n; % adding gaussian noise
figure(1)
subplot(2, 2, 1), imshow(img), title("Orginal Image"),hold on
subplot(2, 2, 2), imshow(noisy_img),title("Noisy Image"), hold on
s= 3; % filter size
median2D_filtered= medfilt2(noisy_img, [s s]); % 2D filtering
subplot(2, 2, 3), imshow(median2D_filtered), title("2D median filtered image"), hold on

% row and column wise median filtering
median1d_filtered= medfilt1(noisy_img, 3); 
median1d_filtered= medfilt1(median1d_filtered, 3);
subplot(2,2,4), imshow(median1d_filtered), title('1D median filtered image')
% As they are not same they are not separable
% 2D filtering removes much noise then 2times 1D filtering
