class ball{
  
  // pos is position, vel is velocity, acc is acceleration
  PVector pos, vel, acc;
  
  // active holds if the ball is shot or not
  boolean active;
  
  // siz holds the ball's width and height (it's 20 for both btw)
  float siz;
  
  
  ball(){
    pos = new PVector(180, 480);
    vel = new PVector(3, -1);
    siz = 20;
    
    // CHANGE THIS LATER
    active = true;
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
      pos.x += vel.x;
      pos.y += vel.y; //<>//

      // ADD ACCSELERATION HERE LATER
    }
  }
}
