# Computer-Vision
based on  digital image processing

Exercise -2 
1. Transformations between frames.
Use three frames (the world, the camera, the robot) to map the coordinates from one frame
to another. The world, robot and camera frames are given
W TW = (1 0 0 0 
        0 1 0 0
        0 0 1 0
        0 0 0 1 )        

W TR = (0.6645 −0.6645 0.3420 −2                  
        0.7071  0.7071   0     1
        −0.2418 0.2418 0.9397 −1
         0         0      0    1 )

W TC =  (0.1543 −0.6172 −0.7715  3
         0.9866 0.0538 0.1543    0
         0.0538 0.7850 −0.6172   3
            0      0      0      1 )
The task is to make 3 plots, each showing all frames relative to the world, robot and camera respectively. I.e., the first plot should contain frames W TW , W TR, W TC, the second plot should contain RTW ,RTR,RTC and the third plot should contain CTW ,CTR,CTC.In order to distinguish between the frames, it would also be helpful to label them with text on the plot. You can use function text in MATLAB, or function annotate! provided with extra materials if you use Julia and Plots package with Plotly (or PlotlyJS) backend. Refer to the additional materials for Julia for more information.            
            
 
2. Intrinsic calibration 
Consider a camera with the optical center (the principal point) (ox, oy) = (320, 240), the
effective size of the pixel (sx, sy) = (10µm, 10µm), µm = 10−6m, and the focal length
f = 16mm.
Find the pixel coordinates p of the projection of point CP = (1, 0, 8) (the camera coordinates given in meters).
You can neglect the effect of optical distortions.


3. Calibrated projection and weak perspective camera (2 points).
Download task2.mat file and load it. The file contains 3 variables:
• points - 3 × 19600 matrix containing 19600 3D points W Pi in the world frame coordinates.
• colors - 3 × 19600 matrix containing RGB colors for each point.
• wTc - 4 × 4 matrix defining frame W TC, where W is the world frame and C is thecamera frame. 
It is also known that the optical center (the principal point) is (ox, oy) = (70, 70), the effective size of the pixel (sx, sy) = (10µm, 10µm), µm = 10−6m, and the focal length  f = 16mm. Assume that there are no optical distortions. You can also find functions plot_color and plot_color_projection for plotting of colored
points in 3D space and the projection plane respectively in the given materials. In Julia, those functions use Makie library for its ability to efficiently plot large numbers of 3D points. If you have used Plots+Plotly (or PlotlyJS) before, function plot_frame! for Makie is provided as well.

 Complete the following subtasks:
(a) Use plot_color to plot given colored points in the world frame. Plot camera frame using plot_frame in world coordinates on the same figure.
(b) Construct 3 × 4 projection matrix M taking into account both the intrinsic and the extrinsic camera parameters. Use matrix M to find image plane projections of the
points given in task2.mat file.
(c) On a separate figure, plot projected points using function plot_color_projection. What do you see on the plot?
(d) Calculate point projection using weak-perspective camera (using the same camera parameters as before). Remember that the mean of Z coordinate should be taken in
camera frame coordinates!
(e) On a separate figure, plot newly projected points using function plot_color_projection. What do you see on the plot now? When can you use weak-perspective camera? Is it suitable for this particular case?

4. Projective points (1 point).
Consider a simple camera frame projection matrix (the intrinsic parameters)
M = (−f  0 0 0
      0 −f 0 0
      0  0 1 0 )

Compute the projection of the (homogeneous) point (X, Y, Z, W) = (1, 0, 1, 0) in terms of
f. Note that this point has no single corresponding point in the Euclidean space. Is its projection still somehow meaningful? Which Euclidean points project to the same location?

