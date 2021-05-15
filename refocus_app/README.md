# Refocus App

Written by Jinho Lee (jl5027@columbia.edu)

This application will focus wherever in a scene the user clicks. To illustrate the purpose better, check out my [YouTube video](https://youtu.be/qJmX-NFqSr0) to see how this app works.

I've implemented depth from focus/defocus to create this app. So, what we need to complete this app is:
- [loadFocalStack.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/refocus_app/loadFocalStack.m)
  - Loads a focal stack (a bunch of pictures of the same scene with different focuses) into memory.
- [generateIndexMap.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/refocus_app/generateIndexMap.m) 
  - Makes an index map based on the focal stack.
    - An index map is an image with each pixel corresponding to a scene point.
- [refocusApp.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/refocus_app/refocusApp.m)
  - Executes the app. 

Loading the focal stack is not a hard job. So, I'm going to skip the description of it here. 

[generateIndexMap.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/refocus_app/generateIndexMap.m) 
- We are using Discrete Laplacian for our mask that will later be used to convolute each image with. 
- Now, we need a gray stack to apply the focus measure for the index map.
  - Convolute the focal stack.
  - Then the gray stack will be calculated with Modified Laplacian. 
- Convolute each image in the focal stack with the mask created.  
- Since there's quite a noise in the gray stack, we need to smooth it with [imfilter](https://www.mathworks.com/help/images/ref/imfilter.html). 
  - Here, I'm using an average filter because it gives similar results as a Gaussian smoothing filter.

[refocus_app](https://github.com/JinhoLee93/Computer_Vision/blob/main/refocus_app/refocusApp.m)
- This implementation will allow the user to click wherever he wants on the displayed image and the clicked point will be on focus. 
  - Click points are implemented by [gipuut](https://www.mathworks.com/help/matlab/ref/ginput.html).
- The transition between focuses should be smooth. 
