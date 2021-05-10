function line_detected_img = lineFinder(orig_img, hough_img, hough_threshold)
hough_threshold = hough_threshold * max(hough_img(:));
[rows, cols] = size(orig_img);
[R, T] = size(hough_img);

% These are all the same as b.
rho_m = sqrt(rows^2 + cols^2); 
rho_d = 2 * rho_m/(R-1);

thetas = linspace(-90, 90-180/T, T)*pi/180;

% Peak detection
peaks = [];
for x = 1:R
    for y = 1:T
        if hough_img(x, y) >= hough_threshold
            peaks = [peaks; [x, y]];
        end
    end
end

fig = figure(); imshow(orig_img);
hold on;
%plot(peaks(:, 2), peaks(:, 1), 'rx');

% Drawing lines
for i = 1:size(peaks)
    rho = rho_d * (peaks(i, 1) - R/2);
    theta = thetas(peaks(i, 2));
    line(1:cols, ((1:cols)*tan(theta))+(rho/cos(theta)),'Color','r');
end

line_detected_img = saveAnnotatedImg(fig);
delete(fig);

end

function annotated_img = saveAnnotatedImg(fh)
figure(fh); % Shift the focus back to the figure fh

% The figure needs to be undocked
set(fh, 'WindowStyle', 'normal');

% The following two lines just to make the figure true size to the
% displayed image. The reason will become clear later.
img = getimage(fh);
truesize(fh, [size(img, 1), size(img, 2)]);

% getframe does a screen capture of the figure window, as a result, the
% displayed figure has to be in true size. 
frame = getframe(fh);
frame = getframe(fh);
pause(0.5); 
% Because getframe tries to perform a screen capture. it somehow 
% has some platform depend issues. we should calling
% getframe twice in a row and adding a pause afterwards make getframe work
% as expected. This is just a walkaround. 
annotated_img = frame.cdata;

end