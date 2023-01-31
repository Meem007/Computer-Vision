clc;
clear all;
close all;
%%
% Define the frame matrices relative to world
WTW = eye(4);

WTR= [[0.6645 -0.6645 0.3420 -2]
      [0.7071 0.7071 0 1]
      [-0.2418 0.2418 0.9397 -1]
      [0 0 0 1]];

WTC = [[0.1543 -0.6172 -0.7715 3];
      [0.9866 0.0538 0.1543 0];
      [0.0538 0.7850 -0.6172 3];
      [0 0 0 1]];

% Compute the origins of the world, robot, camera frame
origin_w = WTW(:, 4);
origin_c = WTC(:, 4);
origin_r= WTR(:, 4);

% Compute the position of the x, y, and z axes of the each frame
pos_mat= [[1 0 0 1];
        [0 1 0 1];
        [0 0 1 1]] ;
x_axis_w = WTW * pos_mat(1,:)';
y_axis_w = WTW * pos_mat(2,:)';
z_axis_w = WTW * pos_mat(3,:)';

x_axis_r = WTR * pos_mat(1,:)';
y_axis_r = WTR * pos_mat(2,:)';
z_axis_r = WTR * pos_mat(3,:)';

x_axis_c = WTC * pos_mat(1,:)';
y_axis_c = WTC * pos_mat(2,:)';
z_axis_c = WTC * pos_mat(3,:)';

% Plot the world, robot, camera frames relative to world frame
figure(1)
hold on
plot3([origin_w(1) x_axis_w(1)], [origin_w(2) x_axis_w(2)], [origin_w(3) x_axis_w(3)], 'r', 'LineWidth', 2)
plot3([origin_w(1) y_axis_w(1)], [origin_w(2) y_axis_w(2)], [origin_w(3) y_axis_w(3)], 'g', 'LineWidth', 2)
plot3([origin_w(1) z_axis_w(1)], [origin_w(2) z_axis_w(2)], [origin_w(3) z_axis_w(3)], 'b', 'LineWidth', 2)
text(x_axis_w(1)-0.5, y_axis_w(1)-0.25, z_axis_w(1), "WTW")


plot3([origin_r(1) x_axis_r(1)], [origin_r(2) x_axis_r(2)], [origin_r(3) x_axis_r(3)], 'r', 'LineWidth', 2)
plot3([origin_r(1) y_axis_r(1)], [origin_r(2) y_axis_r(2)], [origin_r(3) y_axis_r(3)], 'g', 'LineWidth', 2)
plot3([origin_r(1) z_axis_r(1)], [origin_r(2) z_axis_r(2)], [origin_r(3) z_axis_r(3)], 'b', 'LineWidth', 2)
text(origin_r(1), origin_r(2)-0.25, origin_r(3), "WTR")

plot3([origin_c(1) x_axis_c(1)], [origin_c(2) x_axis_c(2)], [origin_c(3) x_axis_c(3)], 'r', 'LineWidth', 2)
plot3([origin_c(1) y_axis_c(1)], [origin_c(2) y_axis_c(2)], [origin_c(3) y_axis_c(3)], 'g', 'LineWidth', 2)
plot3([origin_c(1) z_axis_c(1)], [origin_c(2) z_axis_c(2)], [origin_c(3) z_axis_c(3)], 'b', 'LineWidth', 2)
text(origin_c(1), origin_c(2), origin_c(3), "WTC")
xlabel('X')
ylabel('Y')
zlabel('Z')
title('Plot relative to world frame')
grid on
axis equal
hold off

%%

% Define the frame matrices relative to robot
RTW= inv(WTR);
RTR= RTW * WTR ;
RTC= RTW * WTC ;

% Compute the origins of the world, robot, camera frame
origin_w = RTW(:, 4);
origin_r= RTR(:, 4);
origin_c = RTC(:, 4);


% Compute the position of the x, y, and z axes of the each frame
pos_mat= [[1 0 0 1];
        [0 1 0 1];
        [0 0 1 1]] ;
x_axis_w = RTW * pos_mat(1,:)';
y_axis_w = RTW * pos_mat(2,:)';
z_axis_w = RTW * pos_mat(3,:)';

x_axis_r = RTR * pos_mat(1,:)';
y_axis_r = RTR * pos_mat(2,:)';
z_axis_r = RTR * pos_mat(3,:)';

x_axis_c = RTC * pos_mat(1,:)';
y_axis_c = RTC * pos_mat(2,:)';
z_axis_c = RTC * pos_mat(3,:)';

