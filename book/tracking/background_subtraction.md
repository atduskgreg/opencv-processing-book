# Tracking: Background Subtraction

_When processing video, we frequently want to separate people and objects that move (the foreground) from the fixed environment (the background). Separating foreground from  background is an important technique that enables many applications such as motion detection and object and person tracking. Here we learn how background subtraction can separate the foreground from the background in a way that is robust to changes in light and shifts in long-still objects._

## Video Script

[demo of final version?]
* Separating an image into foreground and background components 

[diff video]

* A naive way to 

## Video Summary

* It's hard to figure out which part of the image is the background
* Naive version: save the background and then do a diff with each frame. 
* Need a clean background frame for reference. What happens if objects are permanently removed or shifted? What about as the light changes?
* More sophisticated models of the background: adapt as the background changes.
* We'll use a background subtraction technique built-in to OpenCV that does just that.
* The original paper: [An Improved Adaptive Background Mixture Model for Real- time Tracking with Shadow Detection](http://www.ee.surrey.ac.uk/CVSSP/Publications/papers/KaewTraKulPong-AVBS01.pdf).
* Lessen the effect of small repetitive motions like moving trees and bushes.
* Adaptive Gaussian Mixture Model - explain each pixel in the scene as the sum of a series of colors that fall off in a Gaussian distribution. Background colors are ones which stay longer and more static. Moving objects change frequently because of the changing angles of their surfaces that reflect the light.
* When using background subtraction, we can choose how many frames affect our calculation of the background and how much effect each new frame should have.
* Background subtraction produces a binary image: white where frame is changing, black elsewhere
* We can then shape up what we find with dilate and erode to close holes in each blob
* And run contour finding on them so we have it as data.
* A next step would be to group together these clusters of contours and to add "temporal coherence": to know how blobs move from frame to frame.

## Quiz
Q: In which of the following conditions is background subtraction superior to a simple diff: A) When you have very few frames to work with. B) When light conditions are changing. C) When you need to record the change in color within the image. D) All of the above.
<br />_A: B_

Q: Which of these factors will not affect the performance of background subtraction: A) The amount of frames of history taken into account. B) The size of the input image. C) The number of moving objects in the scene. D) All affect it.
<br />_A: C_

Q: True or false: background subtraction gives you the location of a particular object as it crosses the scene?
<br />_A: False._

## Code

### Important Functions

* <code>opencv.startBackgroundSubtraction()</code> - Setup the background subtraction process.
* <code>opencv.updateBackground()</code> - Update the background based on the current image.
* <code>opencv.dilate()</code> - Thicken the shapes in the current image.
* <code>opencv.erode()</code> - Thin the shapes in the current image. When used in combination with <code>opencv.dilate()</code> this will close holes.
* <code>opencv.findContours()</code> - Find contours based on the current gray image.

### Browse the Code