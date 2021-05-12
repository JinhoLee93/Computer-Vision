function [center, radius] = findSphere(img)
bw = im2bw(img, 0.5);

stats = regionprops('table', bw, 'Centroid', ...
    'MajorAxisLength', 'MinorAxisLength');

center = stats.Centroid; 
diameter = mean([stats.MajorAxisLength stats.MinorAxisLength], 2);
radius = diameter/2;

end