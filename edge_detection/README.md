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
