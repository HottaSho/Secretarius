<<<<<<< Updated upstream
todo todoView = null;
Calendar cView = new Calendar();
int prevHeight = height;
boolean calView = true;

=======
todo todoView = new todo();
>>>>>>> Stashed changes
void settings() {
  size(600, 800);
}

void setup() {
  surface.setResizable(true);
}
<<<<<<< Updated upstream

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
   
=======
int prevHeight = height;
HScrollbar hs1;
void draw() {
  background(255);
  //println(prevHeight==height);
  if(hs1 != null) {
    //prevHeight = height;
     hs1.update();
    hs1.display();      //todoView.update();
    todoView.show(hs1.getXpos(), hs1.getYpos());
  }
  if(hs1 == null || prevHeight != height) {
    prevHeight = height;
    hs1 = new HScrollbar(12,0,20,height,16);
   // print("TESTING");
  }
>>>>>>> Stashed changes
}