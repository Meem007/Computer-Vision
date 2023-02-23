clc
close all
clear all

% Fitting Circle
Image = imread('circle.png');
Image_edge = edge(Image, 'canny');
[py, px] = find(Image_edge);

% Using f(x,y)=a(x^2 + y^2) + bx + cy + d 
A = [px.^2 + py.^2 px py ones(size(px,1),1)];


% using singular value decomposition function
[U,S,V] = svd(A); 
abcd = [V(1,end) V(2,end) V(3,end) V(4,end)];
[x, y] = meshgrid(1:size(Image, 2), 1:size(Image, 1));
z = abcd(1)*(x.^2+y.^2)+abcd(2)*x+abcd(3)*y+abcd(4);

%plot the figure
figure(1)
imshow(Image)
hold on
contour(x, y, z, [0 0], 'r','LineWidth',2);
title("Circle for f(x,y)=a(x^2+y^2)+bx+cy+d")

% Using f(x, y) = ax^2+bxy+cy^2+dx+ey+f 
A = [px.^2 px.*py py.^2 px py ones(size(px,1),1)];
[U,S,V] = svd(A);
abcdef = [V(1,end) V(2,end) V(3,end) V(4,end) V(5,end) V(6,end)];


[x, y] = meshgrid(1:size(Image, 2), 1:size(Image, 1));
z = abcdef(1)*x.^2+abcdef(2)*x.*y+abcdef(3)*y.^2+abcdef(4)*x+abcdef(5)*y+abcdef(6);

%plot the figure
figure(2)
imshow(Image)
hold on
contour(x, y, z, [0 0], 'r','LineWidth',2);
title("Circle for f(x, y) = ax^2+bxy+cy^2+dx+ey+f")

% Do you get the same results from fitting a circle and fitting a general conic section?
% Answer: Yes, both the solutions are same.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Now resize the image to half of its height while keeping the width. Repeat steps (a)-(d) for that image.
Image = imresize(Image, [int64(size(Image,1)/2) size(Image,2)]);
Image_edge = edge(Image, 'canny');
[py, px] = find(Image_edge);

% Using f(x,y)=a(x2 + y2) + bx + cy + d 
A = [px.^2 + py.^2 px py ones(size(px,1),1)];
[U,S,V] = svd(A);
abcd = [V(1,end) V(2,end) V(3,end) V(4,end)];
[x, y] = meshgrid(1:size(Image, 2), 1:size(Image, 1));
z = abcd(1)*(x.^2+y.^2)+abcd(2)*x+abcd(3)*y+abcd(4);

%plot the figure

figure(3)
imshow(Image)
hold on
contour(x, y, z, [0 0], 'r','LineWidth',2);
title("Ellips for f(x,y)=a(x^2+y^2)+bx+cy+d")

% Using f(x, y) = ax2+bxy+cy2+dx+ey+f 
A = [px.^2 px.*py py.^2 px py ones(size(px,1),1)];
[U,S,V] = svd(A);
abcdef = [V(1,end) V(2,end) V(3,end) V(4,end) V(5,end) V(6,end)];


[x, y] = meshgrid(1:size(Image, 2), 1:size(Image, 1));
z = abcdef(1)*x.^2+abcdef(2)*x.*y+abcdef(3)*y.^2+abcdef(4)*x+abcdef(5)*y+abcdef(6);

% plot the figure
figure(4)
imshow(Image)
hold on
contour(x, y, z, [0 0], 'r','LineWidth',2);
title("Ellips for f(x, y) = ax^2+bxy+cy^2+dx+ey+f")

% Are results different now?
% Answer: Yes, the results are now different. Because the equation of
% circle cannot be used for other conics (such as ellips) but the general 
% equation of conic is applicable to circle.