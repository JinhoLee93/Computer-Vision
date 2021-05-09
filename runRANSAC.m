function [inliers_id, H] = runRANSAC(Xs, Xd, ransac_n, eps)
max = 0;
for i=1:ransac_n
    % random four samples
    samples = randperm(length(Xs), 4);
    
    % Get the homography for the sample points
    src_pts = Xs(samples, :);
    dest_pts = Xd(samples, :);
    H_3x3 = computeHomography(src_pts, dest_pts);
    
    % Apply that homography to the original start point
    % in order to obtain the calculated destination points
    dest_pts = applyHomography(H_3x3, Xs);
    
    % Find error by Euclidean Distance between the original
    % destination points and those by the homography.
    distances = [];
    for i=1:length(Xd)
        distance = sqrt((dest_pts(i,1) - Xd(i,1))^2 + (dest_pts(i,2) - Xd(i,2))^2);
        distances = [distances; distance];
    end
    
    % Get the best sample that has maximum points
    if length(find(distances < eps)) > max
        max = length(find(distances < eps));
        H = H_3x3;
        inliers_id = find(distances < eps);
    end
end
end
