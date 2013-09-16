# Track All the Things

## Color Tracking in HSV Color Space

_One of the simplest ways to track an object with OpenCV is based on its color. However, the color space we use to represent the colors in an image can have a big effect on how easy it is to implement color tracking. In this section, we'll prepare an image for color tracking by converting it to HSV color space and filtering it based on a range of Hues. After filtering, we'll be able to easily track our object's position by finding contours._

<iframe src="http://player.vimeo.com/video/69767694" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

### Video Summary

* Color tracking is useful when you can control the color of the tracked-object or it already sticks out from the background.
* A "color space" describes how we represent a single color as a mix of different elements.
* The most common color space is RGB.
* RGB is the default color space in Processing.
* RGB is flawed for color tracking because changes in color that look small to the eye effect all three channels significantly.
* HSV is a more useful color space for tracking.
* HSV stands for Hue, Saturation, and Value.
* Hue is color. Saturation is intensity. Value is brightness.
* For color tracking we can just use the Hue channel.
* A Histogram is a graph that shows frequency of each color in an image.
* OpenCV provides that lets us filter an image based on a range of values.
* Filtering a colorful image by a range of hues reveals which hue corresponds to which color.
* Hue 0 is red and then it ranges up through orange, yellow, green, white (around 90), and up to blue.
* In OpenCV, hue ranges from 0-180.
* To track an object in live video we apply a range filter to the hue, selecting the color range of our object.
* Then we find contours in that filtered image.
* The contour with the largest area will be the object we want to track
* We can draw the bounding box of that contour.
* The center of the contour's bounding box will be the object's location.

### Quiz

Q: What is the default color space in Processing?
{% include "answer" with "RGB" %}

Q: Are there colors that can be represented in HSV color space that are impossible to represent in RGB color space?
{% include "answer" with "No" %}

Q: Using OpenCV's scale, what color is represented by the following HSV values: 215, 50, 30?
{% include "answer" with "None. Hue ranges from 0-180." %}

### Code

The code sample below will walk you step-by-step through implementing Hue-based color tracking.

#### Important Functions

* <code>opencv.useColor()</code> - Tell OpenCV which color space to use.
* <code>opencv.getBufferH()</code> - Access the Hue channel of the image.
* <code>opencv.setBufferGray()</code> - Set the gray channel of the image to the values of another channel.
* <code>opencv.inRange()</code> - Filter the image based on a range of values.
* <code>opencv.findContours()</code> - Find contours in the current image.
* <code>contour.getBoundingBox()</code> - Get the rectangular bounding box around a particular contour.

#### Browse the Code

<script src="https://gist.github.com/atduskgreg/5937005.js"></script>

