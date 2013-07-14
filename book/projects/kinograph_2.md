# Test Case 1: Film Scanner Frame Extractor

## Part 2: Filtering the Image

### Why Filter?

Now that we know what parts of the image we'd like to work with, how do we go about detecting them?

In the end, what we're looking for is geometric data: we want the position, orientation, and scale of the film frame so we can extract it from the scan. This will take the form of angles, x-y coordinates, and scaling factors.

There are lots of techniques for extracting data like these from images -- both simple ones that we can implement ourselves (like checking the brightness of particular pixels) and more complex ones provided by OpenCV (eg. contour finding).

But before we're ready to use any of those, we need to prepare our image so that those techniques will actually provide us information about the parts of the image we're curious about. To do that, we'll apply a series of filters to our source image meant to bring out the frame separators, frame edges, and sprocket holes.

### Image Filters to Find Frame Features

OpenCV provides a large selection of image filtering functions. In this section, I'll introduce you to the ones that'll be most useful for working with the Kinograph scans. We won't be writing code quite yet -- I just want you to get a feel for each of these filtering functions, how they effect our scans, and how they might be useful.

These image filters are some of the most commonly used tools in the OpenCV toolbelt. The goal is for you to develop an intuition about when to reach for which tool. We'll be using [thresholding](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/threshold.md), [Sobel edge detection](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/edge_detection.md), [dilation and erosion](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/dilate_erode.md), [histogram equalization](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/equalize_histogram.md), and [region of interest](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/region_of_interest.md). If you haven't used these filters before, review those pages about them before proceeding. 