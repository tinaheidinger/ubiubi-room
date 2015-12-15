class Room {
  color lightColour;
  boolean on;
  float w;
  float h;
  float x;
  float y;
  String name;
  boolean active; 
  public Room(String name, float x,float y,float w,float h) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.lightColour = color(255);
    this.on = false;
    this.active = false;
  }
  public void drawRoom() {
    if (this.active) {
      stroke(0,0,255);
     
    }
    else {
      stroke(0);
    }
    fill(this.lightColour/*, (this.on ? 1 : 0.5)*/);
    rect(this.x, this.y, this.w, this.h);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);
    text(this.name, this.x, this.y, this.w, this.h);
  }
}