<!--START BLOCK-->
<a href="" title=""><img src="" /></a>
<!--END BLOCK-->
 
<!--START BLOCK-->
<!--Add a tab before each line of code before running widget_makerv2-->
  import gab.opencv.*;
  import processing.video.*;

  Capture video;
  OpenCV opencv;

  void setup() {
    video = new Capture(this, 1280, 720);
    opencv = new OpenCV(this, video.width, video.height);  
    size(opencv.width, opencv.height, P2D);
    
    video.start();
  }

  void draw() {
    opencv.loadImage(video);
    image(opencv.getOutput(), 0, 0); 
    PVector brightestPoint = opencv.max();
    
    noStroke();
    fill(255, 0, 0);
    ellipse(brightestPoint.x, brightestPoint.y, 20, 20);
  }

  void captureEvent(Capture c) {
    c.read();
  }
<!--END BLOCK-->
 
<!--START BLOCK-->
* Comments list starts here
<!--END BLOCK-->
