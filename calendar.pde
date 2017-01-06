class Calendar {

  int month = month();
  int year = year();
  int today = day();
  int d;
  
  int Y_AXIS = 1;
  int X_AXIS = 2;

  Calendar() {
    if (month == 2 && isLeapYear(year)) days[month] = 29;

    d = getDay(month, 1, year);
  }
  
  void update() {
  }

  void show() {
    
    float s = width / 10;
    float ceilMargin = height / 30;
    float sideMargin = width / 12.5;
    float buffer = (width - s*7 - sideMargin*2) / 6;
    float tMargin = height / 40;
    float txtSize = 32;
    float lineH = ceilMargin+tMargin + buffer + s/2;
    float lineY =  ceilMargin + tMargin + (s + buffer) * 6;
    
    // background color
    noStroke();
    fill(54);
    rect(0,0, width, lineH);
    
    // month and year
    
    textSize(txtSize);
    fill(255);
    text(monthsCap[month], sideMargin + s/4, ceilMargin + txtSize/2);
    fill(255, 0, 0);
    text(" "+year, sideMargin+s/4+textWidth(monthsCap[month]), ceilMargin + txtSize/2);

    // scroll through the week
    
    float arrX1 = width - sideMargin;
    float arrX2 = arrX1 - s;
    float arrY = ceilMargin - txtSize/4;
    /*
    noStroke();
    fill(131);
    triangle(arrX1, arrY, arrX1+txtSize/2, arrY+txtSize/2, arrX1, arrY+txtSize);
    triangle(arrX2, arrY, arrX2-txtSize/2, arrY+txtSize/2, arrX2, arrY+txtSize);
    */
    stroke(131);
    strokeWeight(3);
    line(arrX1, arrY, arrX1+txtSize/2, arrY+txtSize/2);
    line(arrX1+txtSize/2, arrY+txtSize/2, arrX1, arrY+txtSize);
    line(arrX2, arrY, arrX2-txtSize/2, arrY+txtSize/2);
    line(arrX2-txtSize/2, arrY+txtSize/2, arrX2, arrY+txtSize); 
    
    strokeWeight(2);
    stroke(131);
    noFill();
    ellipse(arrX1-s/2, arrY+txtSize/2, s/4, s/4);
    

    // days of the week

    for (int i = 0; i < 7; i++) {
      float x = buffer*i + s*i + sideMargin;
      float y = ceilMargin + txtSize + tMargin;
      
      textSize(16);
      fill(131);
      text(names[i], x+s/2-textWidth(names[i])/2, y);
    }
    
    // individual days
    
    float curX = buffer*(d) + s*d + sideMargin;
    float curY = ceilMargin+tMargin+s;
    for (int i = 1; i <= days[month]; i++) {
      
      float textX = curX+s/2-textWidth(""+i)/2;
      float textY = curY+s/2+txtSize/2;
      
      if(today==i) {
        noStroke();
        fill(255, 0, 0);
        ellipse(curX+s/2, curY+s/2+txtSize/5, s, s);
        fill(255);
      } else {
        // hovering
        if(dist(curX+s/2, curY+s/2, mouseX, mouseY) < 32) fill(169);
        else fill(0);
      }
      
      textSize(32);
      text(""+i, textX, textY);
      
      if((curX + sideMargin + s*2) >= width) {
        curX = sideMargin;
        curY += s + buffer;
      } else {
        curX += buffer + s;
      }
    }
    
    /*
    stroke(126);
    fill(0);
    line(0, lineH, width, lineH);
    */
    
    stroke(131);
    strokeWeight(1);
    fill(169);
    line(0, lineY, width, lineY);
    
    /*
    if(width-mouseX > 0 && width-mouseX < 32) {
      color c1 = color(255);
      color c2 = color(255, 0, 0);
      color c3 = color(54);
      setGradient(width-24, 0, 24, lineH, c3, c2, X_AXIS);
      setGradient(width-24, (int)lineH, 24, height, c1, c2, X_AXIS);
    }
    */
  }
  
  /**
   *
   * METHODS
   *
   */
  
  String[] names = {
    "S", "M", "T", "W", "T", "F", "S"
  };
  
  String[] months = {
    "", 
    "January", "February", "March", 
    "April", "May", "June", 
    "July", "August", "September", 
    "October", "November", "December"
  };
  
  String[] monthsCap = {
    "",
    "JAN", "FEB", "MAR", "APR", "MAY",
    "JUN", "JUL", "AUG", "SEP", "OCT",
    "NOV", "DEC"
  };

  int[] days = {
    0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
  };

  int getDay(int month, int day, int year) {
    int y = year - (14 - month) / 12;
    int x = y + y/4 - y/100 + y/400;
    int m = month + 12 * ((14 - month) / 12) - 2;
    int res = (day + x + (31*m)/12) % 7;
    return res;
  }

  boolean isLeapYear(int year) {
    if  ((year % 4 == 0) && (year % 100 != 0)) return true;
    if  (year % 400 == 0) return true;
    return false;
  }

  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    }  
    else if (axis == X_AXIS) {  // Left to right gradient
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
  }
  
}