function trackingTester(data_params, tracking_params)
mkdir(fullfile(data_params.out_dir));
img = imread(fullfile(data_params.data_dir, data_params.genFname(data_params.frame_ids(1))));

% Select the template
rect = tracking_params.rect;
target = img(rect(2) : rect(2) + rect(4) - 1, rect(1) : rect(1) + rect(3) - 1, :);

% Calculate the color map of the target area and its histogram
bin = tracking_params.bin_n;
[M, map] = rgb2ind(target, bin);
H = histcounts(M(:), bin);

search_win_size = tracking_params.search_half_window_size;

% Track the target
for i = 1 : size(data_params.frame_ids, 2)
    img = imread(fullfile(data_params.data_dir, data_params.genFname(data_params.frame_ids(i))));
    [r, c, p] = size(img);
    
    w = img(max(1, rect(2) - search_win_size(2)) : min(r, rect(2) + rect(4) + search_win_size(2)) - 1, ...
              max(1, rect(1) - search_win_size(1)) : min(c, rect(1) + rect(3) + search_win_size(1)) - 1, :);

    w_c(:, :, 1) = im2col(w(:, :, 1), [rect(4), rect(3)]);
    w_c(:, :, 2) = im2col(w(:, :, 2), [rect(4), rect(3)]);
    w_c(:, :, 3) = im2col(w(:, :, 1), [rect(4), rect(3)]);
    
    % Do the same calculation of the color map and its histogram but in
    % the windows
    for j = 1 : size(w_c, 2)
        W(:, j) = rgb2ind(w_c(:, j, :), map);
        H_w(:, j) = histcounts(W(:, j), bin);
    end
 
    co = normxcorr2(H', H_w);
    [ypeak, xpeak] = find(co == max(co(:)));
    x = (xpeak / search_win_size(1) * 2) + max(1, rect(1) - search_win_size(1));
    y = (ypeak / search_win_size(1) * 2) + max(1, rect(2) - search_win_size(2));
    box = drawBox(img, [x y rect(3) rect(4)], [0 0 255], 1);
    imshow(box);
    imwrite(box, fullfile(data_params.out_dir, data_params.genFname(data_params.frame_ids(i))));
end
end