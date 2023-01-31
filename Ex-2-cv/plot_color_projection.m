function plot_color_projection(points, colors)
    scatter(points(1, :), points(2, :), 5, colors', 'filled');
    axis equal;
    set(gca, 'Ydir', 'reverse');
end