# Photometric Stereo

Written by Jinho Lee (jl5027@columbia.edu)

[Photometric Stereo](https://en.wikipedia.org/wiki/Photometric_stereo) is a very essential computer vision technique for the computer to recognize the shapes of objects.

The information we need to gather to conduct photometric stereo is 
- An object with a [Lambertian surface](https://en.wikipedia.org/wiki/Lambertian_reflectance) since lights reflected on Lambertian surfaces have the same brightness all over the surfaces and they only differ in magnitude based on their directions. Illustrated below is the typical behavior of lights reflected on Lambertian surfaces. <img width="1089" alt="Screen Shot 2021-05-12 at 5 40 38 PM" src="https://user-images.githubusercontent.com/60580427/117945352-34844400-b349-11eb-8de6-e645a3682309.png"> (Provided by [Professor Nayar](http://www.cs.columbia.edu/~nayar/))

- Pictures of the object with lights from different directions shining on it
- Properties of the object
- Correct light directions
- Surface normals

Let's say we want to recognize this sphere below.
- <img src="https://user-images.githubusercontent.com/60580427/117942486-1537e780-b346-11eb-9a55-763a06b76d3e.png" width="20%" height="20%">

To begin with, the computer needs to be able to detect the sphere. 
- I'm using [im2bw function](https://www.mathworks.com/help/images/ref/im2bw.html) from MATLAB to render it easier to get the object properties in [findSphere.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/photometric_stereo/findSphere.m).

Now we have all the information we need from the sphere. The computer is able to detect it! The next step should be gathering information from light directions. 
- As we can see from the picture of the sphere above, only the magnitude of the brightness changes on the surface.
- So, only the magnitude differs. We kind of understand what's going on here. Further away from the light source, the lower the magnitude of the brightness, which insinuates we can actually compute the direction of the light by finding pixels with maximum brightness!
- More pictures with the sphere lit by different light sources are already prepared.
- We need to compute each light direction in every individual image with [computeLightDirections.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/photometric_stereo/computeLightDirections.m)
- After we have the pixels with the maximum magnitude of the brightness, we need to interpret each point on the sphere in 3D world into that of 2D world! Thus, we need to translate the 3D information of the pixels (x, y, z) into the computer's 2D coordinate (x, y).
  - How? Take a look at Equations in three-dimensional space in [the sphere equation](https://en.wikipedia.org/wiki/Sphere) and, with that information, normalize the coordinates. 

We are using the directions when we get the surface normals of the object. Before that, let's create a mask, which is an image composed only by binary numbers, for the object. The mask will be used to lay the surface normals on.
- The mask is easily made with [computeMask.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/photometric_stereo/computeMask.m). 
- <img src="https://user-images.githubusercontent.com/60580427/117954254-ce4fef00-b351-11eb-8886-be0f0f4d9a8d.png" width="20%" height="20%">

Let's try doing the same process with a little bit more complicated object, like the vase below.
- <img src="https://user-images.githubusercontent.com/60580427/117954453-fe978d80-b351-11eb-986a-836c3e229a7d.png" width="20%" height="20%">
- <img src="https://user-images.githubusercontent.com/60580427/117954525-11aa5d80-b352-11eb-8cd3-ad66f5f5cf32.png" width="20%" height="20%">
- Perfect! And we're almost there!

The last step is to compute the vase's surface normals based on the information we've gathered. 
- In [computeNormals.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/photometric_stereo/computeNormals.m), we are creating the vase's albedo image, which consists of image values between 0 and 1, and a matrix with its surface normals. 
  - First, we're making an image intensity map, I, of the vase. Since we don't need to include any background, which is black anyway, in the intensity map, we are only concerned about the pixels with brightness value. 
  - To get normal, we're using the [Pseudo-Inverse technique](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse) with the light directions we've calculated before.
  - Since the albedo image has to only have values between 0 and 1, don't forget to normalize!
  - Albedo image:
  - <img src="https://user-images.githubusercontent.com/60580427/117960626-24c02c00-b358-11eb-9b01-7965f482f84a.png" width="20%" height="20%">
  - The surface normals layed on the mask:
  - <img src="https://user-images.githubusercontent.com/60580427/117969132-019a7a00-b362-11eb-9ce3-461af7cddf2d.png" width="20%" height="20%">

Let's reconstruct the shape of the vase to see everything went correctly!
- <img width="50%" height="50%" src="https://user-images.githubusercontent.com/60580427/117969412-53430480-b362-11eb-867d-ca71bc5fa8c4.png">
- Pretty impeccable! 

