function H_3x3 = computeHomography(src_pts_nx2, dest_pts_nx2)
A = [];
% Compose matrix A
for i=1:length(src_pts_nx2)
    A = [A; [src_pts_nx2(i, 1), src_pts_nx2(i, 2), 1, 0, 0, 0, ...
        -(dest_pts_nx2(i, 1) * src_pts_nx2(i, 1)), -(dest_pts_nx2(i, 1) * src_pts_nx2(i, 2)), -(dest_pts_nx2(i, 1))]];
    A = [A; [0, 0, 0, src_pts_nx2(i, 1), src_pts_nx2(i, 2), 1, ...
        -(dest_pts_nx2(i, 2) * src_pts_nx2(i, 1)), -(dest_pts_nx2(i, 2) * src_pts_nx2(i, 2)), -(dest_pts_nx2(i, 2))]];
end

% Compute eigenvector with the smallest eigenvalue 
[V, D] = eigs(A'*A, 1, 'smallestreal');
H_3x3 = reshape(V, 3, 3)';
end


