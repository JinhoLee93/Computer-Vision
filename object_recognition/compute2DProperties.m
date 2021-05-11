function [db, out_img] = compute2DProperties(orig_img, labeled_img)

db = []; %# of objects in the image, 6 properties
fig = figure(); imshow(orig_img);

for label = 1:max(labeled_img(:))
    % Find the matrix with the current label
    img = double(labeled_img == label);
    
    % Minimum inertia prep
    [rows, cols] = size(img);
    x = ones(rows, 1)*[1:cols];
    y = [1:rows]'*ones(1, cols);
    
    % Center column and row
    area = sum(sum(img)); % 7th property
    cc = sum(sum(double(img).*x))/area;
    cr = sum(sum(double(img).*y))/area;
     
    % Plot the center point
    hold on; plot(cc, cr, 'ws', 'MarkerFaceColor', [1, 0, 0]); hold off;
    
    % x' and y' to fill up the inertia equation
    x_p = x - cc;
    y_p = y - cr;
    
    a = sum(sum(double(img).*(x_p.^2)));
    b = 2*sum(sum(double(img).*(x_p.*y_p)));
    c = sum(sum(double(img).*(y_p.^2)));

    % ori is the orientation of the object
    theta = atan2(b, a-c)/2;
    theta_p = theta + (pi/2);
    ori = theta * 180/pi; % degree

    % e_min = minimum inertia
    e_min = a*sin(theta).^2 - (b*sin(theta)*cos(theta)) + c*cos(theta).^2;
    e_max = a*sin(theta_p).^2 - (b*sin(theta_p)*cos(theta_p)) + c*cos(theta_p).^2;

    % roundness
    roundness = e_min / e_max;

    % final product
    properties = [double(label), cr, cc, e_min, ori, roundness, area]';
    
    db = [db, properties];
    
    % Drawing the line
    x_e = cc + cosd(ori) * 50;
    y_e = cr + sind(ori) * 50;
    hold on; line([cc, x_e], [cr, y_e],'LineWidth',4 ,'Color', [0, 1, 0]); hold off;
end

out_img = saveAnnotatedImg(fig);
delete(fig);

end 

