# World of Filters

## Dilate and Erode

<img src="http://gregborenstein.com/assets/opencv/dilate.gif" width="400px" /> <img src="http://gregborenstein.com/assets/opencv/erode.gif" width="400px" />

Dilation and erosion are both examples of "morphological" filters, functions that affect the shape of areas of pixels in the image. This can be a hard idea to get your head around on first exposure. How can an image filter change the shape of something in the image?

The key to understanding it is to keep in mind that these filters don't change the shape of the objects pictured in the image; they affect areas in the image where the pixels are similar. Each morphological filter changes the shape of these regions in different ways.

Dilation (shown above on the left) expands the white areas of the image. Examine the edge of the man's face and the stripes on his pajamas. When the filter is on, there's more white in the areas. The edge of his face spreads and smooths and the stripes on the pajamas get fat.

(_NOTE: All of these illustrations are applying erosion and dilation to an image that has already been thresholded both because this makes their effects more visible and because those filters are particularly useful in combination. You can run erosion and dilation on non-binary grayscale images and even on color images. See the [threshold page](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/threshold.md) for more on that filter._)

Erosion does the opposite. It contracts or thins these white areas. Compare the stripes in the image on the right to those on the left. When the erode filter is on, the stripes get thinner, more black is visible between them. And look at the man's left eye. The small spot of white visible within it disappears and the black shadow expands. 

Now, how is this useful? Dilation and erosion are frequently used together in order to close holes in an image. Take a look at this example of them both being applied to a scan in sequence:

<img src="http://gregborenstein.com/assets/opencv/dilate_erode.gif" width="400px" />

On first glance, this appears to have done a lot less than each filter in isolation. But look closely at those stripes on the pajamas. When the filters are applied, the black holes in them get filled up, like they did under dilate, but the stripes don't spread out. In other areas of the image, a bunch of small isolated bits of black and white disappeared. The image is less noisy and the large areas of black or white are smoother and more continuous.