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
- We are using Modified Laplacian for our mask that will later be used to convolute each image with. 
- Convolute each image in the focal stack with the mask created.  
- 
