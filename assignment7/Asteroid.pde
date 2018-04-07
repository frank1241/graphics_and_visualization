class Asteroid{
  float initx,inity,x,y;
  float velx;
  float radius;
  boolean isCollided=false;
  Asteroid(float x,float y,float velx,float radius){
    this.initx = x;
    this.inity = y;
    this.x = x;
    this.y = y;
    this.velx = velx;
    this.radius = radius;
  }
  
  void detectShipCollision(Spaceship other){
    float distance = sqrt(sq(other.x-62.5-this.x) + sq(other.y-this.y));
    if(distance < (this.radius/2+ 62.5)){
      this.isCollided = true;
      this.radius = 0;
      this.y = -200;
      other.lives -= 1;
     
    }
  }
  void detectBulletCollision(Projectile other){
    float distance = sqrt(sq(other.x-this.x) + sq(other.y-this.y));
    if(distance < (this.radius/2 + other.r/2)){
      this.isCollided = true;
      gameScore+= this.radius;
      this.radius = 0;
      //other.r = 0;
      this.y = -200;
    }    
  }

  void move(){
    this.x = this.x + this.velx;
    if(this.x <= 0){
      this.x = this.initx;
    }
  }
  void display(){
    for(Projectile other: projectiles){
      this.detectBulletCollision(other);
    }
    this.detectShipCollision(Spaceship1);
    
    fill(255);
    ellipse(this.x,this.y,this.radius,this.radius);
    this.move();
  }
}