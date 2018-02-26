// class flares {

// }

class Sun_moon {
float x,y,m;
PShape skyobject;
Sun_moon(float x, float y, float m){
  // Creating Moon and Sun
  this.x = x;
  this.y = y;
  this.m = m;

  skyobject = createShape(GROUP);
  // Moon and Sun Colors
  if (m != 0){
    noStroke();
    fill(123);
  }
  else{
    noStroke();
    fill(0xffE3CF39);
  }
  //
  skyobject.addChild(createShape(ELLIPSE,50,150,150,150));

  if (m != 0){
    fill(73);
    noStroke();
    skyobject.addChild(createShape(ELLIPSE,90,150,30,40));
    skyobject.addChild(createShape(ELLIPSE,30,180,30,10));
    skyobject.addChild(createShape(ELLIPSE,47,100,30,30));
  }
  }

  public void moveit(int sun_moon_timer){
    float smt = sun_moon_timer/60;
    if (m != 0){
      if (smt == 5 ){
        this.x = 50;
        this.y = 50;
      }
      else if (smt > 5 && smt <= 7 ){
        this.x = this.x + 1*(smt);
        this.y = this.y - .8*(smt/5);
      }
      else if ( smt > 7 && smt <= 9 ){
        this.x = this.x + .8*(smt);
        this.y = this.y + .6*(smt/5);
      }
      else{
        this.x = 1050;
        this.y = 1050;
      }
    }
    else{
      if (smt == 0 ){
        this.x = 50;
        this.y = 50;
      }
      else if (smt <= 2 ){
        this.x = this.x + 4*(smt);
        this.y = this.y - 3*(smt/5);
      }
      else if ( smt > 2 && smt <= 4 ){
        this.x = this.x + 2*smt;
        this.y = this.y + 1.5*(smt/5);
      }
      else{
        this.x = 1050;
        this.y = 1050;
      }
    }

    //this.y = this.y + cos(globaltimer/100);
  }
  public void display(int globaltimer){
    this.moveit(globaltimer);
    shape(skyobject,this.x,this.y);
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
int sun_moon_timer;
Stoplight stoplight1;
Stoplight stoplight2;
Sun_moon sun1;
Sun_moon moon1;

public void setup(){
  size(1800,1000);
  //vehicle1 = new Vehicle(0, 850, 0 , 0, color(203,14,14));
  //vehicle2 = new Vehicle(100, 850, 0 , 0, color(31,26,185));

  stoplight1 = new Stoplight(300,325);
  stoplight2 = new Stoplight(1400,325);

  sun1 = new Sun_moon(50,50,0);
  moon1 = new Sun_moon(50,50,1);

}

public void draw(){

  // Background color change
  //background((sun_moon_timer/255) - (120/255));
  if ((sun_moon_timer/60) <= 4){
    background(255);
  }
  else if ((sun_moon_timer/60) > 5 && (sun_moon_timer/60) <= 9){
    background(0);
  }
  else{
    background(150);
  }

  // Sun & Moon
  sun1.display(sun_moon_timer);
  moon1.display(sun_moon_timer);

  // Stoplight
  stoplight1.display(globaltimer);
  stoplight2.display(globaltimer);


  //create a stop light at 100,100.

  //this is my bid for a global timer. Counts 60 frames per second for 5 seconds.
  globaltimer += 1;
  if(globaltimer%1000 == 0){
    globaltimer = 0;
  }

  sun_moon_timer += 1;
  if(sun_moon_timer%600 == 0){
    sun_moon_timer = 0;
  }



}
