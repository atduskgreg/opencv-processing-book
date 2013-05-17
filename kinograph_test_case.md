## Getting Started with Computer Vision Test Case 1: Film Scanner Frame Extractor

### Problem
[Kinograph](http://mepler.com/Kinograph) is an open source DIY film scanner currently under development by Matt Epler, an archivist and hacker. Film scanners digitize analogue movies by photographing each frame of film one at a time. Existing models cost upwards of $100,000. Much of the cost arises from the need for precision hardware to place each frame of film in exactly the same location every time.

Using computer vision, we can reduce the need for this precision. Instead of having to get each film frame into exactly the same spot, we can write a program that finds each frame within an image and extracts it.

Kinograph's software uses exactly these techniques. The result is that Kinograph's hardware costs less than $1,000 and will be available to many more archivists enabling the preservation of many films that would otherwise be lost.

In this test case, we'll approach the problem of detecting and extracting frames from images of a film captured with Kinograph. We'll see how OpenCV's image filtering, edge detection, contour detection, and polygon approximation functions can be used to align and extract individual frames from the scanned film.

### Approach Summary

<a href="http://www.flickr.com/photos/unavoidablegrain/8709890513/" title="Screen Shot 2013-05-05 at 11.51.58 AM by atduskgreg, on Flickr"><img src="http://farm9.staticflickr.com/8404/8709890513_bc8a98f9a4.jpg" width="500" height="396" alt="Screen Shot 2013-05-05 at 11.51.58 AM"></a>

Kinograph scans (as seen above on the left) present two main challenges for frame extraction: rotation and overshoot.

As the film moves through the machine it does not always stay perfectly parallel to the DLSR that captures the scans. In order to correct the resulting rotation, we'll use contour detection and polygon approximation to find vertical lines in the image. We can then calculate the rotation of these lines away from vertical and rotate the image to correct the problem.

Each Kinograph scan captures more than just the current frame. As you can see in the image above, half of the previous and next frames are also visible. In order to extract only one frame, we'll use edge detection to find the sprocket hole that corresponds the top of the current frame.

Between these two techniques we'll be able to extract exactly the frame we're looking for.

### Outline

#### Frame Alignment

* The image is loaded up and resized.
* Convert the image to gray
* Find sobel edges in the x-dimension (i.e. vertical)
* Threshold the image
* Find contours
* Calculate polygon approximations of the contours
* Measure the angle of each straightened contour from true vertical
* Average these angles together
* Rotate the original image based on this average angle
* Save the result

#### Frame Extraction

* The image is loaded up and resized.
* A Region of Interest is defined in the center of the image
* To find the top and bottom of the frame:
    * Find y-dimension sobel edges in the ROI
    * Threshold sobel image
    * Look at each row of the image at the searchColumn y-position
    * If the pixel is white (and the one above it was not), we've found the edge of the top sprocket
    * Top of top sprocket is the top of the frame, measure the fixed frameHeight from there to find the bottom of the frame
* To find the left and right sides of the frame:
    * Find x-dimension sobel edges in the ROI
    * Threshold sobel image
    * Find contours in the sobel image
    * Remove short contours (those shorter than minVerticalEdgeLength)
    * Calculate polygon approximations of contours to turn them into straight lines
* Find the rightmost frame edge candidate (that's to the left of the sprocket searchColumn)
* Measure the fixed frameWidth left to determine the left side of the frame
* Copy out portion of source image based on these coordinates


