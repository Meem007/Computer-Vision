clc;
clear all;
close all;

img= imread(".\data\lena_bw.png");
img= double(img)/ 255; % normalizing
variance= 0.01;
n= sqrt(variance) * randn(size(img));  %noise
noisy_img= img + n; % adding gaussian noise
figure(1)
subplot(3,3, 1), imshow(img), title("Orginal Image"),hold on
subplot(3, 3, 2), imshow(noisy_img),title("Noisy Image (Gaussian Noise)"), hold on

% (a) linear filtering
% from inspection, kernal with sigma=2 produces visually the most satisfying result
sigmas = [0.5 1 2];
linear_psnr= [];
i= 3;
for sigma = sigmas
    kernel_size = 3 ; % size of the Gaussian kernel
    kernal = -kernel_size:kernel_size;
    kernal = (1/(sqrt(2*pi) * sigma))*exp(-kernal.^2 / (2*sigma^2)); % Gaussian kernel
    kernal= kernal/sum(kernal);
    linear_filtered = conv2(noisy_img, kernal, 'same'); % convolution
    psnr= cal_psnr(img, linear_filtered);
    linear_psnr= [linear_psnr psnr];
    i= i+1;
    subplot(3, 3, i), imshow(linear_filtered), title(sprintf('Linear filtered Image (σ = %.1f)', sigma )), hold on
end

% (b) median filtering
% image filtered with filter size = 3x3, 5x5, 9x9 
median_psnr= [];
filter_size= [3 5 9];
for s= filter_size
    median_filtered= medfilt2(noisy_img, [s s]);
    psnr= cal_psnr(img, median_filtered); % calculating PSNR for comparison
    median_psnr= [median_psnr psnr];
    i= i+1; %for plot sorting
    subplot(3,3,i), imshow(median_filtered), title(sprintf('Median filtered Image (filter size = %0.0fx%0.0f)', s, s)), hold on
end
hold off
%%

% linear filter must be size of 2*3 (as keranl_size=3) so that we can take
% data from both negative and possitive for our gaussian function. As
% gaussian function is symmetric about the mean we take both side data in
% our filter for acurate measuring

% For linear filtering σ = 0.5 kept the best details and 
% for median filtering 3x3 filter kept best details.

%%

% %
% [m, n]= size(img);
% mse= mean2((img - median_filtered).^2);
% img_peak_power= max(max(img))^2;
% psnr= 10*log10(img_peak_power/(mse+1e-10))

figure(2)
subplot(1,2, 1), scatter(sigmas, linear_psnr, 'filled'), title("Linear filtered PSNR vs sigma")
xlabel("sigma"), ylabel("PSNR")
hold on
subplot(1,2, 2), scatter(filter_size,median_psnr, 'filled'), title("Median filtered PSNR vs Filter size")
xlabel("Filter size"), ylabel("PSNR")
hold off
% from these figure we can say that in case of  linear filter σ = 2 has the
% highest PSNR

% On the otherhand for median filtering filter 5x5 has the highest PSNR 

% Overall median filtering with 5x5 filter has the max PSNR

%% with salt-and-pepper noise

img= imread(".\data\lena_bw.png");
img= double(img)/ 255; % normalizing
n= rand(size(img));
p= 0.05; % probability of noise
% adding salt_and_pepper noise
noisy_img= img ;
noisy_img(n < p) = 0;
noisy_img(n >1 - p) = 1;
figure(3)
subplot(3,3, 1), imshow(img), title("Orginal Image"),hold on
subplot(3, 3, 2), imshow(noisy_img),title("Noisy Image(Salt and Pepper Noise)"), hold on

% linear filtering
% from inspection, kernal with sigma=2 produces visually the most satisfying result
sigmas = [0.5 1 2];
linear_psnr= [];
i= 3;
for sigma = sigmas
    kernel_size = 3 ; % size of the Gaussian kernel
    kernal = -kernel_size:kernel_size;
    kernal = (1/(sqrt(2*pi) * sigma))*exp(-kernal.^2 / (2*sigma^2)); % Gaussian kernel
    kernal= kernal/sum(kernal);
    linear_filtered = conv2(noisy_img, kernal, 'same'); % convolution
    psnr= cal_psnr(img, linear_filtered);
    linear_psnr= [linear_psnr psnr];
    i= i+1;
    subplot(3, 3, i), imshow(linear_filtered), title(sprintf('Linear filtered Image (σ = %.1f)', sigma )), hold on
end

% median filtering
% image filtered with filter size = 3x3, 5x5, 9x9 
median_psnr= [];
filter_size= [3 5 9];
for s= filter_size
    median_filtered= medfilt2(noisy_img, [s s]);
    psnr= cal_psnr(img, median_filtered);
    median_psnr= [median_psnr psnr];
    i= i+1; %for plot sorting
    subplot(3,3,i), imshow(median_filtered), title(sprintf('Median filtered Image (filter size = %0.0fx%0.0f)', s, s)), hold on
end
%%

% In case of salt-and-pepper noise median filtering works much better than
% linear filtering

%% Speckle (multiplicative) noise

img= imread(".\data\lena_bw.png");
img= double(img)/ 255; % normalizing
n= rand(size(img));
v= 0.02; % variance
% adding salt_and_pepper noise
noisy_img= imnoise(img, 'speckle', v) ;
figure(4)
subplot(3,3, 1), imshow(img), title("Orginal Image"),hold on
subplot(3, 3, 2), imshow(noisy_img),title("Noisy Image(Speckle Noise)"), hold on

% linear filtering
% from inspection, kernal with sigma=2 produces visually the most satisfying result
sigmas = [0.5 1 2];
linear_psnr= [];
i= 3;
for sigma = sigmas
    kernel_size = 3 ; % size of the Gaussian kernel
    kernal = -kernel_size:kernel_size;
    kernal = (1/(sqrt(2*pi) * sigma))*exp(-kernal.^2 / (2*sigma^2)); % Gaussian kernel
    kernal= kernal/sum(kernal);
    linear_filtered = conv2(noisy_img, kernal, 'same'); % convolution
    psnr= cal_psnr(img, linear_filtered);
    linear_psnr= [linear_psnr psnr];
    i= i+1;
    subplot(3, 3, i), imshow(linear_filtered), title(sprintf('Linear filtered Image (σ = %.1f)', sigma )), hold on
end

% median filtering
% image filtered with filter size = 3x3, 5x5, 9x9 
median_psnr= [];
filter_size= [3 5 9];
for s= filter_size
    median_filtered= medfilt2(noisy_img, [s s]);
    psnr= cal_psnr(img, median_filtered);
    median_psnr= [median_psnr psnr];
    i= i+1; %for plot sorting
    subplot(3,3,i), imshow(median_filtered), title(sprintf('Median filtered Image (filter size = %0.0fx%0.0f)', s, s)), hold on
end
%%

% In case of speckle noise median filtering with filter size 5x5 works much better than
% linear filtering
