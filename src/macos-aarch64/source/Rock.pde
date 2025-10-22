class Rock {
  int x, y, diam, speed;
  PImage r1;
  Rock() {;
    x= int(random(width));
    y= -100;
    diam = int(random(100, 100));
    speed = int(random(1, 5));
    if (random(10)>6.6) {
      r1 = loadImage("lolly.png");
    } else if (random(10)>5.0) {
      r1 = loadImage("cotton.png");
    } else {
     r1 = loadImage("apple.png");
    }
  }

  void display() {
    imageMode(CENTER);
    r1.resize(diam,diam);
    image(r1,x,y);
  }


  void move () {
    y=y+speed;
  }

  boolean reachedBottom () {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(SpaceShip s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
