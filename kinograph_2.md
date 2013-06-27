# Test Case 1: Film Scanner Frame Extractor

## Part 2: Understanding the Problem

### Filtering the Image

Now that we know what parts of the image we'd like to work with, how do we go about detecting them?

image processing to bring out and analyze features
multiple different approaches

* Thresholding

<img src="http://gregborenstein.com/assets/opencv/threshold.gif" width="400px" />

* edge detection

<img src="http://gregborenstein.com/assets/opencv/find_sobel_edges_horizontal.gif" width="400px" /> <img src="http://gregborenstein.com/assets/opencv/find_sobel_edges_vertical.gif" width="400px" />

* dilation and erosion

<img src="http://gregborenstein.com/assets/opencv/dilate.gif" width="400px" /> <img src="http://gregborenstein.com/assets/opencv/erode.gif" width="400px" />

<img src="http://gregborenstein.com/assets/opencv/dilate_erode.gif" width="400px" />

* histogram equalization

<img src="http://gregborenstein.com/assets/opencv/equalize_histogram.gif" width="400px" />


* region of interest

<img src="http://gregborenstein.com/assets/opencv/region_of_interest.gif" width="400px" />


* contour finding
* contour processing (polygon approximation, angle math, etc)