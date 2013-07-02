# Test Case 1: Film Scanner Frame Extractor

## Part 3: Applying Filters

We've been talking for awhile here without looking at any code. In this section, we're going to remedy that. We'll look at the basics of using OpenCV in Processing. We'll see how to load up an image, apply filters to it, and see the output.

Once you've got those basics down, we'll take another look at the filters introduced in the last section. This time, I'll show you the parameters for each one and explain what they do.

While you're reading keep this question in mind: how could use these filters (alone or in combination) to accentuate the frame borders, sprocket holes, and frame edges in our scan? There'll be a quiz at the end that asks you to do exactly that.

### Getting the Output from OpenCV



<script src="https://gist.github.com/atduskgreg/5904383.js"></script>

* automatically turns the image gray b/c most opencv operations assume a gray image

### Parameters

* threshold
* sobel
* region of interest
* no parameters: dilation and erosion, equalizeHistogram
