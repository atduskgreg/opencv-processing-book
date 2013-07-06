import processing.video.*;

Movie video;

void setup() {
  size(720, 480, P2D);
  video = new Movie(this, "street.mov");

  video.loop();
  video.play();
}

void draw() {
  image(video, 0, 0);  
}

void movieEvent(Movie m) {
  m.read();
}