class Star {
  int x, y, diam, speed;
  PImage cloud;

  Star() {
    x= int(random(width));
    y = -10;
    diam = int(random(80, 70));
    speed = int(random(-80, 6));
    cloud = loadImage ("cloud.png");
  }

  void display() {
    fill(#FFFFFF);
    stroke(#FFFFFF);
    //ellipse(x, y, diam, diam);
    image(cloud,x,y,diam,diam);
  }


  void move () {
    y+=speed;
  }

  boolean reachedBottom () {
    if (y>height+5) {
      return true;
    } else {
      return false;
    }
  }
}
