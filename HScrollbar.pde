class HScrollbar{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (int xp, int yp, int sw,int sh, int l) {
    swidth = sw;
    sheight = sh;
    //int heighttowidth = height - sw;
    //ratio = height / (float)heighttowidth;
    xpos = xp-swidth/2;
    ypos = yp;
    spos = ypos;
    newspos = spos;
    sposMin = ypos;
    sposMax = ypos + sheight - swidth;
    loose = l;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseY-swidth/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth-10 &&
    mouseY > ypos && mouseY < ypos+sheight) {
      //println(height);
      return true;
      
    } else {
      return false;
    }
  }

  void display() {
    fill(255);
    if(over || locked) {
      fill(106, 106, 112);
    } else {
      fill(106, 106, 112);
    }
    noStroke();
    rect(xpos, spos, swidth-10, swidth+70,40,40,40,40);
  }

 // float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    //return spos * ratio;
 // }
  
  float getYpos() {
    return spos;
  }
  float getXpos(){
    return xpos;
  }
}