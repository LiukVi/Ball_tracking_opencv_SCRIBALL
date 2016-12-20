import processing.video.*;
import gab.opencv.*;

Capture cam;
//Movie video;
OpenCV opencv;

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480, 30);
  cam.start();
  
   //size(600 , 300);
  //video = new Movie(this, "/Users/Luca/Downloads/pinball.mp4");
  opencv = new OpenCV(this, 640, 480);
  
  opencv.startBackgroundSubtraction(5, 3, 0.1);
  
  //video.loop();
  //video.play();
}

void draw() {
   if(cam.available()) {
    cam.read();
  }
  image(cam, 900, 600);
  
  
  image(cam, 0, 0);  
  opencv.loadImage(cam);
  
 
  
  opencv.updateBackground();
  
  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(255, 0, 0);
  strokeWeight(1);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}
void movieEvent(Capture m) {
  m.read();
}