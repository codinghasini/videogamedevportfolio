class Laser {
  // Member Varaibles
  int x, y, w, h, speed,lasersCount;
  PImage chip;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y= y;
    w = 5;
    h = 10;
    speed = 5;
    chip = loadImage("chip.png");
  }
  // Member Methods
  void display() {
    imageMode(CENTER);
    chip.resize(50,50);
    image(chip,x,y);
 
    
    
  }


  void move() {
    y=y-speed;
  }


  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
