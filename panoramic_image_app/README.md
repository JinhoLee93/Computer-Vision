# Panoramic Image App

**Project created by [Professor Shree K. Nayar](http://www.cs.columbia.edu/~nayar/)**

Written by Jinho Lee (jl5027@columbia.edu)

Think of this app as the iPhone panoramic camera (but in lower quality and not live. Good job, Apple!)!

The app combines three images in order to make one panoramic image. This project is so cool in three major aspects:
- As long as there are enough number of shared features that can be detected by [SIFT detector](https://en.wikipedia.org/wiki/Scale-invariant_feature_transform), you can make your own panoramic photo with this app!
- Should angles in which you take the pictures matter? No! This app is smart enough to match all the images in the same angle using [Affine Transformation](https://en.wikipedia.org/wiki/Affine_transformation).
- But what happens if there's inconsistent lighting in each picture? Will that affect the productivity of this app? No! The app will blend the images so that it produces one complete panoramic image!


