todo todoView = null;
Calendar cView = new Calendar();
int prevHeight = height;
boolean calView = true;

void settings() {
  size(600, 800);
}

void setup() {
  surface.setResizable(true);
}

void draw() {
  background(255);
  
  if(calView) {
    cView.update();
    cView.show();
  } else {
    if(todoView != null) {
      todoView.show();
    }
    if(todoView == null || prevHeight != height) {
      prevHeight = height;
      todoView = new todo();
      //print("TESTING");
    }
  }
   
}