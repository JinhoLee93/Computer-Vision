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
- ![two_objects](https://user-images.githubusercontent.com/60580427/117791731-94b1b200-b285-11eb-9bae-f2b5346d25d0.png)
