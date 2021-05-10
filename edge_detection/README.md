# Edge Detection

Written by Jinho Lee (jl5027@columbia.edu)

Before starting this project, one must understand what edges are!
- By [Professor Nayar](http://www.cs.columbia.edu/~nayar/)'s term, edges are "rapid change in image intensity within small region."
- So, basically, edges make it easier for computers to recognize images due to their "rapid change"!

One of the most famous edge detection algorithms is [Hough Transform](https://en.wikipedia.org/wiki/Hough_transform) and I'm going to use Hough Transform to detect lines from images.

Hough Tranform
- Works with two dependent spaces, one for Image Space and the other for Hough (Parameter) Space.
- Parameterization differs by the metric, for example, you can parameterize either lines or sinusoids from Image Space into Hough Space.  However, sinusoids are much better in term of getting definite results since slope values are <img src="https://latex.codecogs.com/gif.latex?-\infty\leq{m}\leq\infty">, whereas the range of sinusoids is finite <img src="https://latex.codecogs.com/gif.latex?0\leq\theta\leq\pi">. Sinusoid parameterization is used for this project.
  - So, a point on a line in Image Space becomes a sinusoid in Hough Space. 
- There are two parameters in Image Space, <img src="https://latex.codecogs.com/gif.latex?\rho"> and <img src="https://latex.codecogs.com/gif.latex?\theta">.
  - <img src="https://latex.codecogs.com/gif.latex?\rho"> is the distance from the origin to a certain point, and <img src="https://latex.codecogs.com/gif.latex?\theta"> is the angle between x axis and the line in Image Space.
- <img src="https://latex.codecogs.com/gif.latex?\rho"> and <img src="https://latex.codecogs.com/gif.latex?\theta"> become two primary axes in Hough Space. Then now you have a sinusoid for each point on the line.
- Recall "a point on the line becomes a sinusoid." This means sinusoids will be accumulated when an edge is detected. And we need an "Accumulator" to do so.

We will generate Hough accumulator with [generateHoughAccumulator](https://github.com/JinhoLee93/Computer_Vision/blob/main/edge_detection/generateHoughAccumulator.m)
- First, we define rho and theta of Hough Space according to those in Image Space.
- Then accumulate all the sinusoids.
- We will test the performance with this photo below
- ![hough_2](https://user-images.githubusercontent.com/60580427/117628146-cd815680-b1b3-11eb-80b9-1be2b97f2ca9.png)
- Let's see what happens when you put this through the accumulator!
- <img src="https://user-images.githubusercontent.com/60580427/117628258-e984f800-b1b3-11eb-8f0d-1906a44441bc.png" height="30%">
- From the result, you can clearly see accumulated sinusoids and the focus of it is the accumulated intersections that are shown by higher brightness than other intersections. Each of them represents a line in Image Space.
- And I circled some of the intersections so that you can see them more clearly.
- <img width="179" alt="Screen Shot 2021-05-10 at 5 22 29 PM" src="https://user-images.githubusercontent.com/60580427/117628904-9495b180-b1b4-11eb-8744-cff6169f3598.png">

