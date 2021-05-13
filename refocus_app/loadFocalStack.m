function [rgb_stack, gray_stack] = loadFocalStack(focal_stack_dir)

focal_stack_dir = ['./', focal_stack_dir, '/'];
files = dir([focal_stack_dir, '/frame*']);
file = [focal_stack_dir, files(1).name];
[r, c, p] = size(imread(file));
rgb_stack = zeros(r, c, 3 * length(files));
gray_stack = zeros(r, c, length(files)); 

for i = 1:length(files)
    file = [focal_stack_dir, files(i).name];
    img = imread(file);
    
    % One rgb image takes 3 channels so I calibrate the channel number
    % manually so that each image corresponds to each 3 channels of
    % rgb_stack.
    rgb_stack(:, :, (i - 1) * 3 + 1 : i * 3) = img;
    gray_stack(:, :, i) = im2gray(img);
end
end