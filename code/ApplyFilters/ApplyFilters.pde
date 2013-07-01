// Import OpenCVPro so we can use OpenCV
import gab.opencvpro.*;
// Create an OpenCVPro object 
OpenCVPro opencv;

void setup(){
  // load the frame scan into a PImage
  PImage img = loadImage("frame1.jpg");
  // Resize the image.
  // Width of 0 keeps it proportional
  img.resize(0,800);
  // Set the width of the sketch
  // based on the resized image
  size(img.width, img.height);
  // Create an OpenCV object with the image
  // as the source
  opencv = new OpenCVPro(this, img);
}

void draw(){
  // Display the output from opencv
  image(opencv.getOutput(), 0,0);
}
