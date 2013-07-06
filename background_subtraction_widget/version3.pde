import processing.video.*;
import gab.opencvpro.*;

Movie video;
OpenCV opencv;

void setup() {
  size(720, 480, P2D);
  video = new Movie(this, "street.mov");
  opencv = new OpenCV(this, 720, 480);

  opencv.startBackgroundSubtraction(5, 3, 0.5);

  video.loop();
  video.play();
}

void draw() {
  opencv.loadImage(video);
  opencv.updateBackground();
  image(opencv.getOutput(), 0, 0);
}