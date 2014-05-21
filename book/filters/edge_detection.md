# Edge Detection

OpenCV includes a number of filters meant to reveal the edges of objects including the Canny filter, the Scharr filter, and the Sobel filter. Each of these has different properties and is useful in different situations.

## Canny Edge Detection

Unlike the other two edge detection filters, the Canny filter returns a binary image: all-white pixels where it found an edge, and all-black pixels where it did not find an edge. Also, uniquely, the Canny filter has no directional options

## Sobel Edge Detection

<img src="http://gregborenstein.com/assets/opencv/find_sobel_edges_horizontal.gif" width="400px" /> <img src="http://gregborenstein.com/assets/opencv/find_sobel_edges_vertical.gif" width="400px" />

Notice the differences between the two modes, how each one affects the sides of the film frame and sprocket holes, the vertical stripes in the actor's shirt, and the lines in the soundtrack on the left of the frame.

### Parameters 

The parameters for <code>findSobelEdges()</code> can be a little bit counterintuitive. 

The Sobel edge-detection algorithm works by amplifying changes in the values of neighboring pixels. It can look at horizontal neighbors, vertical neighbors, or both. Counterintuitively, looking for changes between horizontal neighbors ends up detecting vertical edges and vice versa. (Imagine an image with a strong vertical edge in it. The pixels that make up that edge differ strongly not from the ones immediately above and below them (their vertical neighbors) but from those to their left and right (their horizontal neighbors).)

The <code>findSobelEdges()</code> function takes two arguments, each an integer in the range 0-2. The first argument tells the Sobel algorithm how many horizontal neighbors to look at and the second how many vertical neighbors. The fewer neighbors you look at, the thicker and more intense the edges will be.

<a href="http://www.flickr.com/photos/unavoidablegrain/9191016933/" title="sobel edge direction comparison by atduskgreg, on Flickr"><img src="http://farm8.staticflickr.com/7436/9191016933_abaf2cc508.jpg" width="346" height="500" alt="sobel edge direction comparison"></a>

So, putting this into action, we can find horizontal edges like this:

    opencv.findSobelEdges(0,1);

vertical edges:

    opencv.findSobelEdges(1,0);

thinner vertical edges:

    opencv.findSobelEdges(2,0);

and edges in both directions equally:

    opencv.findSobelEdges(1,1);

## Scharr Edge Detection
