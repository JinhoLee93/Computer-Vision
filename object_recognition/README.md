# Object Recognition

Written by Jinho Lee (jl5027@columbia.edu)

How do our computers recognize objects? Is it even possible? Yes! Very easily with the objects' 2-D properties!

The properties of an object in an image to be used here are: 
- Center column
- Center row
- Minimum inertia
- Orientation
- Roundness
- Area

[compute2DProperties](https://github.com/JinhoLee93/Computer_Vision/blob/main/object_recognition/compute2DProperties.m) calculates those stated above and draws a line on each object to show its orientation. 
- How does it work? Let's see some result!
- I'm using this image below to recognize the objects in it among a bunch of other things;
- <img src="https://user-images.githubusercontent.com/60580427/117791731-94b1b200-b285-11eb-9bae-f2b5346d25d0.png" height="40%" width="40%">
- So, what happens after I compute the properties of the objects? Will the program correctly calculate the orientations and the centers of the objects?
- <img src="https://user-images.githubusercontent.com/60580427/117792442-3f29d500-b286-11eb-9d8b-9762c92b8a43.png" height="40%" width="40%">
- The green lines signify the objects' orientations and the red dots does their centers.



