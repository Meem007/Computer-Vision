% clc;
% clear all;
% close all;
%%
% WTC camera co-ordinates in world frame. Transition matrix to convert
% camera co-ordinates in world co-ordinates
% first load the varibales (task3.mat from previous folder) then run the code
figure(1)
plot_color(points, colors)
text(points(1,1), points(2, 1), points(3, 1)+0.5, "Points in world frame")
hold on

origin_c = WTC(:, 4);
pos_mat= [[1 0 0 1];
        [0 1 0 1];
        [0 0 1 1]] ;
x_axis_c = WTC * pos_mat(1,:)';
y_axis_c = WTC * pos_mat(2,:)';
z_axis_c = WTC * pos_mat(3,:)';

plot3([origin_c(1) x_axis_c(1)], [origin_c(2) x_axis_c(2)], [origin_c(3) x_axis_c(3)], 'r', 'LineWidth', 2)
plot3([origin_c(1) y_axis_c(1)], [origin_c(2) y_axis_c(2)], [origin_c(3) y_axis_c(3)], 'g', 'LineWidth', 2)
plot3([origin_c(1) z_axis_c(1)], [origin_c(2) z_axis_c(2)], [origin_c(3) z_axis_c(3)], 'b', 'LineWidth', 2)
text(origin_c(1), origin_c(2), origin_c(3), "WTC")
axis equal
xlabel('X')
ylabel('Y')
zlabel('Z')
%%

% (b)
s= 10;
m= 1/s; % pixel density pixel per micro meter.
f= 16*1e3; % focal length in micro meter.
O_center= [70; 70]; % center co-ordinates in pixels.
fx= m*f;  % focal length in pixels
fy= m*f;
% intrinsic parameter matrix
K= [[-fx, 0, O_center(1) ];
    [0, -fy, O_center(2) ];
    [0,  0,           1 ]] ;
% extrinsic parameter matrix
R= inv(WTC);    % transition matrix for converting world co-ordinates into camera co-ordinates

M= K * R(1:3,:); % projection matrix
figure(2)
projected_points= M * points ; 
projected_points= projected_points(1:2, :)./projected_points(3,:) ; % for homogenous point transition. 
plot_color_projection(projected_points, colors)

%%
%(c)
points_in_camera_frame= R * points;
Z_mean= mean(points_in_camera_frame(3, :));
M_weak=[[-fx, 0, 0, Z_mean * O_center(1)];
        [0, -fy, 0, Z_mean * O_center(2)];
        [0,   0,  0, Z_mean]] ;
weak_projected_points= M_weak * points_in_camera_frame ;
figure(3)
plot_color_projection(weak_projected_points(1:2, :)./ weak_projected_points(3,:), colors)
