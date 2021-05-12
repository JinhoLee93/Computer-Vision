function light_dirs_5x3 = computeLightDirections(center, radius, img_cell)
light_dirs_5x3 = zeros(5, 3);
for i=1:length(img_cell)
    img = img_cell{i};
    
    % max brightness is important since it's the indication of
    % 0 degree direction from the light sources to the surface normal. 
    max_b = max(img(:));
    
    % Find pixels with the maximum brightness
    % to figure out the directions of the light sources.
    [r, c] = find(img == max_b);
    
    % Equation of Sphere r^2 = (x-a)^2 + (y-b)^2 + (z-c)^2
    x = mean(c) - center(1);
    y = mean(r) - center(2);
    
    % Normalizing x and y vectors by z axis so that 
    % the z value can always remain 1. 
    % See there's no c value since there is no point to 
    % take to 3D space since there is no z axis in 2D
    x_n = x / sqrt(radius^2 - x^2 - y^2);
    y_n = y / sqrt(radius^2 - x^2 - y^2);
    
    % From lecture
    n = [x_n y_n -1];
    
    light_dirs_5x3(i, :) = n;
end
