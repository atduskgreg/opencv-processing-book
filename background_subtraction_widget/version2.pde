import processing.video.*;
import gab.opencvpro.*;

Movie video;
OpenCV opencv;

void setup() {
  size(720, 480, P2D);
  video = new Movie(this, "street.mov");
  opencv = new OpenCV(this, 720, 480);

  video.loop();
  video.play();
}

void draw() {
  opencv.loadImage(video);
  image(opencv.getOutput(), 0, 0);
}

void movieEvent(Movie m) {
  m.read();
}