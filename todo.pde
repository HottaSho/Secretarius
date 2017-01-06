import java.awt.Component.*;
import java.awt.*;
import controlP5.*;

class todo{
 float xpo;
 float ypo;
 boolean[] buttonPressed = new boolean[1];
 int count = 5;
  // Load images
 todo()  {
 }
void update(){
  
  
}
void show(float xpos, float ypos) {
    println(buttonPressed[0]);

  xpo = xpos+12;
  ypo = -ypos;
  fill(255);
  stroke(0);
   if (buttonPressed[0]){
    fill(255,0,0);
    noStroke();
  } else if (!buttonPressed[0]) { 
    fill(255);
    stroke(131,131,131);}
  if(mousePressed && over() && !buttonPressed[0] && count == 0) {
      count = 5;
      buttonPressed[0] = true;
      fill(255, 0, 0);
      noStroke();
      //fill(255);
  } else if (count >0) {
    count = count -1;
  }
  if (mousePressed && over() && buttonPressed[0]) {
      buttonPressed[0] = false;
      fill(255);
      stroke(131,131,131);
      //fill(255);
  } 
  if (over() && !buttonPressed[0]) {
    fill(255);
    stroke(54,54,54);
  }
  println(count);
 // println(mousePressed && over() && !buttonPressed[0] && count == 0);
 // println(over());
  rect(xpo, ypo+5, 15, 15, 7); 

  // Get the position of the img2 scrollbar, 
  // and convert to a value to display the img2 image
  //hs1.display();
  //noStroke();
}
boolean over() {
    if(mouseX > xpo && mouseX < xpo+16 &&
    mouseY > ypo && mouseY < ypo+20) {
      //println(height);
      return true;   
    } else {
      return false;
    }
}


 void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println("wheel",e);
}


}

 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  