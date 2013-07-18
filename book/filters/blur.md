# World of Filters

## Blur

<img src="http://gregborenstein.com/assets/opencv/blur_gray.gif" width="500px" />

Blurring is a surprisingly useful operation in computer vision. It might seem like blurring an image would obscure exactly the information that you're seeking to extract. To the contrary, blurring is similar to taking an average: it combines the value of each pixel with its neighbors. This is really useful for eliminating small variations or noise that might hurt the results of other operations like edge detection, contour finding, etc.

### Blur Strength and Direction - Convolutions and Kernels

OpenCV's <code>blur()</code> function uses a type of blur known as a "box blur". In order to understand its effects -- and the various options available when applying a blur -- you'll need to know a little bit about how OpenCV applies blurs and other image filters.

OpenCV blurs an image by applying what's called [a Kernel](http://en.wikipedia.org/wiki/Kernel_(image_processing)). A Kernel tells you how to change the value of any given pixel by combining it with different amounts of the neighboring pixels. The kernel is applied to every pixel in the image one-by-one to produce the final image (this operation known as a [convolution](http://en.wikipedia.org/wiki/Convolution)).

Kernels are frequently represented with diagrams like this:

<a href="http://www.flickr.com/photos/unavoidablegrain/9311189796/" title="no_blur_kernel by atduskgreg, on Flickr"><img src="http://farm8.staticflickr.com/7410/9311189796_af6a4234ff.jpg" width="250" height="250" alt="no_blur_kernel"></a>

The middle box represents the current pixel. The values in each box indicate what portion of each pixel should be used to produce the output. The case shown here is the most boring possible kernel. It uses all of the current pixel and none of the neighbors. Applying this kernel would leave the image unchanged.

Here's the most basic kernel for applying a box blur:

<a href="http://www.flickr.com/photos/unavoidablegrain/9308406751/" title="box_blur_1 by atduskgreg, on Flickr"><img src="http://farm8.staticflickr.com/7360/9308406751_743f0403e8.jpg" width="250" height="250" alt="box_blur_1"></a>

This kernel makes the pixel into an average of itself and each of the eight neighboring pixels. In other words, each of the nine pixels in the kernel contribute 1/9th of the final value.

We describe this as a kernel size of one since it includes one pixel in each direction away from the current pixel. If we wanted to blur the image more, we could expand the size of our kernel, adding in more adjacent pixels.

Here's a kernel for a 2-pixel box blur:

<a href="http://www.flickr.com/photos/unavoidablegrain/9311189812/" title="box_blur_2 by atduskgreg, on Flickr"><img src="http://farm6.staticflickr.com/5328/9311189812_5453efcec8.jpg" width="250" height="250" alt="box_blur_2"></a>

Expanding to a 2-pixel radius results in a kernel that covers 25 pixels. Hence, each pixel contributes 1/25th of our final value.

The GIF at the top of this page showed a blur with a 10-pixel kernel. Here's what a blur with a 50-pixel radius kernel looks like: 

<img src="http://gregborenstein.com/assets/opencv/blur_more.gif" width="500px" />

In addition to kernels that mix all the pixels equally, we can use other kernels that have different effects. For example, we could construct a kernel that only mixed-in the pixels on the same row as the current pixel like so:

<a href="http://www.flickr.com/photos/unavoidablegrain/9311189846/" title="horizontal_blur by atduskgreg, on Flickr"><img src="http://farm3.staticflickr.com/2830/9311189846_8a36612889.jpg" width="250" height="250" alt="horizontal_blur"></a>

The result would be a horizontal blur like this:

<img src="http://gregborenstein.com/assets/opencv/blur_horizontal.gif" width="500px" />

And likewise, we could do the same thing in the vertical direction with this kernel:

<a href="http://www.flickr.com/photos/unavoidablegrain/9308406767/" title="vertical_blur by atduskgreg, on Flickr"><img src="http://farm6.staticflickr.com/5533/9308406767_1eb8f3c1a0.jpg" width="250" height="250" alt="vertical_blur"></a>

producing something like this:

<img src="http://gregborenstein.com/assets/opencv/blur_vertical.gif" width="500px" />

### Color Images

It's also worth noting that, unlike some other filters, <code>blur()</code> can be applied to color images:

<img src="http://gregborenstein.com/assets/opencv/blur_color.gif" width="500px" />

### Parameters

OpenCV for Processing's <code>blur()</code> function has two different forms. Passing a single argument applies a simple box blur to the image with a kernel size determined by the argument you pass in.
 
    opencv.blur(10);

To blur an image vertically or horizontally, you need to create a non-square kernel. The second form of <code>blur()</code> takes two arguments: one for the size of the kernel in the x- and y-dimensions.

    opencv.blur(5, 1);

would apply a horizontal blur with the kernel we showed above: five pixels wide, all on the same row.

    opencv.blur(1,5);

would apply a vertical blur: one pixel wide and five tall, just like we saw in the vertical kernel.

Neither argument to this function can be zero, or an error will be raised. How can you construct a kernel that takes up zero rows or zero columns?

### Related Functions

* [dilate()](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/dilate_erode.md)
* [erode()](https://github.com/atduskgreg/opencv-processing-book/blob/master/book/filters/dilate_erode.md)
