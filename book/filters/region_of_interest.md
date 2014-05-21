# Filters: Region of Interest

<img src="http://gregborenstein.com/assets/opencv/region_of_interest.gif" width="400px" />

When filtering images, sometimes we don't want to apply our filters to the entire image. Sometimes we'd rather select a particular area of the image just filter it. Maybe we only care about a feature if it appears in a particular spot. Or maybe we're running filtering operations that will have different results depending on their input (like we just saw above with histogram equalization).

OpenCV lets us select a Region of Interest (ROI) in order to do just that. After we set our ROI, subsequent filters will only apply to that area. In the GIF above you can see our threshold filter applied just to the area around the actors face.

## Combined with Histogram Equalization

<img src="http://gregborenstein.com/assets/opencv/roi_histogram.gif" width="400px" />

As we saw, the effects of histogram equalization depend on the range of grays in the image being processed. Our original frame scans have a wide range of gray values and therefore the filter had little effect. But, if we select the right Region of Interest, histogram equalization can really help us bring out the sprocket holes.

In the GIF above, I've selected a small square on the right as an ROI. This area captures the edge of the frame and one of the sprocket holes. Unlike our earlier attempt on the whole image, running histogram equalization on just this area has a dramatic effect. It significantly darkens the edges of the sprocket hole making it much easier to detect.

Using an ROI like this, makes our image filters work a little bit more like our eyes, which are constantly refocusing and re-adjusting to different objects and light conditions in front of us.

## Parameters

A Region of Interest is a rectangular area of the image we select to exclusively receive OpenCV operations. Hence, the arguments to <code>setROI()</code> mirror those to <code>rect()</code>, the Processing function for drawing rectangles: x, y, width, height.

    opencv.setROI(400,250,150,150);
    opencv.threshold(50);

_Note: there's also a corresponding <code>opencv.releaseROI()</code> function that ends the use of the Region of Interest. After calling it, further OpenCV functions will affect the entire image._