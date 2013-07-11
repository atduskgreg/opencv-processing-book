# Test Case 1: Film Scanner Frame Extractor

## Part 3: Applying Filters

We've been talking for awhile here without looking at any code. In this section, we're going to remedy that. We'll look at the basics of using OpenCV in Processing. We'll see how to load up an image, apply filters to it, and see the output.

Once you've got those basics down, we'll take another look at the filters introduced in the last section. This time, I'll show you the parameters for each one and explain what they do.

While you're reading keep this question in mind: how could use these filters (alone or in combination) to accentuate the frame borders, sprocket holes, and frame edges in our scan? There'll be a quiz at the end that asks you to do exactly that.

### Getting the Output from OpenCV

Let's start with the absolute basics. Here's a sketch that loads an image file, passes it into OpenCV, and then displays the output. It's structured like most of our OpenCV sketches will be. We create an OpenCV object, pass it the image, and then use it to do filtering, and show the results. See the inline comments for line-by-line details.

<script src="https://gist.github.com/atduskgreg/5904383/b04418c77a5ba2a9a78b67bc22497e9c7c361b13.js"></script>

And here's the result from running it.

<a href="http://www.flickr.com/photos/unavoidablegrain/9185436191/" title="Screen Shot 2013-07-01 at 5.36.48 PM by atduskgreg, on Flickr"><img src="http://farm4.staticflickr.com/3820/9185436191_34d40de569.jpg" width="346" height="500" alt="Screen Shot 2013-07-01 at 5.36.48 PM"></a>

In order to display the results of our work with OpenCV, we call <code>opencv.getOutput()</code>. This function returns a <code>PImage</code> with the current state of the image we're processing with OpenCV. Processing's <code>image()</code> function can display this result just like any other <code>PImage</code>.

Take note: OpenCVPro automatically converted the image to grayscale. It does this by default because a lot of OpenCV operations only work with grayscale images.

#### Applying a Filter

Now, let's apply a filter. We'll start with thresholding. After we've initialized our OpenCV object with the image, we call the threshold function:

<script src="https://gist.github.com/atduskgreg/5904383.js"></script>

After we've called <code>opencv.threshold()</code>, the results are stored in our OpenCV object's output. When we call <code>opencv.getOutput()</code>, the returned <code>PImage</code> contains the thresholded image.

We could apply any of the other filters just as easily. Try it yourself. Replace that line we just added with your own. Try each of the filters we introduced in the last section to see their effects. 

### Parameters

Each of these filter functions takes different arguments. These arguments set the parameters of the filter. They determine how much to apply it, where, in what direction, or any other relevant details for the particular filter. Let's look at the parameters for each of the filters we'll be using in Kinograph.

#### threshold(grayLevel)

The <code>threshold()</code> function takes a single argument: an integer value from 0-255:

    opencv.threshold(50);

This value represents a value of gray (0 being black and 255 white). After <code>threshold()</code> is applied, pixels below this value will be black and those above it will be white.

#### findSobelEdges(horizontalGradient, verticalGradient)

The parameters for <code>findSobelEdges()</code> can be a little bit counterintuitive. 

The Sobel edge-detection algorithm works by amplifying changes in the values of neighboring pixels. It can look at horizontal neighbors, vertical neighbors, or both. Counterintuitively, looking for changes between horizontal neighbors ends up detecting vertical edges and vice versa. (Imagine an image with a strong vertical edge in it. The pixels that make up that edge differ strongly not from the ones immediately above and below them (their vertical neighbors) but from those to their left and right (their horizontal neighbors).)

The <code>findSobelEdges()</code> function takes two arguments, each an integer in the range 0-2. The first argument tells the Sobel algorithm how many horizontal neighbors to look at and the second how many vertical neighbors. The fewer neighbors you look at, the thicker and more intense the edges will be.

<a href="http://www.flickr.com/photos/unavoidablegrain/9191016933/" title="sobel edge direction comparison by atduskgreg, on Flickr"><img src="http://farm8.staticflickr.com/7436/9191016933_abaf2cc508.jpg" width="346" height="500" alt="sobel edge direction comparison"></a>

So, putting this into action, we can find horizontal edges like this:

    opencv.findSobelEdges(0,1);

vertical edges:

    opencv.findSobelEdges(1,0);

thinner vertical edges:

    opencv.findSobelEdges(2,0);

and edges in both directions equally:

    opencv.findSobelEdges(1,1);

#### setROI(x, y, width, height)

A Region of Interest is a rectangular area of the image we select to exclusively receive OpenCV operations. Hence, the arguments to <code>setROI()</code> mirror those to <code>rect()</code>, the Processing function for drawing rectangles: x, y, width, height.

    opencv.setROI(400,250,150,150);
    opencv.threshold(50);

_Note: there's also a corresponding <code>opencv.releaseROI()</code> function that ends the use of the Region of Interest. After calling it, further OpenCV functions will affect the entire image._

#### No parameters: dilation(), erosion(), and equalizeHistogram()

The remaining filter functions we'll be using, <code>dilation()</code>, <code>erosion()</code>, and <code>equalizeHistgoram()</code>, take no parameters at all. They just do what they do. 

### Quiz: Filter for Frame Features

As we saw in the last section, the purpose of all of these filters is to bring out the parts of an image from which we can derive useful data. In the case of Kinograph, those parts are sprocket holes, the frame borders, and the frame edges.

In this quiz, your job is to apply what you just learned about these filter functions and their parameters to a Kinograph scan. You can use them individually or in combination. After you've applied your filters, we'll evaluate the results to see how much you've revealed each image feature. Keep trying until you get all three (either with a single combination of filters or in multiple tries).

_Interactive THINGY!_