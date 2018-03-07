int x;
int y;
int z;
int degree;
PShape plankton;

Plankton plank1;

void setup(){
  size(1000,1000,P3D);
  
  plankton = createShape(GROUP);
  //body
    PShape body = loadShape("Plankton.obj");
    body.rotateX(PI/2);
    body.rotateY(PI/2);
    body.rotateZ(45*(PI/180));
    plankton.addChild(body);
    
    //right Arm of the forbidden one
    PShape rightarm = createShape();
    plankton.addChild(rightarm);
    
    //left Arm of the forbidden one
    PShape leftarm = createShape(s);
    plankton.addChild(leftarm);
  plank1 = new Plankton(width/2,height/2,50,10,10);

}
void draw(){
  //technical stuff
  background(255);
  moveCamera();
  
  plank1.display();
  
}


void moveCamera(){
  if(keyPressed == true){
    if(key == 'd'){
      z+=10;
    }
    if(key == 'a'){
      z-=10;
    }
    if(key == 's'){
      x -=10;
    }
    if(key == 'w'){
      x+=10;
    }
    if(key == 'q'){
      y+=10;
    }
    if(key == 'e'){
      y-=10;
    }
  }
  
  beginCamera();
  camera(x,y,z,
         (width/2)+x,(height/2)+y,10+z,
         0,1,0);
  endCamera();

  degree+=10;

}