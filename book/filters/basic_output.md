# Basic Output

Let's start with the absolute basics. Here's a sketch that loads an image file, passes it into OpenCV, and then displays the output. It's structured like most of our OpenCV sketches will be. We create an OpenCV object, pass it the image, and then use it to do filtering, and show the results. See the inline comments for line-by-line details.

<script src="https://gist.github.com/atduskgreg/5904383/b04418c77a5ba2a9a78b67bc22497e9c7c361b13.js"></script>

And here's the result from running it.

<a href="http://www.flickr.com/photos/unavoidablegrain/9185436191/" title="Screen Shot 2013-07-01 at 5.36.48 PM by atduskgreg, on Flickr"><img src="http://farm4.staticflickr.com/3820/9185436191_34d40de569.jpg" width="346" height="500" alt="Screen Shot 2013-07-01 at 5.36.48 PM"></a>

In order to display the results of our work with OpenCV, we call <code>opencv.getOutput()</code>. This function returns a <code>PImage</code> with the current state of the image we're processing with OpenCV. Processing's <code>image()</code> function can display this result just like any other <code>PImage</code>.

Take note: OpenCV for Processing automatically converted the image to grayscale. It does this by default because a lot of OpenCV operations only work with grayscale images.