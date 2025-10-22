class SpaceShip {
  // Member Variables
  int x, y, w,health,turretCount, ammo;
  PImage ship;

  // Constructor
  SpaceShip() {
    x = width/2;
    y = height/2;
    health = 10;
    w = 100;
    ammo= 40;
    turretCount = 2;
    ship = loadImage ("cookie.png");
    
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(ship,x,y);
    

  
  }

  void move (int x, int y) {
    this. x = x;
    this.y = y;
  }


  void fire () {
  }

  boolean intersect(Rock c) {
   float d = dist(x, y, c.x, c.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
