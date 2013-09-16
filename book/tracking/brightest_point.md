# Track All The Things

## Track the Brightest Point

_Probably the single simplest way to track an object with OpenCV is based on brightness. Brightness tracking is highly sensitive to lighting conditions and other changes in the scene, but it can work effectively in situations where you have a lot of control over the environment. In this section, we'll use OpenCV's <code>max()</code> function to track the brightest point in an image. We'll also see how a variation of brightness tracking, applied to the individual color channels of an image, can be used for a crude form of color tracking._

<iframe src="http://player.vimeo.com/video/69813654" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

### Video Summary

* Brightness tracking is one of the simplest ways to track an object.
* It's very fragile (affected by changing lighting conditions) so if you want to use it you'll need to control the environment
* By default, our OpenCV object works off of a grayscale version of the input image.
* Grayscale pixel values range from 0 (for black) to 255 (for white).
* The pixel with the maximum value in this image will be the brightest point. (See the note about Luma as a measure of brightness below.)
* If multiple pixels share the same maximum value (usually all white or all black if the image itself is all black), then the top-leftmost pixel will be selected.
* We can make this dynamic by processing each new frame of a Capture object.
* This technique works for any grayscale image.
* OpenCV gives us the red, blue, and green channels of our image as individual grayscale images.
* Finding the max of these individual channels will find the reddest, greenest, and bluest channel respectively.
* This form of color tracking is very crude because of the limitations of RGB color space
* See the Color Tracking in HSV Color Space for a more robust technique for tracking color.

#### Luma: A More Accurate Measure of Brightness

[Luma](http://en.wikipedia.org/wiki/Luma_%28video%29) is a representation of the brightness of a pixel that matches human perception more accurately than its gray value, which is a simple average of the reg, green, and blue components. Luma can be calculated as an unequal combination of the red, green and blue components of the pixel according to the following formula: 0.2126\*R + 0.7152\*G + 0.0722\*B. To use Luma for brightness tracking with our OpenCV image, you could iterate through the image and calculate the Luma value for each pixel, which would be slow. Or, you could use OpenCV's <code>[Imgproc.cvtColor()](http://docs.opencv.org/java/org/opencv/imgproc/Imgproc.html#cvtColor)</code> function in concert with <code>opencv.getBufferColor()</code> to convert the image to the [LAB color space](https://en.wikipedia.org/wiki/Lab_color_space), which includes Luma as one of its three channels.

This image demonstrates the comparison. The difference can be subtle. Click through to the larger size to make sure you see it. Look carefully at the right side of the image around the flashlight.

<a href="http://www.flickr.com/photos/unavoidablegrain/9228785034/" title="Gray vs Luma by atduskgreg, on Flickr"><img src="http://farm3.staticflickr.com/2829/9228785034_39c665d9e9.jpg" width="500" height="358" alt="Gray vs Luma"></a>

The code for this example (showing how to access the Luma channel) is here: [LumaVsGray.pde](https://github.com/atduskgreg/OpenCVPro/blob/library_rename/examples/LumaVsGray/LumaVsGray.pde).

In practice, the grayscale average of RGB is usually used due to its convenience.

### Quiz

Q: What qualities of our input image could cause problems with brightness tracking: A) The presence of many glowing objects. B) Moving shadows cast by passersby. C) The auto-exposure on our camera triggering. D) All of the above.

{% include "answer" with "D, all of the above." %}

Q: Which are easier to track with this version of color tracking: bright red or dark red objects?

{% include "answer" with "Light red. Dark red objects will converge with the shadows in the scene where R, G, and B components are all near 0." %}

Q: What are some techniques we could use to prevent the brightest point from jumping around so much when tracking an object with this method?

{% include "answer" with "1) Lerp the x- and y-components of the brightest point between sequential frames. 2) Blur the image before finding the max to smooth over small differences between values. 3) Filter out large jumps in the position of the point, as they're probably due to glitches rather than the continuous motion of the tracked object." %}

### Code

#### Important Functions

* <code>opencv.max()</code> - Find the brightest point in the current gray image.
* <code>opencv.setBufferGray()</code> - Set the current gray image to another channel.
* <code>opencv.getBufferG()</code> - Get the green channel of the current image. Useful for passing to <code>opencv.setBufferGray()</code>.

#### Browse the Code

1. capture image and load it into opencv
2. find and draw the max point
3. Switch to Capture instead of a still image
4. Use the green channel to track a green object

