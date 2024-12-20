class target{
  
  // type holds the type of target
  // it goes from low to high (1 = wooden target, 5 = U.U.F.O.)
  int type;
  
  // pos holds position of the targets
  PVector pos;
  
  // siz holds the width and height of the targets (they're all just cubes)
  // speed holds how fast the targets will move
  float siz, speed;
  
  // isBroke holds if the target has been hit or not
  boolean isBroke;
  
  target(int TargetType){
    pos = new PVector(0, 0);
    type = TargetType;
    siz = 40;
    speed = 2;
    isBroke = false;
  }
  
  // show displays the target
  void show(){
    switch(type){
      case 1: // wooden target
        image(TargetWood, pos.x, pos.y);
        break;
      case 2: // snake
        
        // displays the upwards snake sprite if the remainder of the frame count devided by 25 then devided by 2 is 1
        if(frameCount / 25 % 2 == 1){
          image(TargetSnakeUp, pos.x, pos.y);
        }
        
        // displaying the downwards snake sprite if the outcome of the above equasion is not 1
        else{
          image(TargetSnakeDown, pos.x, pos.y);
        }
        
        break;
        
        case 3: // jellyfish
          image(TargetJelly, pos.x, pos.y);
          break;
        case 4: // ufo
          image(TargetUfo, pos.x, pos.y);
          break;
        default: // default statement to catch errors
          println("something has gone terribly wrong =w=");
          break;
    }
  }
  
  // move changes the target's position depending on it's type.
  // it also checks if the target is off screen, and resets the target's position if it is.
  void move(){
    switch(type){
      case 1: // wooden target
      if(pos.x < 0 - siz){
          pos.x = 400 + siz;
          isBroke = false;
        }
        pos.x -= speed / 2;
        break;
      case 2: // snake
        if(pos.x > 400 + siz){
          pos.x = siz * -1;
          isBroke = false;
        }
        pos.x += speed;
        break;
        
        case 3: // jellyfish
        if(pos.x < 0 - siz){
          pos.x = 400 + siz;
          isBroke = false;
        }
          pos.x -= speed;
          break;
        case 4: // ufo
          if(pos.x > 400 + siz){
            pos.x = siz * -1;
            isBroke = false;
          }
          pos.x += speed;
          pos.y += sin(frameCount / 5);
          break;
        default: // default statement to catch errors
          println("something has gone terribly wrong (TwT)");
          break;
    }
  }
}
