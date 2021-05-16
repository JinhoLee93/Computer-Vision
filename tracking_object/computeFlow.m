function result = computeFlow(img1, img2, win_radius, template_radius, grid_MN)
[R, C] = size(img1);
r = grid_MN(1);
c = grid_MN(2);
half_r = R/r / 2;
half_c = C/c / 2;
m_x = zeros(r, c);
m_y = zeros(r, c);
for i = half_r : half_r * 2 : R - half_r
    for j = half_c : half_c * 2 : C - half_c
        % Template from the first image
        template = img1(max(1, i - template_radius) : min(R, i + template_radius), ...
                        max(1, j - template_radius) : min(C, j + template_radius));
        
        % Window for the second image
        window = img2(max(1, i - win_radius) : min(R, i + win_radius), ...
                      max(1, j - win_radius) : min(C, j + win_radius));
        
        % Using normxcorr2 to find correlation between the two images
        co = normxcorr2(template, window);
        
        % Remove the padding that normxcorr2 adds arbitrarily
        co = co(size(template, 1) : size(co, 1) - size(template, 1), size(template, 2) : size(co, 2) - size(template, 2));
        [ypeak, xpeak] = find(co == max(co(:)));
        m_x(i - half_r + 1, j - half_c + 1) = xpeak(1) - (max(1, i - template_radius) - max(1, i - win_radius) + 1);
        m_y(i - half_r + 1, j - half_c + 1) = ypeak(1) - (max(1, j - template_radius) - max(1, j - win_radius) + 1);
    end
end

fig = figure; imshow(img1);
hold on;
% Drawing arrows
for i = 1 : half_r * 2 : R
    for j = 1 : half_c * 2 : C
        quiver(j + half_c, i + half_r, m_y(i, j), m_x(i, j), 'r', 'MaxHeadSize', 1);
    end
end
img = getimage(fig);
truesize(fig, [size(img, 1), size(img, 2)]);
F = getframe(fig);
result = F.cdata;
end