# World of Filters

## Edge Detection

OpenCV includes a number of filters meant to reveal the edges of objects including the Canny filter, the Scharr filter, and the Sobel filter. Each of these has different properties and is useful in different situations.

### Canny Edge Detection

Unlike the other two edge detection filters, the Canny filter returns a binary image: all-white pixels where it found an edge, and all-black pixels where it did not find an edge. Also, uniquely, the Canny filter has no directional options

### Sobel Edge Detection

<img src="http://gregborenstein.com/assets/opencv/find_sobel_edges_horizontal.gif" width="400px" /> <img src="http://gregborenstein.com/assets/opencv/find_sobel_edges_vertical.gif" width="400px" />

Notice the differences between the two modes, how each one affects the sides of the film frame and sprocket holes, the vertical stripes in the actor's shirt, and the lines in the soundtrack on the left of the frame.

### Scharr Edge Detection
