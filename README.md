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
            
 
