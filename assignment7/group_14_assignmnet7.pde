// Declare Global Variables
int globalTimer;
Spaceship Spaceship1;
Projectile projectile1;

ArrayList<Projectile> projectiles = new ArrayList();

void setup(){
  size(1800, 1000);
  Spaceship1 = new Spaceship(300,400,10);
}

void draw() {
  background(0);
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



 