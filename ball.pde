class ball{
  
  // pos is position, vel is velocity, acc is acceleration
  PVector pos, vel, acc;
  
  // active holds if the ball is shot or not
  boolean active;
  
  // siz holds the ball's width and height (it's 20 for both btw)
  float siz;
  
  
  ball(){
    pos = new PVector(190, 480);
    vel = new PVector(3, -5);
    siz = 20;
    active = false;
  }
  
  void show(){
    image(Ball, pos.x, pos.y);
  }
  void move(){
    if(active == true){
      if(pos.x < 0 || pos.x + siz > width){
        vel.x *= -1;
      }
      if(pos.y < 0){
        vel.y *= -1;
      }
      if(pos.y > height){
        ammo -= 1;
        active = false;
      }
      pos.x += vel.x;
      pos.y += vel.y; //<>//

      // ADD ACCSELERATION HERE LATER
    }
  }
}
