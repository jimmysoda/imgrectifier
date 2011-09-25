function plot_vanishing_line(quad_coords)
    l1 = cross(quad_coords(:,1), quad_coords(:,2));
    l2 = cross(quad_coords(:,2), quad_coords(:,3));
    l3 = cross(quad_coords(:,3), quad_coords(:,4));
    l4 = cross(quad_coords(:,4), quad_coords(:,1));
    vanishing = [cross(l1, l3) cross(l2, l4)];
    xy_vanishing = vanishing(1:2,:) ./ repmat(vanishing(3,:), [2 1]);
    xy_quad = quad_coords(1:2, :) ./ repmat(quad_coords(3,:), [2 1]);

    plot(xy_vanishing(1,:), xy_vanishing(2,:), "-b");
    plot([xy_quad(1,1) xy_vanishing(1,1)], [xy_quad(2,1) xy_vanishing(2,1)],"-r");
    plot([xy_quad(1,2) xy_vanishing(1,2)], [xy_quad(2,2) xy_vanishing(2,2)],"-r");
    plot([xy_quad(1,4) xy_vanishing(1,1)], [xy_quad(2,4) xy_vanishing(2,1)],"-r");
    plot([xy_quad(1,1) xy_vanishing(1,2)], [xy_quad(2,1) xy_vanishing(2,2)],"-r");
    plot(xy_quad(1,:), xy_quad(2,:), "-g");
end

