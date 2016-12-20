import processing.video.*;
import gab.opencv.*;

Capture cam;

OpenCV opencv;

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480, 30);
  cam.start();
  

  opencv = new OpenCV(this, 640, 480);
  
  opencv.startBackgroundSubtraction(5, 3, 0.1);
  

}

void draw() {
   if(cam.available()) {
    cam.read();
  }
  image(cam, 900, 600);
  
  
  image(cam, 0, 0);  
  opencv.loadImage(cam);
  
//erode l'immagine per identificare gli oggetti in movimento 
  
  opencv.updateBackground();
  
  opencv.dilate();
  opencv.erode();

//disegna linea attorno all'oggetto in movimento

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
