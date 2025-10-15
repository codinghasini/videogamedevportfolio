// Kirubashini S | September 17th 2025 | SpaceGame
ArrayList<Rock> candy = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
SpaceShip cookie;
int score, rockspassed, level, rtime;
Timer chipTimer, puTimer;
PImage start;
PImage gameover;
boolean play;
import processing.sound.*;
SoundFile sparkle;



void setup() {
  size (650, 650);
  background(20);
  cookie = new SpaceShip();
  level = 1;
  score = 0;
  rockspassed =0;
  rtime = 1000;
  //Timer info
  chipTimer = new Timer(rtime);
  puTimer = new Timer(2000);
  puTimer.start();
  chipTimer.start();
  play = false;
  start = loadImage("start.png");
  gameover = loadImage("gameover.png");
  sparkle = new SoundFile(this, "sparkle.wav");


  //image info
}

void draw () {
  if (!play) {
    startScreen();
  } else {
    
    background(#8bd5f6);
    
    if (frameCount % 1000 == 0) {
      level++;
      //chipTimer.totalTime -= 50;
      rtime-= 200;
    }


    if (puTimer.isFinished()) {
      powups.add(new Powerup());
      puTimer.start();
    }
    for (int i = 0; i < powups.size(); i ++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(cookie) && pu.type =='h') {
        powups.remove(pu);
        cookie.health += 100;
      } else if (pu.intersect(cookie) && pu.type =='a') {
        cookie.ammo += 100;
        powups.remove(pu);
        if (pu.reachedBottom()) {
          powups.remove(pu);
        }
      }
    }


    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    // Distributes rock on timer
    if (chipTimer.isFinished()) {
      candy.add(new Rock());
      chipTimer.totalTime = rtime;
      chipTimer.start();
    }


    for (int i = 0; i < candy.size(); i++) {
      Rock rock = candy.get(i);
      rock.move();
      rock.display();

      if (cookie.intersect(rock)) {
        candy.remove(rock);
        score+= 5;
        cookie.health-= 5;
      }

      if (rock.reachedBottom()) {
        candy.remove(rock);
        i--;
      }
      println(candy.size());
    }
    

    // Display and move lasers
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < candy.size(); j++) {
        Rock rock = candy.get(j);
        if (laser.intersect(rock)) {
          rock.diam -= 10;
          if (rock.diam <5) {
            candy.remove(rock);
          }
          score += 5;
          lasers.remove(laser);
        }
      }
      laser.display();
      laser.move();
    }

    cookie.display();
    infoPanel();
    cookie.move(mouseX, mouseY);
    
    
    if (cookie.health<1){
      gameOver();
    }
    if (cookie.ammo<1){
      gameOver();
    }
  }
}

  void mousePressed() {
    
    if (!sparkle.isPlaying()) {
        sparkle.play();
    }
    
    lasers.add(new Laser(cookie.x, cookie.y));
    cookie.ammo--;
    
  }

  void infoPanel() {
    rectMode(CENTER);
    fill(127, 127);
    rect(width/2, 20, width, 40);
    fill(255);
    textSize(20);
    text("Score:" + score, 20, 36);
    text("Health:" + cookie.health, 150, 36);
    text("Level:" +  level, 450, 36);
    text("Ammo:" + cookie.ammo, 300, 36);
    //text("candy passed:" + rockspassed, 410, 36);
  }

  void startScreen() {
    //start = loadImage("start.png");
    //imageMode(CENTER);
    image(start,0,0);
    if(mousePressed) {
      play = true;
    }
    textSize(100);
    text("Start" ,300,150);
    
  }

  void gameOver() {
    //ackground (#D8BFD8);
    //ill(255);
    //text("Game Over :(", 205, 300);
    image(gameover,325,325);
    
    textSize(80);
    text("Game Over" ,230,150);
    textSize(50);
    text("Level: " + level, 340,200);
    noLoop();
  }
