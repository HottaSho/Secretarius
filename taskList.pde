class taskList {
  
  float curX;
  float curY;
  float space;
  int size;
  
  taskList(float tx, float ty, float spacing, int s, int count) {
    curX = tx;
    curY = ty;
    space = spacing;
    size = s;
    for(int i = 0; i < count; i++) {
      addTask();
    }
  }
  
  task[] Tasks = new task[5];
  int curIdx = 0;
  int len = 5;
  
  class task {
    boolean checked = false;
    float x;
    float y;
    
    task(float tx, float ty) {
      x = tx;
      y = ty;
    }
    
    task(task other) {
      x = other.getX();
      y = other.getY();
      checked = other.getCheck();
    }
    
    float getX() {return x;}
    float getY() {return y;}
    boolean getCheck() {return checked;}
    
    void display() {
      stroke(0);
      fill(255);
      rect(x, y, size, size, 7);
    }
  }
  
  void update() {
    
  }
  
  void display() {
    for (int i = 0; i < curIdx; i++) {
      Tasks[i].display();
    }
  
  }
  
  void addTask() {
    if (curIdx >= len) {
      task[] temp = new task[len*2];
      for (int i = 0; i < len; i++) temp[i] = new task(Tasks[i]);
      len *= 2;
      Tasks = temp;
    }
    Tasks[curIdx] = new task(curX, curY);
    curY += space;
    curIdx++;
  }
  
  void keyPress(String keyString) {
    if (keyString == "ENTER") {
      addTask();
    }
  }
  
}