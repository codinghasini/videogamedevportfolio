class Powerup {
  int x, y, diam, speed;
  char type;
  Powerup() {

    x= int(random(width));
    y= -100;
    diam = int(random(20, 80));
    speed = int(random(1, 5));

    int rand = int(random(4));
    if (random(10)>6.6) {
      type = 'h';
    } else if (random(10)>6.6) {
      type = 'a';
    } 
  }

  void display() {
    if (type== 'h') {
      fill (#FFB803);
      ellipse(x, y, diam, diam);
    }
    if (type== 'a') {
      fill (#34116F);
      ellipse(x, y, diam, diam);
    }
  }


  void move () {
    y += speed;
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
