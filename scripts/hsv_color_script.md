### Color Tracking with HSV Video Script

[Complete tracking dot video]
* Goal: Track objects based on their color
* Useful whenever you can control the color of the object you want to track or it already sticks out from the background on its own

* What you're seeing here is the final result: a dot that tracks our orange bottle as I move it around the screen.

* Our approach will be based on using an alternative color space called 'HSV' for Hue, Saturation, Value.

[Graph of RGB color space]
* What's a 'color space'?
* A color space describes how we represent a single color as a mix of different elements
* The Most common one is RGB: each color as a mix of red, green, and blue
* This is the one you're used to using with the Processing color() function.
* Each of the arguments represents one axis of the RGB color space and the combination of them produces the final color

[image color picker]
* The problem with using RGB color space for color tracking is that even small changes in perceived color will affect all three axes of the color space.
* See how much the red, green, and blue levels of each pixel varies, even amongst the pixels on the orange juice bottle?
* We'd have to do some sophisticated processing on these numbers to distinguish the orange bottle from the rest of the image.

[HSV color space picture]
* Luckily there are other color spaces.

* HSV color space, for example, represents the Hue (or color) with just one axis.
* The other two axes represent Saturation (or intensity) and Value (or brightness)

* When we explore the HSV levels of our orange bottle, we can see that the Hue stays basically the same, while the Saturation and Value change where the bottle is darker or lighter.

* Working in HSV color space means that we only have to process the Hue channel to track objects by their color, making our programming job much easier and our results much more reliable.

* Now how can we apply this with OpenCV?
* Here's Processing sketch showing a picture of some colorful balls
* On the left here, we've got a graph showing us which Hues show up most in the image.
* This sketch is using OpenCV to filter the image based on the range of Hues we select
* You can see the output of that selection on the right here
* The white is what's within the selected range, the black is everything else.
* Now look at our hue histogram. It's mostly flat at 0, but there are a few spikes
* The biggest spike here, around 90, represents white.
* Selecting it filters out the balls altogether.
* All the way on the left here, near hue 0, is blue.
* And, as we move to the right we pass through green to yellow, through white to orange and red.
* The values top off at 180.
* Unlike RGB which go to 255, OpenCV represents hue in a range from 0 to 180.

* Let's use this to track a colored object in video!

* Once we've figured out the range that contains the color we want to track, we can use it to filter each frame of our video.
* In this case the hue of my orange juice bottle ranged between 20 and 35.
* The image in the bottom right shows the video's Hue channel filtered by that range. The orange bottle jumps right out from the background.

* After filtering the hue channel for our selected range, we can look for contours in the resulting image.
* The center of the biggest contour will be the position of the object we want to track.

* Here's the bounding box around the largest contour we found in that filtered image.

* And here's the center of that bounding box displayed on top of our input video.

* Boom. A dot that tracks my orange juice bottle.
