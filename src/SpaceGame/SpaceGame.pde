//Bailey,Adeline,Kirubashinilakshana|Nov,5|
Player edgar;
char screen = 's';
//game over, a = app stats
Button btnStart, btnMenu, btnSettings, btnBack;
int level;
int score;
int ghostsHit = 0;
ArrayList<Ghost> ghosts;
ArrayList<Coin> coins;
ArrayList<Wall> walls;
ArrayList<Spear> spears;
PImage start;
boolean play;




void setup() {
  size(1200, 700);
  background(20);
  start = loadImage("start.png"); 
  level=1;
  score = 0;
  edgar = new Player();
  btnStart = new Button("Start",390, 315, 395, 140);

  ghosts = new ArrayList<Ghost>();
  coins = new ArrayList<Coin>();
  walls = new ArrayList<Wall>();
  spears= new ArrayList <Spear>();

  for (int i = 0; i < 5; i++) {
    coins.add(new Coin());
  }
  for (int i = 0; i < 3; i++) {
    ghosts.add(new Ghost());
  }

  walls.add(new Wall(100, 100, 600, 20));   // top horizontal wall
  walls.add(new Wall(100, 200, 20, 400));   // left vertical wall
  walls.add(new Wall(680, 200, 20, 400));   // right vertical wall
  walls.add(new Wall(200, 580, 500, 20));   // bottom horizontal wall
  walls.add(new Wall(300, 300, 200, 20));   // middle section
}



void draw() {
  if (!play) {
    startScreen();
    return;
  }

    background(20);
    infoPanel();
    edgar.display();




    for (int i = 0; i < walls.size(); i++) {
      walls.get(i).display();
    }

    for (int i = coins.size() - 1; i >= 0; i--) {
      Coin c = coins.get(i);
      c.display();
      if (c.intersect(edgar)) {
        score += 10;
        coins.remove(i);
        coins.add(new Coin());
      }
    }


    // can edgar move into next location or is it occupied by a wall
    // edgar intersection with coins is off
    // no ghosts


    for (int i = ghosts.size() - 1; i >= 0; i--) {
      Ghost g = ghosts.get(i);
      g.display();


      if (g.y > height + g.diam/2) {
        ghosts.remove(i);
        ghosts.add(new Ghost());
        continue;
      }


      if (edgar.intersect(g)) {
        edgar.health -= 10;
        ghostsHit++;
        println("Hit! Health:", edgar.health);
        ghosts.remove(i);
        ghosts.add(new Ghost());
      }
    }
  }




//boolean edgarWillHitWall(char key){

// float px = edgar.x;
// float py = edgar.y;
// float pw = edgar.w;
// float ph = edgar.h;


// if (key == 'w') py -= 10;

//if (key == 's') py += 10;

// if (key == 'a') px -= 10;

//if (key == 'd') px += 10;

// for (int i = 0; i < walls.size(); i++) {
//   Wall w = walls.get(i);
//   boolean intersect = rectsOverlap(px, py, pw, ph, w.x, w.y, w.w, w.h);
//  if (intersect){
//    return true;
//}
// }
// return false;
//}

//boolean inRange(float x1,float x2, float w2){
// if (x1 >= x2 && x1 <= (x2+w2)) {
//  return true;
// }
// return false;
//}

//boolean rectsOverlap(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
//
// println(x1,y1,h1,w1);
// println(x2,y2,h2,w2);

//if (inRange(x1, x2, w2)) {
//  if (inRange(y1, y2, h2)) {
//  return true;
//}
//}

//if (inRange(x2, y1, w1)) {
//  if (inRange(y2, y1, h1)) {
//    return true;
//  }
//}
//return false;
//}

void keyPressed() {

  //if (!edgarWillHitWall(key)){

  if (key == 'w') edgar.y -= 10;

  if (key == 's') edgar.y += 10;

  if (key == 'a') edgar.x -= 10;

  if (key == 'd') edgar.x += 10;
}

void mousePressed() {
  if (!play && btnStart.clicked()) {
    play = true;       // start the game
  }
}




void startScreen() {
  background(0);
  imageMode(CENTER);
  image(start, width/2, height/2);


  btnStart.display();

  fill(255);
  textAlign(CENTER);
  textSize(40);
}

void gameOverScreen() {
  background(0);

  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(50);
  text("GAME OVER", width / 2, height - 100);
  textSize(30);
  text("Final Score: " + score, width / 2, height - 50);
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  noStroke();
  rect(width / 2, height - 25, width, 50);

  fill(255);
  textSize(18);
  textAlign(LEFT);

  text("Score: " + score, 20, height - 10);
  text("Ghosts Hit: " + ghostsHit, 200, height - 10);


  text("Health: " + edgar.health, 420, height - 10);
  text("Ammo: " + edgar.spearCount, 620, height - 10);
}

