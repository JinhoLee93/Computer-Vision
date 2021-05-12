function mask = computeMask(img_cell)
mask = logical(img_cell{1});
for i=2:length(img_cell)
    mask = mask | logical(img_cell{i});
end
end
