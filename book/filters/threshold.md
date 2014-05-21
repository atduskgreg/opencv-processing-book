# Filters: Threshold

<img src="http://gregborenstein.com/assets/opencv/threshold.gif" width="400px" />

Thresholding is maybe the single most common image filter used with OpenCV. It takes a grayscale image and converts it into a "binary" image: one where every pixel is either all-white or all-black based on whether it's lighter or darker than the given threshold.

Many super-useful OpenCV functions require a binary image, like [contour finding](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/tracking/contours_and_lines.md).

In the animated GIF above, we're applying a threshold at 50 to a scanned frame of film from [the Kinograph project](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/projects/kinograph_1.md). When we threshold our scan, the subtle grays that make up the area with the sprocket holes on the right of the frame disappear completely into white. And the black bars of the frame separators become even more prominent.

Thresholding is not limited to grayscale images. You can apply it to color images and individual color channels as well (see the code samples below).

## Related Functions

* [adaptiveThreshold()](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/adaptive_threshold.md)
* [inRange()](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/in_range.md)

## Parameters

The <code>threshold()</code> function takes a single argument: an integer value from 0-255:

    opencv.threshold(50);

This value represents a value of gray (0 being black and 255 white). After <code>threshold()</code> is applied, pixels below this value will be black and those above it will be white.

## Code
