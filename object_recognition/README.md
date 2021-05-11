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

And we want to recognize those two objects among other objects in the image below
- <img src="https://user-images.githubusercontent.com/60580427/117792836-9fb91200-b286-11eb-9962-4122cc31a012.png" width="40%" height="40%">

How are we supposed to use the calculated properties to do so?
- we just apply the properties to the image with a bunch of other objects!

We will see if the properties are enough to recognize the first two objects by using [recognizeObjects](https://github.com/JinhoLee93/Computer_Vision/blob/main/object_recognition/recognizeObjects.m)!
- First, we get all the properties of the objects present.
- I added some threshold (0.028) so that the differences between the properties of the first two objects and the others'.
- The result looks like:
- <img src="https://user-images.githubusercontent.com/60580427/117797645-35ef3700-b28b-11eb-8dca-1c8048dfdcbf.png" height="40%" width="40%">
- I'd say this works really well!
- However, due to the simplicity of 2-D properties, when objects have very similar properties with the ones that you want to recognize, this won't produce desirable outputs just like the image below;
- <img src="https://user-images.githubusercontent.com/60580427/117798907-8d41d700-b28c-11eb-8be3-a5f6a3203fcb.png" height="40%" width="40%">
- In this case, the fork and knife are also recognized. This is the thing about 2-D properties. They are pretty straightforward in terms of calculations, yet they are too simple to be recognized. So, use 2-D properties to recognize objects with a grain of salt!
