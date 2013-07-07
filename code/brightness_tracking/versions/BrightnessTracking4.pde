import gab.opencvpro.*;
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
  opencv.setBufferGray(opencv.getBufferG());
  image(opencv.getOutput(), 0, 0); 
  PVector brightestPoint = opencv.max();
  
  noStroke();
  fill(255, 0, 0);
  ellipse(brightestPoint.x, brightestPoint.y, 20, 20);
}

void captureEvent(Capture c) {
  c.read();
}