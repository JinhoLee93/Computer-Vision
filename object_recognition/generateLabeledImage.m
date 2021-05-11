function labeled_img = generateLabeledImage(gray_img, threshold)
% Turning a grayscale image to a binary image
bw = im2bw(gray_img, threshold);

% Labeling the binary image
[label, n] = bwlabel(bw);

labeled_img = label;

end
