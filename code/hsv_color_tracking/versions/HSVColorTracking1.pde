import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture video;
OpenCV opencv;
ArrayList<Contour> contours;

// <1> Set the range of Hue values for our filter
int rangeLow = 20;
int rangeHigh = 35;

void setup() {
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, video.width, video.height);
  size(opencv.width, opencv.height, P2D);
  contours = new ArrayList<Contour>();
  
  video.start();
}

void draw() {
  image(video, 0, 0);  

  // <2> Load the new frame of our movie in to OpenCV
  opencv.loadImage(video.image());
  // <3> Tell OpenCV to work in HSV color space.
  opencv.useColor(HSB);
  // <4> Copy the Hue channel of our image into 
  //     the gray channel, which we process.
  opencv.setGray(opencv.getH().clone());
  // <5> Filter the image based on the range of 
  //     hue values that match the object we want to track.
  opencv.inRange(rangeLow, rangeHigh);
  // <6> Display the processed image for reference.
  image(opencv.getOutput(), 3*width/4, 3*height/4, width/4, height/4);
  // <7> Find contours in our range image.
  //     Passing 'true' sorts them by descending area.
  contours = opencv.findContours(true);
  // <8> Check to make sure we've found any contours
  if (contours.size() > 0) {
    // <9> Get the first contour, which will be the largest one
    Contour biggestContour = contours.get(0);
    // <10> Find the bounding box of the largest contour,
    //      and hence our object.
    Rectangle r = biggestContour.getBoundingBox();
    // <11> Draw the bounding box of our object
    noFill(); 
    strokeWeight(2); 
    stroke(255, 0, 0);
    rect(r.x, r.y, r.width, r.height);
    // <12> Draw a dot in the middle of the bounding box, on the object.
    noStroke(); 
    fill(255, 0, 0);
    ellipse(r.x + r.width/2, r.y + r.height/2, 30, 30);
  }
}

void captureEvent(Capture c) {
  c.read();
}
