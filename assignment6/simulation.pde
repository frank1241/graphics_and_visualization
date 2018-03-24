class FishingPole {
  //location of pole
  float x, y, initx, inity, vy, ay;
  //this was adapted from the lecture notes
  //i rewrote the variable names to match what i'm doing
  //mass of the bobber
  float bobmass = 1.0;
  float equilibrium = 850;
  //i'm assuming water has a spring constant, it doesn't but I'm assuming
  float ks = 0.05;
  //and water has a pretty strong dampening force
  float kd = 0.1;
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
    if(globaltimer%100 == 0){
      this.y = this.inity;
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
  group.rotate(0.48);
  shape(group);
  }
  
  void move(int time){
    float deltax;
    float deltay;
    deltax = vx * time + 0.5 * ax * time * time;
    deltay = vy * time + 0.5 * ay * time * time;
    
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
int globaltimer;
void setup(){
  size(1800, 1000);
  water1 = new Water(400, 1450, 750, 35, 0.1);
  ramp1 = new Ramp(0, 400, 500, 720);
  fish1 = new Fish(225,445);
  fp1 = new FishingPole(1350,435); 
}

void draw() {
  background(255);
  rectMode(CORNERS);
  fill(color(134,117,31));
  rect(1450, 1000, 1800, 575);
  fish1.display();
  ramp1.display();
  water1.display();
  water1.moveWater();
  fp1.display();
  globaltimer++;
}

  
