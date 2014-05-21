# Filters: Histogram Equalization

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