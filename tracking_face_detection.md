# Track All the Things

## Face Detection

_Detecting faces in images is one of the most ubiquitous applications of computer vision. We see it in our digital cameras for autofocus, on our social networks to identify our friends, in public surveillance systems, and many other places. In this project, we'll learn how to detect faces using OpenCV. We'll see a little bit about how the face detection process works, how it can fail, and how we can apply it to detect other things besides just faces._

### Video Script

[Face detection running]

* In this project we'll learn how to detect faces in still images and live video.
* OpenCV includes a function for detecting faces that's very easy to use.
* However in order to understand its limitations and the situations where it will work, you need to learn a little bit about how face detection actually works.

[viola-jones paper scroll?]

* OpenCV's face detector uses an algorithm called Viola-Jones
* It works by matching patterns of light and dark squares to different areas of the image at different scales.
* Faces have a consistent arrangement of highlights and shadows  based on how light falls on the nose, cheeks, forehead, and other facial features.
* The Viola-Jones algorithm can be trained to recognize these patterns by being shown lots of pictures of faces. This process is very resource intensive and takes a long time to complete.
* When complete, this training process results in a file called a "cascade", which can be loaded into OpenCV and used for realtime detection without having to go through the painstaking process of training each time.
* The cascade that's used most often is trained on frontal faces.

[itp picture]

* This detection technique isn't limited to just one face.
* Here you can see it finding 79 faces in a single image.
* It will find every face in the image that it can. Keep in mind, though: the more faces that are present, the longer it will take to process each image.

[cv dazzle makeup image]

* For his CV Dazzle project, artist Adam Harvey designed makeup that camouflages the wearer from Viola-Jones face detection.
* Harvey's designs work by introducing dark and light patches on the face in areas where they don't usually appear, frustrating the detection algorithm.

[cv dazzle before video]

* In order to design these patterns, Harvey created visualizations, like this one, that clearly show how the Viola-Jones algorithm works.
* What you're seeing here represents what happens when we detect faces just slowed down to the point where we can understand it.
* The algorithm is searching across the image, in different locations and scales.
* At each point, it compares a series of black and white patterns with the image, looking for equivalent areas of brightness and darkness of the image.
* When it finds enough of these, overlapping just the right way, it's matched a face.


[Alternative cascade montage]

* This technique is not just limited to whole faces.
* Researchers have trained cascades for:
* individual parts of the face like eyes and ears
* The entire upper body or lower body
* even clocks

### Video Summary

### The Politics of Face Detection

Face detection brings out strong, sometimes contradictory, reactions in people. It triggers our fear of being observed, of surveillance by governments, corporations, and others figures of authority. In response to these fears, there's something of a tradition of creative projects that produce inventive ways of avoiding face detection.

Beyond Adam Harvey's CV Dazzle, demonstrated above, artists [Kyle McDonald](http://kylemcdonald.net) and [Aram Bartholl](http://datenform.de/) of the [F.A.T Lab collective](http://fffff.at/) created a video on "[How To Avoid Facial Recognition](http://fffff.at/how-to-avoid-facial-recognition/)"

<iframe src="http://player.vimeo.com/video/41861212" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe> 

Very different in style and tone from CV Dazzle, the combination of humor and punk rock attitude in this video simultaneously expresses and mocks the idea of face detection as a form of technological oppression. 

At the end of the video McDonald and Bartholl demonstrate that most face detection systems fail if the face is tilted by more than 15 degrees or so. This is a practical concern when using OpenCV's face detection functions. It can be overcome by rotating the image before processing, but that technique is computationally expensive and rarely done.

In addition to the fear of being observed by face detection systems, there's a different kind of fear in being invisible to them.

In 2009, two employees of a computer store uploaded a video called [HP Computers are Racist](http://www.youtube.com/watch?v=t4DT3tQqgRM) in which they demonstrated an HP MediaSmart computer failing to track the face of a black man, but succeeding on a white woman.

<iframe width="420" height="315" src="//www.youtube.com/embed/t4DT3tQqgRM" frameborder="0" allowfullscreen></iframe>

[HP responded](http://www.pcmag.com/article2/0,2817,2357429,00.asp) to the video by explaining the technical roots of the problem and insisting it wasn't intentional:

>"The technology we use is built on standard algorithms that measure the difference in intensity of contrast between the eyes and the upper cheek and nose. We believe that the camera might have difficulty 'seeing' contrast in conditions where there is insufficient foreground lighting."



### Quiz

### Code

#### Important Functions

* <code>opencv.loadCascade()</code> - Setup for face tracking (or other cascade-based tracking).
* <code>OpenCV.CASCADE_FRONTALFACE_ALT</code> - A constant referring to the standard cascade for detecting faces. Pass this to <code>opencv.loadCascade()</code> to setup for face detection.
* <code>opencv.detect()</code> - Detect objects in the current image based on the configured cascade. Returns an array of Rectangle objects.

#### Browse the Code

* Detect faces in video
* Detect clocks with a different cascade