class FishingPole {
  //location of pole
  float x, y, initx, inity, vy, ay;
  //this was adapted from the lecture notes
  //i rewrote the variable names to match what i'm doing
  //mass of the bobber
  float bobmass = 5.0;
  float equilibrium = 850;
  //i'm assuming water has a spring constant, it doesn't but I'm assuming
  float ks = 0.02;
  //and water has a pretty strong dampening force
  float kd = 0.08;
  float buoyantforce, gravity, pull;
  FishingPole(float x, float y) {
    this.x = x;
    this.y = y;
    this.initx = x;
    this.inity = y;
  }
  void applyForces() {
    //gravity
    this.gravity = -.05;
    //buoyant force
    this.buoyantforce = -((ks * (this.y - equilibrium)) + kd*vy);
    //calculating the net acceleration
    this.ay = this.buoyantforce/(this.bobmass); //Force/Mass = acceleration
    this.ay += this.gravity; 
    //add it to my vy
    this.vy = this.vy + this.ay;
    this.y += this.vy;
  }
  void display() {
    //pole
    pushMatrix();
    fill(#FF5E36);
    translate(this.initx, this.inity);
    rotate(-PI/4);
    rect(0, 0, 12, 300);
    popMatrix();
    this.applyForces();
    //bobber
    pushMatrix();
    ellipseMode(RADIUS);
    line(this.initx, this.inity, this.x, this.y);
    ellipse(this.x, this.y, 25, 25);
    noFill();
    translate(0,25);
    bezier(this.x,this.y,this.x+5,this.y+5,this.x-15,this.y+45,this.x-30,this.y+25);
    popMatrix();
    fill(color(164,182,183));
    if(globalTimer%400 == 0){
      this.y = this.inity;
      this.vy = 0;
      this.ay = 0;
    }
  }
}
class Fish{
  PShape group;
  PShape tail;
  PShape body;
  PShape eye;
  int x, y;
  float vx, vy, ax, ay;

  Fish(int x, int y, float vx, float vy, float ax, float ay){
  this.x = x;
  this.y = y;
  this.vx = vx;
  this.vy = vy;
  this.ax = ax;
  this.ay = ay;
  }
  
  void display(){
  group = createShape(GROUP);
  tail = createShape(TRIANGLE, x, y , x, y - 50, x + 50, y-25);
  tail.setFill(color(164,182,183));
  ellipseMode(CENTER);
  body = createShape(ELLIPSE, x+100, y-25, 100, 50);
  body.setFill(color(164,182,183));
  eye = createShape(ELLIPSE, x + 125, y - 25, 10, 10);
  eye.setFill(color(40,61,62));
  group.addChild(tail);
  group.addChild(body);
  group.addChild(eye);
  group.rotate(0.49);
  shape(group);
  }
  
  void move(){
    float a;
    float deltax;
    float deltay;
    float time;
    float forceWater;
    float mass;
    float vy1=0;
    time = 0.4;
    
    if (this.x <= 750){
    a = 9.8 * (sin(28.81*PI/180) - 0.50 * cos(28.81*PI/180));
    this.ax = a * cos(28.81 * PI/180);
    this.ay = a * sin(28.81 * PI/180);
    
    deltax = this.vx * time + 0.5 * this.ax * time * time;
    deltay = this.vy * time + 0.5 * this.ay * time * time;
    
    this.vx += this.ax * time;
    vy1 += this.ay * time; 
    this.vy = this.ay * time;
 
    this.x += deltax;
    this.y += deltay;    
    } else if (750 < this.x & this.x <= 1550){
    forceWater = 0.20;
    mass = 1;
    this.ax = -forceWater/ mass;
    deltax = this.vx * time + 0.5 * this.ax * time * time;
    this.vx += this.ax * time;
    this.x += deltax;
   
    // account for the bouyant force and gravity
    this.ay = -(1.0 * 2.5 * 9.8 - mass * 9.8)/mass;
    deltay = vy1 * time + 0.5 * this.ay * time * time;
    this.y += deltay;  
    vy1 = this.ay * time;
    
    } else {
    this.x = 255;
    this.y = 445;
    this.vx = 0;
    this.vy = 0;
    this.ax = 0;
    this.ay = 0;
    }
  }
}

class Water{
  PShape water;
  int start, end;
  float depth, amplitude, phaseShift, x, y;
  
  Water(int start, int end, float depth, float amplitude, float phaseShift){
      this.start = start;
      this.end = end;
      this.depth = depth;
      this.amplitude = amplitude;
      this.phaseShift = phaseShift;
  }
  
  void display(){
    water = createShape();
    water.beginShape();
    water.fill(color(37,155,216)); 
    for(int i = start; i <= end; i+=10){
      x = i;
      y = amplitude * sin(x * PI / 180 + phaseShift) + depth;
      water.vertex(x, y);
      }
      water.vertex(end, 1000);
      water.vertex(start, 1000);
      water.endShape();
      shape(water);
  }
  void moveWater(){
      this.phaseShift += 0.04;
  }
}

class Ramp{
  PShape ramp; 
  int start, end, rampheight1, rampheight2;
  Ramp(int start, int end, int rampheight, int rampheight2){
  ramp = createShape();
  ramp.beginShape();
  ramp.fill(color(134,117,31));
  ramp.vertex(start, 1000);
  ramp.vertex(start, rampheight);
  ramp.vertex(end, rampheight2);
  ramp.vertex(end,1000);
  ramp.endShape(CLOSE);
  }
  void display(){
    shape(ramp);
  }
}

Water water1;
Ramp ramp1;
Fish fish1;
FishingPole fp1;
int globalTimer;
ArrayList<Fish> fish = new ArrayList();

void setup(){
  size(1800, 1000);
  water1 = new Water(400, 1450, 750, 35, 0.1);
  ramp1 = new Ramp(0, 400, 500, 720);
  fish.add(new Fish(225,445,0,0,0,0));
  fp1 = new FishingPole(1350,435);
}

void draw() {
  println(globalTimer);
  globalTimer += 1;
  if (globalTimer%50 == 0 & globalTimer <= 150){
    fish.add(new Fish(225,445,0,0,0,0));
  }
 
  background(255);
  rectMode(CORNERS);
  fill(color(134,117,31));
  rect(1450, 1000, 1800, 575);

  ramp1.display();
  water1.display();
  water1.moveWater();
  for (Fish f: fish){
  f.move();
  f.display();
  }
  fp1.display();
}

 void mousePressed() {
   fish.add(new Fish(225,445,0,0,0,0));
  }
