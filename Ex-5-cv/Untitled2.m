
img = imread('circle.png');
% resize the img for ellipse
img= imresize(Image, [int64(size(Image,1)/2) size(Image,2)]);
edgeImg = edge(img, 'Canny');
% Implement ellipse fitting using SVD
[y, x] = find(Image_edge);
A = [x.^2 + y.^2 x y ones(size(x,1),1)];
[U,S,V] = svd(A);
f = [V(1,end) V(2,end) V(3,end) V(4,end)];
[x, y] = meshgrid(1:size(Image, 2), 1:size(Image, 1));
e = f(1)*(x.^2+y.^2)+f(2)*x+f(3)*y+f(4);


%plot the figure

figure(3)
imshow(Image)
hold on
title('Ellipse Fitting');
contour(x, y, e, [0 0], 'r','LineWidth',3);
