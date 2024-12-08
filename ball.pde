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
  void check(target targ){
    
    // i used this tutorial by happycoding.io to help code the following if statement: https://happycoding.io/tutorials/processing/collision-detection
    if(pos.x + siz + vel.x > targ.pos.x && pos.x + vel.x < targ.pos.x + targ.siz && pos.y + siz > targ.pos.y && pos.y < targ.pos.y + siz){
      targ.isBroke = true;
      switch(targ.type){
        case(1):
          score += 50;
          break;
        case(2):
          score += 100;
          break;
        case(3):
          score += 150;
          break;
        case(4):
          score += 500;
          break;
        default:
          println("something has gone wrong ;w;");
          break;
      }
    }
   // i used this tutorial by happycoding.io to help code the following if statement: https://happycoding.io/tutorials/processing/collision-detection
   if(pos.x + siz > buck.pos.x && pos.x + vel.x < buck.pos.x + buck.BuckWidth && pos.y + siz > buck.pos.y && pos.y < targ.pos.y + siz){
     ammo += 1;
     active = false;
     println("POGG");
   }
  }
}
