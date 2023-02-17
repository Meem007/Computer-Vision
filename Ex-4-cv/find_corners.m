function [corners] = find_corners(img, N, t, k)
   
    % padding the image to get help in calculating gradients
    img=padarray(img,[N N],'replicate','both');
    [h,w]=size(img);
   
    % calculating the gradients
    img_grad_x = conv2(img, [-1 0 1], 'same');
    img_grad_y = conv2(img, [-1; 0; 1], 'same');
   
    % calculating elements of T matrix
    img_grad_xsq = img_grad_x.^2;
    img_grad_ysq = img_grad_y.^2;
    img_grad_xy = img_grad_x.*img_grad_y;

    % Initiating lambdas with zeros
    lambda_1s=zeros(h,w);
    lambda_2s=zeros(h,w);

    
    % calculating lambdas for each points
    for i=1+N:h-N
        for j=1+N:w-N
            T=[sum(img_grad_xsq(i-N:i+N,j-N:j+N),'all') sum(img_grad_xy(i-N:i+N,j-N:j+N),'all');sum(img_grad_xy(i-N:i+N,j-N:j+N),'all') sum(img_grad_ysq(i-N:i+N,j-N:j+N),'all')];
            lambdas=eig(T);
            lambda_1s(i-N,j-N)=lambdas(1);
            lambda_2s(i-N,j-N)=lambdas(2);
        end
    end
    
    % calculating the values of R
    R=lambda_1s.*lambda_2s+k*(lambda_1s+lambda_2s).^2;
    
    % non max suppression
    Ch=4;
    for i=Ch+1:h-Ch
        for j=Ch+1:w-Ch
            chunc=R(i-Ch:i+Ch,j-Ch:j+Ch);
            max_chunc=max(chunc,[],'all');
            [x,y]=find(chunc==max_chunc);
            chunc=chunc*0;
            chunc(x(1),y(1))=max_chunc;
            R(i-Ch:i+Ch,j-Ch:j+Ch)=chunc;
        end
    end
    
    % thresholding for R
    [y, x] = find(R>t);
    corners = [x y];
end