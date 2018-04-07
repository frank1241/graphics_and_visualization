class Projectile{
  PShape projectile;
  float x, y, v, r;
  Projectile(float x, float y, float v, float r){
  this.x = x;
  this.y = y;
  this.v = v;
  this.r = r;
  }
  void display(){
  fill(color(173,17,5));
  projectile = createShape(ELLIPSE, x, y, r, r);
  shape(projectile);
  this.move();
  }
  void move(){
  this.x += v;
  }
}