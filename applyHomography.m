function dest_pts_nx2 = applyHomography(H_3x3, src_pts_nx2)
src_pts_nx2 = src_pts_nx2';

% Adding z = 1 row
src = [src_pts_nx2; ones(1, length(src_pts_nx2))];
dest = H_3x3 * src;

% Turning homogenous form into coordinates
dest_pts_nx2(1,:) = dest(1,:) ./ dest(3,:);
dest_pts_nx2(2,:) = dest(2,:) ./ dest(3,:);
dest_pts_nx2 = dest_pts_nx2';
end
