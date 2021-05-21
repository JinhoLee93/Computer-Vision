# Tracking Object

Written by Jinho Lee (jl5027@columbia.edu)

We can track objects by calculating its optical flow.
- Optical flow is the difference between the object's original poistion and its later position taken with a time difference. 
- Simple optical flow calculation can be conducted by [Lucas-Kanade Solution](https://en.wikipedia.org/wiki/Lucas%E2%80%93Kanade_method), but we're not using it here to build something simpler.

Check how this program works [here](https://youtu.be/835PWrawUNg).

This tracking app calculates the optical flow with a simple [template matching method](https://en.wikipedia.org/wiki/Template_matching#:~:text=Template%20matching%20is%20a%20technique,to%20detect%20edges%20in%20images.).

[computeFlow.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/tracking_object/computeFlow.m)
- Calculates the optical flow of the scene with a simple template matching method. 
  - The scene should consist of frames and, in each frame, the objects should show some sense of movement.
- The optical flow will be shown with red arrows like below:
- <img src="https://user-images.githubusercontent.com/60580427/118400793-1c405c00-b69e-11eb-9d2e-a19bb4f5a6e0.png" height="50%" width="50%">
- In order to carry out template matching, we need to find the correlation between the two images. I used [normxcorr2](https://www.mathworks.com/help/images/ref/normxcorr2.html). 
  - However, normxcorr2 arbitrarily adds a padding, so, to get correct results, don't forget to account for the padding. 
- Draws red arrows according to the optical flow in each window.

[trackingTester.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/tracking_object/trackingTester.m)
- Since this was also implemented with the same, simple template matching method as [computeFlow.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/tracking_object/computeFlow.m), perfect results are NOT expected.
- Tracks an object in the image with a rectangular box, using the color map and color [histogram](https://en.wikipedia.org/wiki/Histogram) of the image, especially of the target object.
  - [rgb2ind](https://www.mathworks.com/help/matlab/ref/rgb2ind.html) is a very useful tool for acquiring both color maps and color histograms of images.
  - For histograms, [histcounts](https://www.mathworks.com/help/matlab/ref/histcounts.html) should be used in order to fill up the bins.
- Use [im2col](https://www.mathworks.com/help/images/ref/im2col.html) to 
- The later parts will be quite similar to [computeFlow.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/tracking_object/computeFlow.m).
- Let's say that we want the program to track the person in this frame below: 
- <img src="https://user-images.githubusercontent.com/60580427/118978888-d263b880-b9b2-11eb-9adc-b85287460256.png" height="30%" width="30%">
- The later frames will also feature the same person but in different position each frame.
- Will it track the person pretty well? Let's find out!
- As you can see from [the result](https://youtu.be/835PWrawUNg), it tracks the person reasonably well like the frame below even though it loses its track somewhere in the middle.
- <img src="https://user-images.githubusercontent.com/60580427/119111702-460ecf80-ba5e-11eb-9e29-6daf6912741a.png" height="30%" width="30%">
- However, in case of the ball below: 
- <img src="https://user-images.githubusercontent.com/60580427/119111410-01833400-ba5e-11eb-9dec-1575e63a4041.png" height="30%" width="30%">
- Though, in the beginning, the program tracks it very well, yet, several frames later, the program loses its track like below:
- <img src="https://user-images.githubusercontent.com/60580427/119113051-ab16f500-ba5f-11eb-9c52-b6938133e303.png" height="30%" width="30%">
- There are two reasons why the program doesn't track the ball as well as the person that I can come up with: 
  - 1. Blame it on the limit of template matching (I feel much better with this ;-)).
  - 2. Maybe I'm doing something wrong with placing the box.
