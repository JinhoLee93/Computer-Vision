function hough_img = generateHoughAccumulator(img, theta_num_bins, rho_num_bins)
[w, h] = size(img);
hough_space = zeros(rho_num_bins, theta_num_bins);

% rho
rho_m = sqrt(w^2 + h^2); % maximum rho value computed from the diagonal length of the images
rho_d = 2 * rho_m/rho_num_bins; % distance between two rho values

% theta -90 ~ 90 
theta = linspace(-90, 90-180/theta_num_bins, theta_num_bins)*pi/180;

% simple voting scheme
[r, c] = find(img == 255);
for i = 1:size(r, 1)
    x = c(i);
    y = r(i);
    for theta_i = 1:theta_num_bins
        % rho equation
        rho = y*cos(theta(theta_i)) - x*sin(theta(theta_i));
        rho_i = round(rho/rho_d + rho_num_bins/2); % rho index
        % voting
        hough_space(rho_i, theta_i) = hough_space(rho_i, theta_i) + 1;
    end
end

% scaling hough space values by normalizing the matrix
scaled_hough_space = (hough_space - min(hough_space(:)))./ (max(hough_space(:) - min((hough_space(:))))) * 255;

hough_img = scaled_hough_space;

end