# Track All the Things

## Face Detection

_Detecting faces in images is one of the most ubiquitous applications of computer vision. We see it in our digital cameras for autofocus, on our social networks to identify our friends, in public surveillance systems, and many other places. In this project, we'll learn how to detect faces using OpenCV. We'll see a little bit about how the face detection process works, how it can fail, and how we can apply it to detect other things besides just faces._

<iframe src="http://player.vimeo.com/video/69907695" width="1000" height="562" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

_Video and images from Adam Harvey's [CV Dazzle](http://cvdazzle.com) used with permission. Clock photo by [jaqian](http://www.flickr.com/photos/jaqian/7292320/) and pedestrian photo by [gandalphcunningham](http://www.flickr.com/photos/gandalfcunningham/2527870434/)._

### Video Summary

* Face detection in OpenCV is easy to use.
* It is necessary to learn about how it is implemented in order to use it effectively and understand its limitations.
* OpenCV's face detector uses the Viola-Jones algorithm, originally introduced in the 2001 paper [Rapid Object Detection Using a Boosted
Cascade of Simple Features](http://www.merl.com/papers/docs/TR2004-043.pdf).
* Viola-Jones works by matching a defined series of patterns of light and dark rectangles to different areas of the image at different scales.
* Faces have a consistent arrangement of highlights and shadows based on how light falls on the facial features.
* Viola-Jones can be trained to recognize these patterns.
* The training process requires a large set of input images and takes a long time and a lot of computing resources.
* The training process produces a "cascade" file (usually stored as XML), which can be loaded into OpenCV for realtime detection.
* The most commonly used cascade is for frontal faces.
* Artist Adam Harvey's [CV Dazzle](http://cvdazzle.com) project consists of makeup designed to camouflage the wearer from Viola-Jones face detection.
* CV Dazzle works by introducing dark and light patches onto the face where the Viola-Jones frontal face cascade does not expect them to be.
* Harvey produced [visualizations](https://vimeo.com/34545827) that illustrate how the Viola-Jones detection process works.
* For more about CV Dazzle and how the Viola-Jones algorithm works, see [this Makematics interview with Adam Harvey](http://makematics.com/research/viola-jones/).
* Viola-Jones can detect multiple faces.
* Find more faces will slow down the processing of each image.
* Viola-Jones can also be used to detect other objects than faces.
* Researchers have created cascades for noses, ears, pedestrians, clock faces, and many other objects.

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

Q: Which of the following conditions will not make OpenCV face detection run faster: A) A smaller input image. B) Fewer faces present in the image. C) Good lighting.
<p class="pop btn" href="#" rel="popover" title="Answer"
data-content="C, good lighting.">Reveal the Answer</p>

Q: Is it easier to detect objects with a cascade or to train a new cascade?
<p class="pop btn" href="#" rel="popover" title="Answer"
data-content="Detect. Training is difficult and computationally expensive.">Reveal the Answer</p>

Q: What is the minimum angle of orientation that will cause the frontal face cascade to fail to detect the face?
<p class="pop btn" href="#" rel="popover" title="Answer"
data-content="15 degrees.">Reveal the Answer</p>

### Code

#### Important Functions

* <code>opencv.loadCascade()</code> - Setup for face tracking (or other cascade-based tracking).
* <code>OpenCV.CASCADE_FRONTALFACE_ALT</code> - A constant referring to the standard cascade for detecting faces. Pass this to <code>opencv.loadCascade()</code> to setup for face detection.
* <code>opencv.detect()</code> - Detect objects in the current image based on the configured cascade. Returns an array of Rectangle objects.

#### Browse the Code

* Detect faces in video
* Scaling trick to do it faster
* Detect clocks with a different cascade

#### Widget

<!--START WIDGET-->

![image 1](../../../code/facetracking/versions/image1.png)

<!--COLBREAK-->

	import gab.opencv.*;
	import processing.video.*;
	import java.awt.*;

	Capture video;
	OpenCV opencv;

	void setup() {
	  size(640, 480, P2D);
	  video = new Capture(this, 640, 480);
	  opencv = new OpenCV(this, video.width, video.height);
	  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

	  video.start();
	}

	void draw() {
	  image(video, 0, 0 );

	  opencv.loadImage(video);

	  noFill();
	  stroke(0, 255, 0);
	  Rectangle[] faces = opencv.detect();
	  println(faces.length);

	  for (int i = 0; i < faces.length; i++) {
	      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
	  }
	}

	void captureEvent(Capture c) {
	  c.read();
	}

<!--COLBREAK-->

* Comments go here.
* Another comment.

<!--SLIDEBREAK-->

![image 2](../../../code/facetracking/versions/image2.png)

<!--COLBREAK-->

	import gab.opencv.*;
	import processing.video.*;
	import java.awt.*;

	Capture video;
	OpenCV opencv;

	void setup() {
	  size(640, 480, P2D);
	  video = new Capture(this, 640, 480);
	  opencv = new OpenCV(this, video.width, video.height);
	  opencv.loadCascade(OpenCV.CASCADE_RIGHT_EAR);  

	  video.start();
	}

	void draw() {
	  image(video, 0, 0 );

	  opencv.loadImage(video);

	  noFill();
	  stroke(0, 255, 0);
	  Rectangle[] ears = opencv.detect();
	  println(faces.length);

	  for (int i = 0; i < ears.length; i++) {
	      rect(ears[i].x, ears[i].y, ears[i].width, ears[i].height);
	  }
	}

	void captureEvent(Capture c) {
	  c.read();
	}

<!--COLBREAK-->

* Comments go here.
* Another comment.

<!--SLIDEBREAK-->

![image 3](../../../code/facetracking/versions/image3.png)

<!--COLBREAK-->

	import gab.opencv.*;
	import processing.video.*;
	import java.awt.*;

	Capture video;
	OpenCV opencv;

	PImage small;
	int scaleFactor = 4;

	void setup() {
	  size(640, 480, P2D);
	  video = new Capture(this, 640, 480);
	  opencv = new OpenCV(this, video.width/scaleFactor, video.height/scaleFactor);
	  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

	  small = createImage(opencv.width, opencv.height, ARGB);

	  video.start();
	}

	void draw() {
	  image(video, 0, 0 );

	  small.copy(video, 0, 0, video.width, video.height, 0, 0, small.width, small.height);
	  opencv.loadImage(small);

	  noFill();
	  scale(scaleFactor);
	  stroke(0, 255, 0);
	  Rectangle[] faces = opencv.detect();
	  println(faces.length);

	  for (int i = 0; i < faces.length; i++) {
	      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
	  }
	}

	void captureEvent(Capture c) {
	  c.read();
	}

<!--COLBREAK-->

* Comments go here.
* Another comment.

<!--END WIDGET-->
