# Panoramic Image App

**Project created by [Professor Shree K. Nayar](http://www.cs.columbia.edu/~nayar/)**

Written by Jinho Lee (jl5027@columbia.edu)

Think of this app as the iPhone panoramic camera (but in lower quality and not live. Good job, Apple!)!

The app combines three images in order to make one panoramic image. This project is so cool in three major aspects:
- As long as there are enough number of shared features that can be detected by [SIFT detector](https://en.wikipedia.org/wiki/Scale-invariant_feature_transform), you can make your own panoramic photo with this app!
- Should angles in which you take the pictures matter? No! This app is smart enough to match all the images in the same angle using [Affine Transformation](https://en.wikipedia.org/wiki/Affine_transformation).
- But what happens if there's inconsistent lighting in each picture? Will that affect the productivity of this app? No! The app will blend the images so that it produces one complete panoramic image!

Before we jump into making a panoramic image, there are a few prerequisite steps to prepare for.
- To detect the same features shared in the pictures in different angle with SIFT detector, we should come up with a way to compute [homography](https://en.wikipedia.org/wiki/Homography) between two pictures, one as the center image and the other for either the left or the right image. 
  - [computeHomography.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/panoramic_image_app/computeHomography.m) calculates homography between the two.
    - Compute homography with simple matrix A. And A'* A becomes an eigenvector problem.
    - Return the computed homography
  - Let's see how well the homography computed works in a real problem using [applyHomography.m](https://github.com/JinhoLee93/Computer_Vision/blob/main/panoramic_image_app/applyHomography.m)!
    - Apply the homography to the destination image, in here, the differently angled image.
    - Since the homography is homogenous, let's turn that back to the image coordinate by dividing each entry with the last imaginary entry.
    - Let's test the homography with these two images! 
    - ![portrait_small](https://user-images.githubusercontent.com/60580427/117561631-612f2600-b0d3-11eb-8428-615f36a9b2e7.png)
    - ![portrait_transformed](https://user-images.githubusercontent.com/60580427/117561637-69876100-b0d3-11eb-9df1-162d3eba8ba9.png)





