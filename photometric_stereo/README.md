# Photometric Stereo

Written by Jinho Lee (jl5027@columbia.edu)

[Photometric Stereo](https://en.wikipedia.org/wiki/Photometric_stereo) is a very essential computer vision technique for the computer to recognize the shapes of objects.

The information we need to gather to conduct photometric stereo is 
- Pictures of an object with lights from different directions shining on it
- Properties of the object
- Correct light directions
- Surface normals

Let's say we want to recognize this sphere below.
- <img src="https://user-images.githubusercontent.com/60580427/117942486-1537e780-b346-11eb-9a55-763a06b76d3e.png" width="20%" height="20%">

First, we need to translate the 3D information of the sphere into the computer's 2D world. Then, how do we adjust any 3D information into 2D?
- To begin with, the computer needs to be able to detect the sphere. 
- I'm using [im2bw function](https://www.mathworks.com/help/images/ref/im2bw.html) from MATLAB to render it easier to detect the object in [findSphere.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/photometric_stereo/findSphere.m).
