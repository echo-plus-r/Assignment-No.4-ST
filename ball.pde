class ball{
  
  // pos is position, vel is velocity, acc is acceleration
  PVector pos, vel, acc;
  
  // active holds if the ball is shot or not
  boolean active;
  
  // siz holds the ball's width and height (it's 20 for both btw)
  float siz;
  
  // roundScore holds how many points were gained in a single turn
  int roundScore;
  
  
  ball(){
    
    // defining variables
    pos = new PVector(190, 480);
    vel = new PVector(3, -5);
    acc = new PVector(0, 0.03);
    siz = 20;
    active = false;
    roundScore = 0;
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
        
        // this is added to try and avoid the ball getting stuck
        pos.y += 5;
      }
      
      // checks bottom wall colisions. removes 1 ammo, sets the ball to innactive and reset's the ball's position if it goes below the map
      if(pos.y > height){
        ammo -= 1;
        active = false; //<>//
        if(roundScore >= 1000){
          ammo += roundScore / 1000;
        }
        roundScore = 0;
        pos.x = 190 - vel.x; // resetting the ball's position
        pos.y = 480 - vel.y;
      }
      // moving the ball forwards
      pos.x += vel.x;
      pos.y += vel.y; 
      
      // acceleration
      vel.x += acc.x;
      vel.y += acc.y;
    }
  }
  
  // check specifically handles all target collisions
  void check(target targ){
    
    // i used this tutorial by happycoding.io to help code the below if statement: https://happycoding.io/tutorials/processing/collision-detection
    // checks target collisions, adds points baised on target type
    if(pos.x + siz + vel.x > targ.pos.x && pos.x + vel.x < targ.pos.x + targ.siz && pos.y + siz > targ.pos.y && pos.y < targ.pos.y + siz && targ.isBroke == false){
      targ.isBroke = true;
      switch(targ.type){
        case(1): // wood target
          score += 50;
          roundScore += 50;
          break;
        case(2): // snake
          score += 100;
          roundScore += 100;
          break;
        case(3): // jellyfish
          score += 200;
          roundScore += 200;
          break;
        case(4): // ufo
          score += 500;
          roundScore += 500;
          break;
        default: // default statement, used to catch errors
          println("something has gone wrong ;w;");
          break;
      }
    }
   // i used this tutorial by happycoding.io to help code the below if statement: https://happycoding.io/tutorials/processing/collision-detection
   // handles the bucket collisons, gives a ball back, makes the ball innactive, and resets the position if the ball colides with the bucket
   if(pos.x + siz > buck.pos.x && pos.x + vel.x < buck.pos.x + buck.size.x && pos.y + siz > buck.pos.y && pos.y < buck.pos.y + siz){
     active = false;
     if(roundScore >= 1000){
          ammo += roundScore / 1000;
     }
     roundScore = 0; // resetting round score
     pos.x = 190; // resetting x position
     pos.y = 480; // resetting y position
   }
  }
}
