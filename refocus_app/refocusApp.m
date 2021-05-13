function refocusApp(rgb_stack, depth_map)
i = randi(size(rgb_stack, 3)/3);
[r, c, p] = size(rgb_stack);

% Terminating the program when any point outside the image frame cannot be
% done by clicking the background. So please it is encouraged to enlarge the image
% frame a little bigger and click any gray part outside the image frame
% within the window to close all the popped up windows and to terminate the
% program.
% Please do not click the background. The windows will end up hiding behind
% the Matlab window.
while true
    
    % loadFocalStack
    img = rgb_stack(:, :, (i - 1) * 3 + 1:i * 3); 
    fig = figure('Name', 'Choose a point', 'NumberTitle', 'off'); imshow(img/255) 
    
    % I tried making program termination easier by enlarging the windows so
    % that there would be some space for clicking outside the image frame
    % by intentionally making the window larger than the original image
    % size, yet that felt extremely bad because Matlab takes a lot to
    % resize popup windows (which was really annoying) and made
    % transitions between pictures feel unsatisfying and unsmooth. 
    %set(gcf,'MenuBar','none')
    %truesize
    
    [x, y] = ginput(1);
    
    % Terminates when a point outside the picture frame was clicked.
    if x < 0 || x > c || y < 0 || y > r
       break;
    end
    hold on;
    plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 5);
    x = round(x);
    y = round(y); 
    
    % Brings the newly focused image.
    i = depth_map(y, x);
end
close all;
end