% Plot the world, robot, camera frames relative to robot frame
figure(2)
hold on
plot3([origin_w(1) x_axis_w(1)], [origin_w(2) x_axis_w(2)], [origin_w(3) x_axis_w(3)], 'r', 'LineWidth', 2)
plot3([origin_w(1) y_axis_w(1)], [origin_w(2) y_axis_w(2)], [origin_w(3) y_axis_w(3)], 'g', 'LineWidth', 2)
plot3([origin_w(1) z_axis_w(1)], [origin_w(2) z_axis_w(2)], [origin_w(3) z_axis_w(3)], 'b', 'LineWidth', 2)
text(origin_w(1), origin_w(2), origin_w(3), "RTW")


plot3([origin_r(1) x_axis_r(1)], [origin_r(2) x_axis_r(2)], [origin_r(3) x_axis_r(3)], 'r', 'LineWidth', 2)
plot3([origin_r(1) y_axis_r(1)], [origin_r(2) y_axis_r(2)], [origin_r(3) y_axis_r(3)], 'g', 'LineWidth', 2)
plot3([origin_r(1) z_axis_r(1)], [origin_r(2) z_axis_r(2)], [origin_r(3) z_axis_r(3)], 'b', 'LineWidth', 2)
text(origin_r(1), origin_r(2), origin_r(3), "RTR")

plot3([origin_c(1) x_axis_c(1)], [origin_c(2) x_axis_c(2)], [origin_c(3) x_axis_c(3)], 'r', 'LineWidth', 2)
plot3([origin_c(1) y_axis_c(1)], [origin_c(2) y_axis_c(2)], [origin_c(3) y_axis_c(3)], 'g', 'LineWidth', 2)
plot3([origin_c(1) z_axis_c(1)], [origin_c(2) z_axis_c(2)], [origin_c(3) z_axis_c(3)], 'b', 'LineWidth', 2)
text(origin_c(1), origin_c(2), origin_c(3), "RTC")
xlabel('X')
ylabel('Y')
zlabel('Z')
title("Plot relative to Robot frame")
grid on
axis equal
hold off

%%


% Define the frame matrices relative to camera
CTW= inv(WTC);
CTR= CTW * WTR;%inv(RTC)
CTC= CTW * WTC;

% Compute the origins of the world, robot, camera frame
origin_w = CTW(:, 4);
origin_r= CTR(:, 4);
origin_c = CTC(:, 4);


% Compute the position of the x, y, and z axes of the each frame
pos_mat= [[1 0 0 1];
          [0 1 0 1];
          [0 0 1 1]] ;
x_axis_w = CTW * pos_mat(1,:)';
y_axis_w = CTW * pos_mat(2,:)';
z_axis_w = CTW * pos_mat(3,:)';

x_axis_r = CTR * pos_mat(1,:)';
y_axis_r = CTR * pos_mat(2,:)';
z_axis_r = CTR * pos_mat(3,:)';

x_axis_c = CTC * pos_mat(1,:)';
y_axis_c = CTC * pos_mat(2,:)';
z_axis_c = CTC * pos_mat(3,:)';

% Plot the world, robot, camera frames relative to camera frame
figure(3)
hold on
plot3([origin_w(1) x_axis_w(1)], [origin_w(2) x_axis_w(2)], [origin_w(3) x_axis_w(3)], 'r', 'LineWidth', 2)
plot3([origin_w(1) y_axis_w(1)], [origin_w(2) y_axis_w(2)], [origin_w(3) y_axis_w(3)], 'g', 'LineWidth', 2)
plot3([origin_w(1) z_axis_w(1)], [origin_w(2) z_axis_w(2)], [origin_w(3) z_axis_w(3)], 'b', 'LineWidth', 2)
text(origin_w(1), origin_w(2), origin_w(3), "CTW")


plot3([origin_r(1) x_axis_r(1)], [origin_r(2) x_axis_r(2)], [origin_r(3) x_axis_r(3)], 'r', 'LineWidth', 2)
plot3([origin_r(1) y_axis_r(1)], [origin_r(2) y_axis_r(2)], [origin_r(3) y_axis_r(3)], 'g', 'LineWidth', 2)
plot3([origin_r(1) z_axis_r(1)], [origin_r(2) z_axis_r(2)], [origin_r(3) z_axis_r(3)], 'b', 'LineWidth', 2)
text(origin_r(1), origin_r(2), origin_r(3), "CTR")

plot3([origin_c(1) x_axis_c(1)], [origin_c(2) x_axis_c(2)], [origin_c(3) x_axis_c(3)], 'r', 'LineWidth', 2)
plot3([origin_c(1) y_axis_c(1)], [origin_c(2) y_axis_c(2)], [origin_c(3) y_axis_c(3)], 'g', 'LineWidth', 2)
plot3([origin_c(1) z_axis_c(1)], [origin_c(2) z_axis_c(2)], [origin_c(3) z_axis_c(3)], 'b', 'LineWidth', 2)
text(origin_c(1), origin_c(2), origin_c(3), "CTC")
xlabel('X')
ylabel('Y')
zlabel('Z')
title("Plot relative to Camera frame")
grid on
axis equal
hold off
