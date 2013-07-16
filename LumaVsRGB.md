<!--START BLOCK-->
<a href="" title=""><img src="" /></a>
<!--END BLOCK-->
 
<!--START BLOCK-->
<!--Add a tab before each line of code before running widget_makerv2-->
import gab.opencv.*;
// Import the OpenCV Improc class,
// it has the cvtColor() function we need.
import org.opencv.imgproc.Imgproc;

OpenCV opencv;
PImage colorImage, grayImage;

void setup() {
  colorImage = loadImage("flashlight.jpg");
  opencv = new OpenCV(this, colorImage);  
  size(opencv.width, opencv.height, P2D);
  // Save the gray image so we can compare it to Luma
  grayImage = opencv.getSnapshot();
  // Use built-in OpenCV function to conver the color image from BGR to LAB color space.
  Imgproc.cvtColor(opencv.getColor(), opencv.getColor(), Imgproc.COLOR_BGR2Lab);
  // Since the channels start out in the order BGRA,
  // Converting to LAB will put the Luma in the B channel
  opencv.setGray(opencv.getB());
}

void draw() {
  background(0);
  pushMatrix();
  scale(0.5);
  image(colorImage, colorImage.width/2, 0); 
  image(grayImage, 0, colorImage.height);
  image(opencv.getOutput(), colorImage.width, colorImage.height);
  popMatrix();

  fill(255);
  text("GRAY", 30, height -25);
  text("LUMA", width/2 + 30, height - 25);
}
<!--END BLOCK-->
 
<!--START BLOCK-->
* Comments list starts here
<!--END BLOCK-->
