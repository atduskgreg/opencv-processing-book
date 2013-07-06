# Track All The Things

## Track the Brightest Point

_Probably the single simplest way to track an object with OpenCV is based on brightness. Brightness tracking is highly sensitive to lighting conditions and other changes in the scene, but it can work effectively in situations where you have a lot of control over the environment. In this section, we'll use OpenCV's <code>max()</code> function to track the brightest point in an image. We'll also see how a variation of brightness tracking, applied to the individual color channels of an image, can be used for a crude form of color tracking._

### Video Summary

* Brightness tracking is one of the simplest ways to track an object.
* It's very fragile (affected by changing lighting conditions) so if you want to use it you'll need to control the environment
* By default, our OpenCV objects works off of a grayscale version of the input image.
* The max value in this image will be the brightest point.
* We can make this dynamic by processing each new frame of a Capture object.
* This works for any grayscale image.
* OpenCV gives us the red, blue, and green channels of our image as individual grayscale images.
* Finding the max of these will find the "reddest" point, etc.
* This is very crude because of the limitations of RGB color space
* See the Color Tracking in HSV Color Space for a more robust technique for tracking color. Protip/challenge: you could also used the HSV/inRange technique described on that page for brightness tracking. Can you figure out how to do it?

### Quiz

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

