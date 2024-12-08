class ball{
  
  // pos is position, vel is velocity, acc is acceleration
  PVector pos, vel, acc;
  
  // active holds if the ball is shot or not
  boolean active;
  
  // siz holds the ball's width and height (it's 20 for both btw)
  float siz;
  
  
  ball(){
    
    // defining variables
    pos = new PVector(190, 480);
    vel = new PVector(3, -5);
    siz = 20;
    active = false;
  }
  
  // displays the image at the appropriate location
  void show(){
    image(Ball, pos.x, pos.y);
  }
  
  // the movement function, also handles wall colisions
  void move(){
    
    if(active == true){
      // checks left and right wall colisions, reflects x velosity if it colides
      if(pos.x < 0 || pos.x + siz > width){
        vel.x *= -1;
      }
      
      // checks top wall colisions, reflects y velosity if it colides
      if(pos.y < 0){
        vel.y *= -1;
      }
      
      // checks bottom wall colisions. removes 1 ammo, sets the ball to innactive and reset's the ball's position if it goes below the map
      if(pos.y > height){
        ammo -= 1;
        active = false;
        pos.x = 190 - vel.x;
        pos.y = 480 - vel.y;
      }
      
      // moving the ball forwards
      pos.x += vel.x;
      pos.y += vel.y; //<>//

      // ADD ACCSELERATION HERE LATER
    }
  }
  
  // check specifically handles all target collisions
  void check(target targ){
    
    // i used this tutorial by happycoding.io to help code the below if statement: https://happycoding.io/tutorials/processing/collision-detection
    // checks target collisions, adds points baised on target type
    if(pos.x + siz + vel.x > targ.pos.x && pos.x + vel.x < targ.pos.x + targ.siz && pos.y + siz > targ.pos.y && pos.y < targ.pos.y + siz){
      targ.isBroke = true;
      switch(targ.type){
        case(1): // wood target
          score += 50;
          break;
        case(2): // snake
          score += 100;
          break;
        case(3): // jellyfish
          score += 150;
          break;
        case(4): // ufo
          score += 500;
          break;
        default: // default statement, used to catch errors
          println("something has gone wrong ;w;");
          break;
      }
    }
   // i used this tutorial by happycoding.io to help code the below if statement: https://happycoding.io/tutorials/processing/collision-detection
   // handles the bucket collisons, gives a ball back, makes the ball innactive, and resets the position if the ball colides with the bucket
   if(pos.x + siz > buck.pos.x && pos.x + vel.x < buck.pos.x + buck.BuckWidth && pos.y + siz > buck.pos.y && pos.y < targ.pos.y + siz){
     ammo += 1;
     active = false;
     pos.x = 190;
     pos.y = 480;
   }
  }
}
