<!--START BLOCK-->
<a href="" title=""><img src="" /></a>
<!--END BLOCK-->
 
<!--START BLOCK-->
<!--Add a tab before each line of code before running widget_makerv2-->
	import gab.opencv.*;

	OpenCV opencv;

	void setup() {
	  opencv = new OpenCV(this, "flashlight.jpg");  
	  size(opencv.width, opencv.height, P2D);
	}

	void draw() {
	  image(opencv.getOutput(), 0, 0); 
	}
<!--END BLOCK-->
 
<!--START BLOCK-->
* Comments list starts here
<!--END BLOCK-->
