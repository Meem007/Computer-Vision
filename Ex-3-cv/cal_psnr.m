function [PSNR] = cal_psnr(inp_img, filtered_img)
% Calculates PSNR of given image
    mse= mean2((inp_img - filtered_img).^2);
    img_peak_power= max(max(inp_img))^2;
    PSNR = 10*log10(img_peak_power/(mse+1e-10));
end