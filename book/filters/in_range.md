# World of Filters

## In Range

<img src="http://gregborenstein.com/assets/opencv/in_range.gif" width="500px" />

OpenCV's <code>inRange()</code> function is very similar to [threshold()](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/threshold.md). It also takes a grayscale image and converts it into a "binary" image: one where every pixel is either all-white or all-black based on whether or not the pixel is within the given range of of values.

Where <code>threshold()</code> selects for pixels that are above a given value, <code>inRange()</code> lets you specify a maximum as well as a minimum value.

To see the difference, compare the same image filtered with <code>inRange(35, 50)</code> and with a simple <code>threshold(35)</code>:

<img src="http://gregborenstein.com/assets/opencv/in_range.gif" width="250px" /> <img src="http://gregborenstein.com/assets/opencv/threshold_35.gif" width="250px" />

Where <code>threshold(35)</code> catches the bright near-white of the wall as well as the light gray of my face, <code>inRange(35,50)</code>, leaves the wall as black, i.e. un-selected, along with the highlight on the upper-right side of my face.

### Use with Color Images and the Hue Channel

<img src="http://gregborenstein.com/assets/opencv/in_range_hue.gif" width="500px" />

Like most of the other OpenCV filter functions, <code>inRange()</code> can be used on any single-channel image, not just grayscale versions of color images. In particular, <code>inRange()</code> is especially useful when applied to the Hue channel. For more about this technique see [Color Tracking in HSV Color Space](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/tracking/hsv_color.md).

### Parameters 

<code>inRange(int min, int max)</code> takes two arguments: the first represents the lower bound of the range, the second represents the upper bound. It will result in a binary OpenCV output image with white where the pixels were in-range and black where they were out-of-range.

### Related Material

* [threshold()](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/threshold.md)
* [adaptiveThreshold()](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/adaptive_threshold.md)
* <code>useColor()</code> - sets the color mode. Options are <code>HSB</code> for Hue/Saturation/Brightness and <code>RGB</code> for Red/Green/Blue.
* [Color Tracking in HSV Color Space](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/tracking/hsv_color.md)