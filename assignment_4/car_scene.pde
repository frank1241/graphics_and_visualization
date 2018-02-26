class Wheel {
float x, y, r, angle, v;
Wheel(float x, float y, float r, float v) {
  this.x = x;
  this.y = y;
  this.r = r;
  this.angle = 0;
  this.v = v;
}

public void velocity(float v){
  this.v = v;
}

public void move(float v){
  this.x += v;
  this.angle += (v/r*180/PI);
  if (x-this.r > width){
    this.x = -635;
  }
}
public void display() {
  ellipse(x, y, 2.2f * r, 2.2f * r);
  ellipse(x, y, 2*r, 2*r);
  line(x + r*cos(angle*PI/180), y + r*sin(angle*PI/180), x - r*cos(angle*PI/180), y - r*sin(angle*PI/180));
  line(x + r*cos((angle + 45)*PI/180), y + r*sin((angle + 45)*PI/180), x - r*cos((angle + 45)*PI/180), y - r*sin((angle + 45)*PI/180));
  line(x + r*cos((angle + 90)*PI/180), y + r*sin((angle + 90)*PI/180), x - r*cos((angle + 90)*PI/180), y - r*sin((angle + 90)*PI/180));
  line(x + r*cos((angle + 135)*PI/180), y + r*sin((angle + 135)*PI/180), x - r*cos((angle + 135)*PI/180), y - r*sin((angle + 135)*PI/180));
}
}

class CarBody {
float x, y;
int col;
PShape body;

CarBody(float x, float y, int col) {
  this.x = x;
  this.y = y;
  this.col = col;
  body = createShape();
  body.beginShape();
  body.fill(col);
  body.vertex(x,y);
  body.vertex(x, y - 100);
  body.vertex(x + 100, y - 100);
  body.vertex(x + 200, y - 200);
  body.vertex(x + 350, y - 200);
  body.vertex(x + 500, y - 100);
  body.vertex(x + 650, y - 100);
  body.vertex(x + 750, y);
  
  for (int i = 0; i < 180; i++){
  body.vertex(x + 510 + 65 * cos(i*PI/180), y - 65* sin(i*PI/180));
  }
  
  for (int i = 0; i < 180; i++){
  body.vertex(x + 160 + 65 * cos(i*PI/180), y - 65* sin(i*PI/180));
  }
  body.endShape(CLOSE);
}
public void display(){
  shape(body);
}

public void move(float distance){
  this.x += distance;
  this.body.translate(distance, 0);
}
}

class Vehicle{
float x, y, v, a;
int col;
Wheel frontWheel;
Wheel backWheel;
CarBody carBody;

Vehicle(float x, float y, float v , float a, int col) {
  this.x = x;
  this.y = y;
  this.v = v;
  this.a = a;
  this.col = col;
  this.frontWheel = new Wheel(x + 160, y, 55, 0);
  this.backWheel = new Wheel(x + 510, y, 55, 0);
  this.carBody = new CarBody(x, y, col);
}

public void setVelocity (float v){
  this.v = v;
}

public void setAcceleration (float a){
  this.a = a;
}
 
public void accelerate (){
  this.v += this.a;
}

public void resetFrame(){
  if (this.carBody.x > width);
     this.frontWheel = new Wheel(-1000 + 160, this.y, 55, 0);
     this.backWheel = new Wheel(-1000 + 510, this.y, 55, 0);
     this.carBody = new CarBody(-1000, this.y, col);
  
}

public void move(){
   frontWheel.move(this.v + 0.5f * this.a);
   backWheel.move(this.v + 0.5f * this.a);
   this.carBody.move(this.v + 0.5f * this.a);
   if (this.carBody.x > width){
    this.resetFrame();
  }
   
}

public void display(){
  this.frontWheel.display();
  this.backWheel.display();
  this.carBody.display();
}
}

class Stoplight{
  float x,y; 
  PShape light; 
  Stoplight(float x, float y){
    this.x = x;
    this.y = y;
    //stoplight building
    light  = createShape(GROUP);
    fill(0xffE3CF39);
    light.addChild(createShape(RECT,0,0,100,300));
    light.addChild(createShape(ELLIPSE,50,50,50,50));
    light.addChild(createShape(ELLIPSE,50,150,50,50));
    light.addChild(createShape(ELLIPSE,50,250,50,50));
    //pole bottom
    light.addChild(createShape(RECT,35,300,20,250));
   
  }
  public void shake(int globaltimer){
    this.x = this.x + cos(globaltimer/100);
  }
  public void turnRed(){
    fill(0xffFF2C2C); 
    beginShape(GROUP);
    ellipse(this.x+50,this.y+50,50,50);  
  }
  public void turnYellow(){
    fill(0xffFCFC08); 
    ellipse(this.x+50,this.y+150,50,50);
  }
  public void turnGreen(){
    fill(0xff30B22F); 
    ellipse(this.x+50,this.y+250,50,50);
  }
  public void display(int globaltimer){
     this.shake(globaltimer);
     shape(light,this.x,this.y);
     if(globaltimer <500){
      this.turnGreen();
    }
    else if(globaltimer> 500 && globaltimer<800){
      this.turnYellow();
    }
    else if(globaltimer>800){
      this.turnRed();
    }
     
  }
}

int globaltimer;
Vehicle vehicle1;
Vehicle vehicle2;
Stoplight stoplight1;
Stoplight stoplight2;

public void setup(){
  size(1800,1000);
  vehicle1 = new Vehicle(0, 850, 0 , 0, color(203,14,14));
  vehicle2 = new Vehicle(100, 850, 0 , 0, color(31,26,185));
  
  stoplight1 = new Stoplight(300,325);
  stoplight2 = new Stoplight(1400,325);
}

public void draw(){
  background(255);
 
  // Stoplight
  stoplight1.display(globaltimer);
  stoplight2.display(globaltimer);
  

  
  if (globaltimer < 500){
    vehicle1.setAcceleration(0.06f);
    vehicle2.setAcceleration(0.07f);
    
  } else if (globaltimer > 500 && globaltimer<800) {
    vehicle1.setAcceleration(-.08f);
    vehicle2.setAcceleration(-.093f);
  } else if(globaltimer>800){
    vehicle1.setAcceleration(0);
    vehicle2.setAcceleration(0);
    vehicle1.setVelocity(0);
    vehicle2.setVelocity(0);
  }
    println(globaltimer);
    println(vehicle1.v);
    vehicle1.display();
    vehicle1.move();
    vehicle1.accelerate();
  
    vehicle2.display();
    vehicle2.move();
    vehicle2.accelerate();
  
  //create a stop light at 100,100.
  
  //this is my bid for a global timer. Counts 60 frames per second for 5 seconds.
  globaltimer += 1;
  if(globaltimer%1000 == 0){
    globaltimer = 0;
  }
  
  
  
  
}
    
