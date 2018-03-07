class Plankton{
  //initial position
  float  x,y,z;
  //where plankton is being thrown from (a) to where he is being caught (b)
  float a,b;

  
  
  Plankton(){
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.a = 0;
    this.b = 100;
    
  }
  
  Plankton(int x,int y,int z,float a,float b){
    this.x = x;
    this.y = y;
    this.z = z;
    this.a = a;
    this.b = b;
    
    
  }
  
  
  public void display(){
    this.jump(degree);
    
    pushMatrix();
    translate(this.x,this.y,this.z);
    shape(plankton);
    popMatrix();
  }
  
  public void jump(int degree){
    this.x = this.x + 50*cos(degree);
  }
  


}