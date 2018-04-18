class Button{
  float x,y,radius,distance;
  int index;
  boolean isOn;
  Button(float _x,float _y,float _radius,int _index){
    this.x = _x;
    this.y = _y;
    this.radius = _radius;
    this.index = _index;
  }
  void detectClick(){
    this.distance = sqrt(sq(mouseX - this.x) + sq(mouseY - this.y));
    if(this.distance < this.radius/2){
      fill(#ECFF27);
      if(mousePressed == true){
        this.isOn = true;
      }
    }
  }
  void display(){
    fill(#FF4427);
    this.detectClick();
    ellipse(this.x,this.y,this.radius,this.radius);
  }
  
}