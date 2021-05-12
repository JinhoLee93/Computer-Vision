function [normals, albedo_img] = ...
    computeNormals(light_dirs, img_cell, mask)
 
normals = zeros(size(img_cell{1}, 1), size(img_cell{1}, 2), 3);
albedo_img = zeros(size(img_cell{1}, 1), size(img_cell{1}, 2));
[x, y] = find(mask == 1);
S = light_dirs;

for i=1:length(x)
    % Each non-background pixel from each image to form the intensity map
    I = double([img_cell{1}(x(i), y(i)); img_cell{2}(x(i), y(i)); ...
        img_cell{3}(x(i), y(i)); img_cell{4}(x(i), y(i)); ...
        img_cell{5}(x(i), y(i))]);

    % From lecture slides
    N = inv(S'*S)*S'*I;
    normals(x(i), y(i), :) = N / norm(N);
    albedo_img(x(i), y(i)) = norm(N);
end

% Normalizing albedo image so that the values comes between 0 and 1
albedo_img = albedo_img / max(albedo_img(:));
end