// Declare Global Variables
int globalTimer;
Spaceship Spaceship1;
Projectile projectile1;
int gameScore;
int levelAmount=5;
Asteroid[] level;

ArrayList<Projectile> projectiles = new ArrayList();

void setup(){
  size(1800, 1000);
  Spaceship1 = new Spaceship(300,400,10);
  levelFill();
}

void draw() {
  background(0);
  fill(#FC910D);
  rect(0,750,1800,50);
  for(Asteroid as:level){
    as.display();
  }

  globalTimer++;
  Spaceship1.display(); 
  
  for (Projectile p: projectiles){
    p.display();
  }
  
}

void keyPressed(){
if (key == 'w') {
    Spaceship1.move(0,-10);
    } else if (key == 's') {
    Spaceship1.move(0, 10);
    } else if (key == 'd'){
    Spaceship1.move(10, 0);
    } else if (key == 'a'){
    Spaceship1.move(-10, 0);
    } else if (key == ' '){
    Spaceship1.shoot();
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
  levelAmount+=5;
}



 
