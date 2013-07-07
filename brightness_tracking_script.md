### Video Script

[brightness tracking video]

* In this video, we're going to track the brightest object in an image.
* Brightness tracking is one of the simplest forms of object tracking.
* It's also very fragile. Changes in lighting conditions or  the presence of other bright objects can totally wreck its effectiveness.
* But in a controlled environment, where you can attach a light to the object you want to track (or where that object glows already) it can work quite well.

[still image: color]

* We'll start by looking at a single still frame.

[still image: gray]

* By default, OpenCV for Processing applies all image processing operations to the grayscale version of the input image.
* A lot of computer vision techniques only work on single channel images, and the one we'll be using to find the brightest pixel is no exception.

* The pixels in a grayscale image range from 0 to 255 in value, with 0 being black and 255 being white.

[still image: max()]

* OpenCV provides a function called max which finds the pixel with the highest value along this spectrum.
* When we're looking at the grayscale image, that'll be the brightest pixel.
* If there are multiple pixels in the image that share the maximum value, we'll find the top-leftmost one.

[brightness tracking video]

* When we apply this to every frame from a live camera, we get interactive tracking of the brightest object.
* Notice how when I remove the flashlight, this technique still finds a point to track. There's always a brightest pixel in any image.

[green guy in color]

* We can use a variation of this technique for a crude form of color tracking.
* For example, under good lighting and background conditions, we can track this neon green 3D print of my head.
* Notice that I've changed into a white t-shirt, improved the lighting, and cleaned up a little bit behind me to create the clean background necessary to make this work.

[R, G, and B channels split out]

* This max() pixel technique we've been using works on any grayscale image
* In addition to a gray image representing brightness, OpenCV will also give us the red, green, and blue channels of our input image.
* Each one of these is represented by their own grayscale image that I'm tinting their respective color here.
* Look at how bright the 3D print is in the green channel. It's actually brighter than my white t-shirt.

[green-tracking video]

* If we load the green channel from each frame of video into opencv, then that same max function will find the greenest point in our image.
* As long as this neon green 3D print is present, that point will track it.
* If we had objects of equally strong red and blue color we could track them as well independently.
* When it comes to real applications, this is a very crude tracking methods because of the limitations of RGB color space.
* See the Color Tracking in HSV Color Space example for a more robust technique for tracking color.