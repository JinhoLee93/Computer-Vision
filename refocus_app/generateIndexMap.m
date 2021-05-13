function index_map = generateIndexMap(gray_stack, w_size)
% from the Discrete Laplacian Operator slides
M = (1/6) * [1 4 1; 4 -20 4; 1 4 1];
for i=1:size(gray_stack, 3)
    % Step 1
    % Convolutions and the absolute operation of Modified Laplacian
    x = abs(imfilter(gray_stack(:, :, i), M, 'replicate', 'conv'));
    y = abs(imfilter(gray_stack(:, :, i), M', 'replicate', 'conv'));    
    fm = x + y;
    
    % Assigning each page of gray_stack its focus measure
    gray_stack(:, :, i) = fm;
    
    % Step 2
    % Putting average filter on the image in order to minimize the noise.
    gray_stack(:, :, i) = imfilter(gray_stack(:, :, i), fspecial('average', [w_size w_size]), ...
        'replicate', 'conv');
end

% Choose the maximal focus measure 
[m, index_map] = max(gray_stack, [], 3);
end
