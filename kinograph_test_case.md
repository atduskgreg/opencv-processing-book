## Getting Started with Computer Vision Test Case 1: Film Scanner Frame Extractor

### Kinograph: DIY Film Scanner
[Kinograph](http://mepler.com/Kinograph) is an open source DIY film scanner currently under development by Matt Epler, an archivist and hacker. Film scanners digitize analogue movies by photographing each frame of film one at a time. Existing models cost upwards of $100,000. Much of the cost arises from the need for precision hardware to place each frame of film in exactly the same location every time.

Using computer vision, we can reduce the need for this precision. Instead of having to get each film frame into exactly the same spot, we can write a program that finds each frame within an image and extracts it.

Kinograph's software uses exactly these techniques. The result is that Kinograph's hardware costs less than $1,000 and will be available to many more archivists enabling the preservation of many films that would otherwise be lost.

In this test case, we'll approach the problem of detecting and extracting frames from images of a film captured with Kinograph. We'll see how OpenCV's image filtering, edge detection, contour detection, and polygon approximation functions can be used to align and extract individual frames from the scanned film.

### The Problem: Rotation and Overscan

<a href="http://www.flickr.com/photos/unavoidablegrain/9142159361/" title="Kinograph source image by atduskgreg, on Flickr"><img src="http://farm3.staticflickr.com/2887/9142159361_78755f06e4.jpg" width="333" height="500" alt="Kinograph source image"></a>

Raw Kinograph scans (as seen above) present two main challenges for frame extraction: rotation and overscan.

As the film moves through the machine it does not always stay perfectly parallel to the camera that captures the scans. In order to correct this problem, we'll have to figure out the orientation of the frame of film within each scan.

Each Kinograph scan also captures more than just the current frame. As you can see in the image above, half of the previous and next frames are also visible. This excess area is called "overscan" in the digitization biz. It's necessary for other processes like stitching the audio track together, but it's exactly what we have to eliminate to produce a video file that looks like the original movie. In order to extract each frame, we'll have to find its borders within the larger scan.

### How to Think about the Problem

So, how can we go about detecting the rotation and frame boundary of each scanned frame? Let's look critically at our example scan above. What parts of this image might help us extract the information we need?

Well, first of all, we know that we'll be processing multiple frames with different content within each frame. This is a moving picture, after all. So, we need to look for parts of the image that will stay consistent even as the content of the frame changes.

Secondly, we need parts of the image that stick out sharply from their surroundings. Unlike the human vision system, computer vision techniques are highly sensitive to subtle variations in the image. Uneven exposure, image noise, subtle gradations of brightness -- they can all make image features that seem obvious to the eye dissolve into a mixed-up jumble of pixels.

And, finally, we need to pick parts of the image that will actually help us find the orientation and location of the image. That means straight lines and other geometric forms that correspond to the edges of the frame and the direction of the strip of film within the scan.

#### Quiz

Click on two parts of the image that seem promising for detecting the orientation and location of the frame. Remember, you're looking for parts of the image that are:

* Consistent even as the content of the frame changes
* Stark enough to be resistant to variations in image quality
* Useful in detecting the orientation and location of the film frame.

_ANSWER: frame separators, sprocket holes, frame edges_

#### Answer

The three parts of the image that best fit our criteria are:

* The horizontal frame separators
* The frame's vertical edges
* The sprocket holes

_CLOSE-UP IMAGE OF FRAME SEPARATOR_

As big black horizontal bars, the frame separators are maybe the starkest portion of the image. Their edges make-up straight horizontal lines, so finding them would tell us the orientation of the frame with the scan. And they border the frame itself on top and bottom, giving of half of what we need to find the frame's location. However, the frame separators have a downside too: what happens when the frame goes completely black? Fade outs, credit sequences, and title cards are all common situations in which black areas of the frame would bleed into the frame borders, screwing up our detection.

_CLOSE-UP IMAGE OF FRAME EDGE_

The frame's vertical edges aren't as stark as the separators, but they do contrast nicely with the neighboring translucent area of the film. As straight lines, they also provide solid information about the orientation of the scan. And, as edges of the frame, they give us its left and right bounds. In fact, in combination with the vertical information from the frame separators, we now know enough to find the complete frame position.

_CLOSE-UP IMAGE OF SPROCKET HOLE_

The last part of the image that seems promising is the sprocket holes. They are geometric in shape and certain of them correspond to the top and bottom of the frame. Compared to the frame separators and edges, they're much lower contrast. On the other hand, they're located on a part of the film that won't be affected by changes in the frame. Also, the sprocket holes were designed specifically to  register each frame in the projector so we can rely on them being positioned correctly. One major downside of the sprocket holes is that there are more of them than we need. In order to use them, we'd need a way to distinguish the holes at the top and bottom of the frame from all the others that appear in each scan.

### Filtering the Image


image processing to bring out and analyze features
multiple different approaches

* Find vertical lines in the image to calculate rotation
* Find the top and bottom of the film frames
* Find the left and right edges of the frame

* histogram equalization
* Thresholding
* region of interest
* edge detection
* dilation and erosion
* contour detection
* contour processing (polygon approximation)



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


