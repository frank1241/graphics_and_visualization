class Plankton{
  //initial position
  float  x,y,z;
  PShape plankton;
  PShape plbody;
  PShape plleftarm;
  PShape plrightarm;
  Plankton(int x,int y,int z){
    this.x = x;
    this.y = y;
    this.z = z;
    plbody = loadShape("Plankton.obj");
      plbody.rotateX(PI/2);
      plbody.rotateY(PI/2);
    plleftarm = loadShape("forbiddenarm.obj");
      plleftarm.rotateX(PI/2);
      plleftarm.rotateY(PI/2);
      plleftarm.translate(0,-50,-20);
      plleftarm.rotateX(-PI/4);
    plrightarm = loadShape("forbiddenarm.obj");
      plrightarm.rotateX(PI/2);
      plrightarm.rotateY(PI/2);
      plrightarm.translate(0,-50,20);
      plrightarm.rotateX(PI/4);
  }  
  public void waveLeft(){
    plleftarm.rotateX(.005*cos(.01*globaltimer));
  }
  public void jump(){
    this.y = this.y - 5*cos(globaltimer/100);
  }
  public void display(){
    pushMatrix();
    this.waveLeft();
    this.jump();
    shape(plbody,this.x,this.y,plbody.width,plbody.height);
    shape(plleftarm,this.x,this.y);
    shape(plrightarm,this.x,this.y);
    popMatrix();
  }
  public void jump(int globaltimer){
    this.x += this.x + abs(cos(globaltimer));
  }
}
class Spongebob {
float x, y;
PShape body;
PShape rightLeg;
PShape leftLeg;
PShape leftArm;

Spongebob(float x, float y){
  this.x = x;
  this.y = y;
 
  body = loadShape("spongebody.obj");
  rightLeg = loadShape("spongeleg.obj");
  leftLeg = loadShape("spongeleg.obj");
  leftArm = loadShape("spongearm.obj");
  
  body.scale(5, 5, 5);
  body.rotateZ(4*PI/3);
  body.rotateX(PI/2);
  
  rightLeg.scale(1,1,1);
  rightLeg.rotateZ(4*PI/3);
  rightLeg.rotateX(PI/2);
  rightLeg.translate(0,0,-25);
  
  leftLeg.scale(1,1,1);
  leftLeg.rotateZ(4*PI/3);
  leftLeg.rotateX(PI/2);
  leftLeg.translate(0,0,30);
  
  leftArm.scale(1.3,1.3,1.3);
  leftArm.rotateZ(4*PI/3);
  leftArm.rotateX(-PI/3);
  leftArm.translate(0,0,50);
}

public void move(float vx, float vy){
  this.x += vx;
  this.y += vy;
  }

public void armmoveForward(){
  leftArm.rotateZ(-PI/30);
  }
  


public void armmoveBackward(){
  leftArm.rotateZ(PI/30);
}

public void display() {
  shape(body, x, y, body.width, body.height);
  shape(rightLeg, x+15, y+65, rightLeg.width, rightLeg.height);
  shape(leftLeg, x+40, y+65, leftLeg.width, leftLeg.height);
  shape(leftArm, x+95,y-120, leftArm.width, leftArm.height);
}
}

Spongebob Spongebob1;
float rotation = 0;

int globalTimer;

public void setup(){
  size(1800,1000,P3D);
  Spongebob1 = new Spongebob(1400,800);
  plank1 = new Plankton(width/2,height/2,100);
}

public void draw(){
  globalTimer += 1;
  background(255);
  lights();
  
  Spongebob1.display();
  plank1.display();
  
  if (globalTimer > 0 & globalTimer <= 100){
  Spongebob1.move(-2,0);
  }

  if (globalTimer > 100 & globalTimer <= 130){
    Spongebob1.move(-2,0);
    Spongebob1.armmoveForward();
  }
  
  if (globalTimer > 130 & globalTimer <= 250){
   // Patrick Catches
  }
 
  if (globalTimer > 250 & globalTimer <= 280){
  // Patrick Kicks
  }
  
  
  if (globalTimer > 280 & globalTimer <= 380){
    Spongebob1.move(2,0);
  }
  
   if (globalTimer > 380 & globalTimer < 410){
     Spongebob1.move(2,0);
     Spongebob1.armmoveBackward();
  }
  
  if (globalTimer == 475){
    globalTimer = 0;
  }
}
