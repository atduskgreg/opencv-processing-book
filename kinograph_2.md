# Test Case 1: Film Scanner Frame Extractor

## Part 2: Filtering the Image

### Why Filter

Now that we know what parts of the image we'd like to work with, how do we go about detecting them?

In the end, what we're looking for is geometric data: we want the position, orientation, and scale of the film frame so we can extract it from the scan. This will take the form of angles, x-y coordinates, and scaling factors.

There are lots of techniques for extracting data like these from images -- both simple ones that we can implement ourselves (like checking the brightness of particular pixels) and more complex ones provided by OpenCV (eg. contour finding).

But before we're ready to use any of those, we need to prepare our image so that those techniques will actually provide us information about the parts of the image we're curious about. To do that, we'll apply a series of filters to our source image meant to bring out the frame separators, frame edges, and sprocket holes.

### Image Filtering with OpenCV

OpenCV provides a large selection of image filtering functions. In this section, I'll introduce you to the ones that'll be most useful for working with the Kinograph scans. We won't be writing code quite yet -- I just want you to get a feel for each of these filtering functions, how they effect our scans, and how they might be useful.

These image filters are some of the most commonly used tools in the OpenCV toolbelt. The goal is for you to develop an intuition about when to reach for which tool.

#### Thresholding

<img src="http://gregborenstein.com/assets/opencv/threshold.gif" width="400px" />

Thresholding is maybe the single most common image filter used with OpenCV. It takes a grayscale image and converts it into a "binary" image: one where every pixel is either all-white or all-black based on whether it's lighter or darker than the given threshold.

Many super-useful OpenCV functions require a binary image, like contour finding.

As you can see in the animated GIF above, when we threshold our scan at 50, the subtle grays that make up the area with the sprocket holes on the right of the frame disappear completely into white. And the black bars of the frame separators become even more prominent.

#### Sobel Edge Detection

<img src="http://gregborenstein.com/assets/opencv/find_sobel_edges_horizontal.gif" width="400px" /> <img src="http://gregborenstein.com/assets/opencv/find_sobel_edges_vertical.gif" width="400px" />

OpenCV includes a number of filters meant to reveal the edges of objects including the Canny filter, the Scharr filter, and the Sobel filter. In our case, the edges we really want to see are all vertical and horizontal: the sides of the film frame and the sprocket holes. Both Scharr and Sobel filters offer directional options; you can ask them specifically to find vertical or horizontal edges.

In the animations above you can see the Sobel edge filter applied to our scan. On the left it's used in horizontal mode and on the right in vertial mode. Notice the differences between the two modes, how each one affects the sides of the film frame and sprocket holes, the vertical stripes in the actor's shirt, and the lines in the soundtrack on the left of the frame.

The horizontal mode will come in handy for finding the sprocket holes, the vertical mode for finding the orientation and the left and right edge of the frame.

### Dilation and Erosion

<img src="http://gregborenstein.com/assets/opencv/dilate.gif" width="400px" /> <img src="http://gregborenstein.com/assets/opencv/erode.gif" width="400px" />

Dilation and erosion are both examples of "morphological" filters, functions that affect the shape of areas of pixels in the image. This can be a hard idea to get your head around on first exposure. How can an image filter change the shape of something in the image?

The key to understanding it is to keep in mind that these filters don't change the shape of the objects pictured in the image; they affect areas in the image where the pixels are similar. Each morphological filter changes the shape of these regions in different ways.

Dilation (shown above on the left) expands the white areas of the image. Examine the edge of the man's face and the stripes on his pajamas. When the filter is on, there's more white in the areas. The edge of his face spreads and smooths and the stripes on the pajamas get fat.

(_NOTE: All of these illustrations are applying erosion and dilation to an image that has already been thresholded both because this makes their effects more visible and because those filters are particularly useful in combination. You can run erosion and dilation on non-binary grayscale images and even on color images._)

Erosion does the opposite. It contracts or thins these white areas. Compare the stripes in the image on the right to those on the left. When the erode filter is on, the stripes get thinner, more black is visible between them. And look at the man's left eye. The small spot of white visible within it disappears and the black shadow expands. 

