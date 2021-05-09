function out_img = blendImagePair(wrapped_imgs, masks, wrapped_imgd, maskd, mode)
wrapped_imgs = im2double(wrapped_imgs);
wrapped_imgd = im2double(wrapped_imgd);

if strcmp(mode, 'blend')    
    % Weighted blending
    masks = bwdist(~masks);
    maskd = bwdist(~maskd);
    w1 = cat(3, masks, masks, masks);
    w2 = cat(3, maskd, maskd, maskd);
    w1I1 = wrapped_imgs .* w1;
    w2I2 = wrapped_imgd .* w2;
    blended = (w1I1 + w2I2) ./ (w1 + w2);
    
    out_img = blended;
    
elseif strcmp(mode, 'overlay')
    masks = logical(masks);
    maskd = logical(maskd); 
    
    % Find the overapped area
    overlay = masks & maskd;
    
    n_masks = masks;
    
    % Delete the overapped area from imgs
    n_masks(find(overlay == 1)) = 0;
    
    n_imgs = wrapped_imgs .* cat(3, n_masks, n_masks, n_masks);
    
    out_img = n_imgs + wrapped_imgd;

end

