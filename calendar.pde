class Calendar {

  int month = 1;
  int year = 2017;
  int d;
  int today = 2;

  String[] names = {
    "Su", "M", "Tu", "W", "Th", "F", "Sa"
  };
  
  String[] months = {
    "", 
    "January", "February", "March", 
    "April", "May", "June", 
    "July", "August", "September", 
    "October", "November", "December"
  };

  int[] days = {
    0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
  };

  Calendar() {

    if (month == 2 && isLeapYear(year)) days[month] = 29;

    d = getDay(month, 1, year);
  }

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

  void update() {
  }

  void show() {
    float s = width / 10;
    float buffer = (width - s*7) / 8;

    for (int i = 0; i < 7; i++) {
      float x = buffer*(i+1)+s*i;
      
      textSize(32);
      fill(0);
      text(names[i], x+s/2-textWidth(names[i])/2, 20+s/2+10);
    }
    
    float curX = buffer*(d+1) + s*d;
    float curY = 20+s+buffer;
    for (int i = 1; i <= days[month]; i++) {
      
      if(today==i) {
        noStroke();
        fill(255, 0, 0);
        ellipse(curX+s/2, curY+s/2, s, s);
        fill(255);
      } else fill(0);
      
      textSize(32);
      text(""+i, curX+s/2-textWidth(""+i)/2, curY+s/2+10);
      
      if((curX + buffer + s) >= width) {
        curX = buffer;
        curY += s + buffer;
      } else {
        curX += buffer + s;
      }
    }
  }
}