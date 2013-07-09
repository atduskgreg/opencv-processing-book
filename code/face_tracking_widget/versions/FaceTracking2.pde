import gab.opencvpro.*;
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
