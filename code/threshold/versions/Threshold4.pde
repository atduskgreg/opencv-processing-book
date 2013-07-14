import gab.opencv.*;

OpenCV opencv;

void setup(){
  opencv = new OpenCV(this, "skulls.png");
  size(opencv.width, opencv.height, P2D);
  
  opencv.useColor();
  opencv.threshold(150);
}

void draw(){
  image(opencv.getOutput(), 0,0);
}