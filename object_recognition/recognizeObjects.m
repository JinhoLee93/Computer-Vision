function output_img = recognizeObjects(orig_img, labeled_img, obj_db)
% properties = [double(label), cr, cc, e_min, ori, roundness, area]';
matched = [];
fig = figure(); imshow(orig_img);

for label = 1:max(labeled_img(:))
    img = double(labeled_img == label);
    
    [rows, cols] = size(img);
    x = ones(rows, 1)*[1:cols];
    y = [1:rows]'*ones(1, cols);
    
    area = sum(sum(img));
    cc = sum(sum(double(img).*x))/area;
    cr = sum(sum(double(img).*y))/area;
    
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
    
    thr_round = 0.028;
    
    details = [double(label), cr, cc, e_min, ori, roundness, area]';

    for i = 1:size(obj_db, 2)
        if obj_db(7, i) == area
            matched = [matched, details];
        end
        if obj_db(2, i) == cr && obj_db(3, i) == cc
            matched = [matched, details];
        end
        if obj_db(4, i) == e_min
            matched = [matched, details];
        end
        if obj_db(5, i) == ori
            matched = [matched, details];
        end
        if (roundness + thr_round) >= obj_db(6, i) && obj_db(6, i) >= (roundness - thr_round)
            matched = [matched, details];
        end
    end
end

for i = 1:size(matched, 2) 
    hold on; plot(matched(3, i), matched(2, i), 'ws', 'MarkerFaceColor', [1, 0, 0]); hold off;
    % Drawing the line
    x_c = matched(3, i); 
    y_c = matched(2, i); 
    x_e = x_c + cosd(matched(5, i)) * 50;
    y_e = y_c + sind(matched(5, i)) * 50;
    hold on; line([x_c, x_e], [y_c, y_e],'LineWidth',4 ,'Color', [0, 1, 0]); hold off;
end

output_img = saveAnnotatedImg(fig);
delete(fig);

end