Now, how is this useful? Dilation and erosion are frequently used together in order to close holes in an image. Take a look at this example of them both being applied to a scan in sequence:

<img src="http://gregborenstein.com/assets/opencv/dilate_erode.gif" width="400px" />

On first glance, this appears to have done a lot less than each filter in isolation. But look closely at those stripes on the pajamas. When the filters are applied, the black holes in them get filled up, like they did under dilate, but the stripes don't spread out. In other areas of the image, a bunch of small isolated bits of black and white disappeared. The image is less noisy and the large areas of black or white are smoother and more continuous.

#### Histogram Equalization

You've probably seen histograms used to represent information about images in photo editing applications like Photoshop. Histograms show the amount of pixels at each different level of brightness in a complete image or in a particular color channel.

The following illustration shows four histograms for a picture of me: one for brightness (shown in gray) and one each for the red, green, and blue channels.

<a href="http://www.flickr.com/photos/unavoidablegrain/9174190443/" title="gray, red, green, blue histograms by atduskgreg, on Flickr"><img src="http://farm8.staticflickr.com/7287/9174190443_224a740ce8.jpg" width="500" height="355" alt="gray, red, green, blue histograms"></a>

Taller regions of the histogram mean that there are more pixels in the image at that level of brightness. Looking at the histograms for this image we can see that it is pretty dark; there are no lines on the rightmost side of any of the histograms where the brightest pixels are represented. You can also see that the red histogram is taller than the green and blue ones. This reflects how much of the image is taken up with my pink-ish face and the red and purple hues of the print on the wall behind me.

Manipulating this distribution of pixels is a powerful way to change to brightness and contrast of an image. Specifically, OpenCV provides us with a function to "equalize" the histogram. Equalizing a histogram takes its values and spreads them out over the full possible range. Here's the result when we run it on our scanned film frame:

<img src="http://gregborenstein.com/assets/opencv/equalize_histogram.gif" width="400px" />

Kind of disappointing, huh? The image is certainly brighter. And, if we look closely, we can see that certain areas have significantly more detail visible (especially the lower partial frame).

However, if we look at the actual histogram for this image, we can see the effect of equalizing it:

<img src="http://gregborenstein.com/assets/opencv/equalized_histograph.gif" width="600px" />

The values of the graph are shifted significantly towards the right, or brighter, side. The equalization had relatively little visible effect because this image was pretty evenly exposed to begin with. Between the dark black of the frame separators, the bright white of the sprocket holes, and the smooth grays of the frame itself, the original scan covered the full range of the histogram.

Let's look at what histogram equalization does to that badly underexposed image of me from before.

<img src="http://gregborenstein.com/assets/opencv/greg_histograph.gif" width="600px" />

Now, here you can see real results. The image is much brighter and much higher contrast. If we select the right input, histogram equalization can make things much more visible, especially in woefully under or overexposed images.

#### Region of Interest

<img src="http://gregborenstein.com/assets/opencv/region_of_interest.gif" width="400px" />

When filtering images, sometimes we don't want to apply our filters to the entire image. Sometimes we'd rather select a particular area of the image just filter it. Maybe we only care about a feature if it appears in a particular spot. Or maybe we're running filtering operations that will have different results depending on their input (like we just saw above with histogram equalization).

OpenCV lets us select a Region of Interest (ROI) in order to do just that. After we set our ROI, subsequent filters will only apply to that area. In the GIF above you can see our threshold filter applied just to the area around the actors face.

#### Region of Interest + Histogram Equalization

<img src="http://gregborenstein.com/assets/opencv/roi_histogram.gif" width="400px" />

As we saw, the effects of histogram equalization depend on the range of grays in the image being processed. Our original frame scans have a wide range of gray values and therefore the filter had little effect. But, if we select the right Region of Interest, histogram equalization can really help us bring out the sprocket holes.

In the GIF above, I've selected a small square on the right as an ROI. This area captures the edge of the frame and one of the sprocket holes. Unlike our earlier attempt on the whole image, running histogram equalization on just this area has a dramatic effect. It significantly darkens the edges of the sprocket hole making it much easier to detect.

Using an ROI like this, makes our image filters work a little bit more like our eyes, which are constantly refocusing and re-adjusting to different objects and light conditions in front of us.