todo todoView = null;

void settings() {
    size(600, 600);
}

void setup() {
      surface.setResizable(true);

}
int prevHeight = height;
void draw() {
  background(255);
  println(prevHeight==height);
  if(todoView != null) {
    //prevHeight = height;
    todoView.show();      //todoView.update();
      
      println("ooo",height);
      
  }
  if(todoView == null || prevHeight != height) {
    prevHeight = height;
    todoView = new todo();
    print("TESTING");
  }
  
}