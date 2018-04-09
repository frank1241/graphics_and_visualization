//
import processing.sound.*;
SoundFile file1;
SoundFile file2;
//
// Declare Global Variables
int globalTimer;
Spaceship Spaceship1;
int gameScore;
int levelNumber = 1;
int levelAmount = 5;
Asteroid[] level;
ArrayList<Projectile> projectiles = new ArrayList();
boolean Paused = false;


class Projectile{
  PShape projectile;
  float x, y, v, r;
  Projectile(float x, float y, float v, float r){
  this.x = x;
  this.y = y;
  this.v = v;
  this.r = r;
  }
  void display(){
  fill(color(173,17,5));
  projectile = createShape(ELLIPSE, x, y, r, r);
  shape(projectile);
  this.move();
  }
  void move(){
  this.x += v;
  }
}

class Spaceship{
  PShape ship;
  float x, y, countProjectiles, lives;
  Spaceship(float x, float y, float countProjectiles, float lives){
  this.x = x;
  this.y = y;
  this.countProjectiles = countProjectiles;
  this.lives = lives;
  }
  void display(){
  ship = createShape(GROUP);
  fill(color(43,8,160));
  ship.addChild(createShape(TRIANGLE, x, y, x-125, y-50, x-125, y + 50));
  ship.addChild(createShape(RECT, x-140, y - 25, 15, 10));
  ship.addChild(createShape(RECT, x-140, y + 25, 15, 10));
  shape(ship);
  }
  void move(float x, float y){
  this.x += x;
  this.y += y;
  }
  void shoot(){
  if (this.countProjectiles >= 1){
  projectiles.add(new Projectile(this.x, this.y, 10, 30));
  this.countProjectiles -=1;
  }
  }
}

class Asteroid{
  float initx,inity,x,y;
  float velx;
  float radius;
  boolean isCollided=false;
  Asteroid(float x,float y,float velx,float radius){
    this.initx = x;
    this.inity = y;
    this.x = x;
    this.y = y;
    this.velx = velx;
    this.radius = radius;
  }

  void detectShipCollision(Spaceship other){
    float distance = sqrt(sq(other.x-62.5-this.x) + sq(other.y-this.y));
    if(distance < (this.radius/2+ 62.5)){
      this.isCollided = true;
      this.radius = 0;
      this.y = -200;
      other.lives -= 1;

    }
  }
  void detectBulletCollision(Projectile other){
    float distance = sqrt(sq(other.x-this.x) + sq(other.y-this.y));
    if(distance < (this.radius/2 + other.r/2)){
      this.isCollided = true;
      gameScore+= this.radius;
      this.radius = 0;
      //other.r = 0;
      this.y = -200;
    }
  }

  void move(){
    this.x = this.x + this.velx;
    if(this.x <= 0){
      this.x = this.initx;
    }
  }
  void display(){
    for(Projectile other: projectiles){
      this.detectBulletCollision(other);
    }
    this.detectShipCollision(Spaceship1);

    fill(255);
    ellipse(this.x,this.y,this.radius,this.radius);
    this.move();
  }
}

void setup(){
  size(1800, 1000);
  Spaceship1 = new Spaceship(300,400,10,3);
  levelFill();

  //
  file1 = new SoundFile(this, "SpaceMusic.mp3");
  file1.loop(1,.5);
  file2 = new SoundFile(this, "Congrats.mp3");
  file2.play(1,.5);
  //

}
void draw() {
  globalTimer++;
  background(0);

  // Check if spaceship hits spikes
  if (Spaceship1.y <= 50){
  Spaceship1.lives -=1;
  Spaceship1.y += 100;
  }
  if (Spaceship1.y >= 735){
  Spaceship1.lives -=1;
  Spaceship1.y -= 100;
  }
  // GUI
  fill(#FC910D);
  rect(0,800,1800,50);
  textSize(50);
  text("Lives Left: " + int(Spaceship1.lives), 50, 950);
  text("Projectiles: " + int(Spaceship1.countProjectiles), 400, 950);
  text("Level Number: " + levelNumber, 800, 950);
  text("Game Score: " + gameScore, 1300, 950);


  // Boundary Spikes
  beginShape();
  for(int i = 0; i < 72; i++){
  vertex(0 + 25*i, 0);
  vertex(12.5 + 25*i, 15);
  vertex(25 + 25*i,0);
  }
  endShape();
  beginShape();
  for(int i = 0; i < 72; i++){
  vertex(0 + 25*i, 800);
  vertex(12.5 + 25*i, 785 );
  vertex(25 + 25*i, 800);
  }
  endShape();
  for(Asteroid as:level){
    as.display();
  }
  Spaceship1.display();
  for (Projectile p: projectiles){
    p.display();
  }

  // Check if level has ended or game is over
  //println(Spaceship1.lives);
  if (Spaceship1.lives <= 0){
  fill(255);
  textSize(75);
  text("Game Over", 698, 450);
  textSize(50);
  //text("Lives:" + Spaceship1.lives, 100, 950);
  text("Score: " + gameScore, 700, 550);
  text("Press R to Restart", 700, 650);
  println("GameOver");
  noLoop();
  }
  boolean allCollided;
  allCollided= true;

  for(Asteroid as:level){
     if (as.isCollided == false ){
         allCollided = false;
     }
  }
  if (allCollided ==true){
  println("NextLevel");
  levelNumber += 1;
  levelAmount += 3;
  println(levelAmount);
  levelFill();
  Spaceship1.countProjectiles += 5;
  }
  // Check if game is won
  if (levelNumber == 4){
  fill(255);
  textSize(75);
  text("You Win", 698, 450);
  textSize(50);
  text("Score: " + gameScore, 700, 550);
  text("Press R to Restart", 700, 650);
  //
  file1.amp(0);
  file2.amp(1);
  //
  noLoop();
  }
  else{
  file1.amp(1);
  file2.amp(0);
  }

}

void keyPressed(){
if (key == 'w'){
    Spaceship1.move(0,-10);
    } else if (key == 's') {
    Spaceship1.move(0, 10);
    } else if (key == 'd'){
    Spaceship1.move(10, 0);
    } else if (key == 'a'){
    Spaceship1.move(-10, 0);
    } else if (key == ' '){
    Spaceship1.shoot();
    } else if (key == 'r'){
    loop();
    levelNumber = 1;
    levelAmount = 5;
    gameScore = 0;
    Spaceship1 = new Spaceship(300,400,10,3);
    projectiles = new ArrayList();
    levelFill();
    } else if (key == 'p'){
      if (Paused == true){ loop();
      Paused = false;
    } else if (Paused == false){
    noLoop();
    Paused = true;
    }
    }
}

void levelFill(){
  float randy,randvelx,randius;
  level = new Asteroid[levelAmount];
  for(int i=0;i<levelAmount;i++){
    randy = random(50,700);
    randvelx = random(1,10);
    randius = random(30,150);
    level[i] = new Asteroid(width,randy,-randvelx,randius);
  }
}
