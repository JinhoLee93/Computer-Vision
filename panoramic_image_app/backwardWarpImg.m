function [mask, result_img] = backwardWarpImg(src_img, resultToSrc_H,...
    dest_canvas_width_height)

% row, column, page
[r, c, p] = size(src_img);
result_img = zeros(dest_canvas_width_height(2), dest_canvas_width_height(1), p);
mask = zeros(dest_canvas_width_height(2), dest_canvas_width_height(1));

% Change each pixel according to the homography calculated
for i=1:dest_canvas_width_height(1)
    for j=1:dest_canvas_width_height(2)
        A = resultToSrc_H * [i;j;1];
        % Find the nearest points for each piexel.
        x = round(A(1)/A(3));
        y = round(A(2)/A(3));
        
        % Boundary check
        if x >= 1 && x <= c && y >= 1 && y <= r
            result_img(j, i, :) = src_img(y, x, :);
            mask(j, i) = 1;
        end
    end
end
end

