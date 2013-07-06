import processing.video.*;
import gab.opencvpro.*;
import java.awt.Rectangle;

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
  
  opencv.dilate();
  opencv.erode();

  image(video, 0, 0);
  
  noFill();
  stroke(255,0,0);
  strokeWeight(2);
  for(Contour contour : opencv.findContours()){
    Rectangle r = contour.getBoundingBox();
    rect(r.x, r.y, r.width, r.height);
  }    
}

void movieEvent(Movie m) {
  m.read();
}
