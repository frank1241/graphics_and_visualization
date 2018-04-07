class Spaceship{
  PShape ship;
  float x, y, countProjectiles;
  Spaceship(float x, float y, float countProjectiles){
  this.x = x;
  this.y = y;
  this.countProjectiles = countProjectiles;
  }
  void display(){
  ship = createShape(GROUP);
  fill(color(43,8,160));
  ship.addChild(createShape(TRIANGLE, x, y, x-125, y-50, x-125, y + 50));
  ship.addChild(createShape(RECT, x-140, y - 25, 15, 10));
  ship.addChild(createShape(RECT, x-140, y + 25, 15, 10));
  shape(ship);
  }
  void move(float x, float y){
  this.x += x;
  this.y += y;
  }
  void shoot(){
  if (this.countProjectiles >= 1){
  projectiles.add(new Projectile(this.x, this.y, 10, 30));
  this.countProjectiles -=1;
  }
  }
}