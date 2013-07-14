import gab.opencv.*;

OpenCV opencv;

void setup() {
  opencv = new OpenCV(this, "flashlight.jpg");  
  size(opencv.width, opencv.height, P2D);
}

void draw() {
  image(opencv.getOutput(), 0, 0); 
  PVector brightestPoint = opencv.max();
  
  noStroke();
  fill(255, 0, 0);
  ellipse(brightestPoint.x, brightestPoint.y, 20, 20);
}