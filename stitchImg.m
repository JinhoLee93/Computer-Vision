function stitched_img = stitchImg(varargin)
imgd = varargin{1};
for i = 2 : length(varargin)
    imgs = varargin{i};
    [y_s, x_s, p] = size(imgs);
    [y_d, x_d, p] = size(imgd);
    [xs, xd] = genSIFTMatches(imgs, imgd);
    edges = [0, 0; x_s, 0; 0, y_s; x_s, y_s];
    
    [inliers_id, H_3x3] = runRANSAC(xs, xd, 10, 5);
    dest_edges = applyHomography(H_3x3, edges);
    
    % Each edge from the homography image.
    x = [round(min(dest_edges(:, 1))), round(max(dest_edges(:, 1)))];
    y = [round(min(dest_edges(:, 2))), round(max(dest_edges(:, 2)))];
    
    % Change all the edges for the panorama image
    % The panorama size is a little bit whacky but stitching works.
    if (x(1) < 0)
        imgd = [zeros(size(imgd, 1), -x(1), 3), imgd];
    end
    if (x(2) > x_d)
        imgd = [imgd, zeros(size(imgd, 1), x(2) - x_d, 3)];
    end
    if (y(1) < 0)
        imgd = [zeros(-y(1), size(imgd, 2), 3); imgd];
    end
    if (y(2) > y_d)
        imgd = [imgd; zeros(y(2) - y_d, size(imgd, 2), 3)];
    end

    [xs, xd] = genSIFTMatches(imgs, imgd);
    [inliers_id, H] = runRANSAC(xs, xd, 10, 5);
    dest_width_height = [size(imgd, 2), size(imgd, 1)];
    [mask, dest_img] = backwardWarpImg(imgs, inv(H), dest_width_height);
    masks = rgb2gray(dest_img);
    maskd = rgb2gray(imgd);
    
    % Determines which part of the panorama the image is attached to.
    if x(2) < x_d
        imgd = blendImagePair(dest_img, masks, imgd, maskd, 'blend');
    else
        imgd = blendImagePair(imgd, maskd, dest_img, masks, 'blend');
    end
    
end
stitched_img = imgd;
end