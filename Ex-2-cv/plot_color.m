function plot_color(points, colors)
    scatter3(points(1, :), points(2, :), points(3, :), 5, colors', 'filled');
    axis equal;
%     colorbar;
end