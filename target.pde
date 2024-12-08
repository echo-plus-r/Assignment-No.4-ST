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
      case 1:
        image(TargetWood, pos.x, pos.y);
        break;
      case 2:
        if(frameCount / 25 % 2 == 1){
          image(TargetSnakeUp, pos.x, pos.y);
        }
        else{
          image(TargetSnakeDown, pos.x, pos.y);
        }
        
        break;
        
        case 3:
          image(TargetJelly, pos.x, pos.y);
          break;
        case 4:
          image(TargetUfo, pos.x, pos.y);
          break;
        default:
          println("something has gone terribly wrong =w=");
          break;
    }
  }
  
  // move changes the target's position depending on it's type.
  // it also checks if the target is off screen, and resets the target's position if it is.
  void move(){
    switch(type){
      case 1:
      if(pos.x < 0 - siz){
          pos.x = 400 + siz;
          isBroke = false;
        }
        pos.x -= speed / 2;
        break;
      case 2:
        if(pos.x > 400 + siz){
          pos.x = siz * -1;
          isBroke = false;
        }
        pos.x += speed;
        break;
        
        case 3:
        if(pos.x < 0 - siz){
          pos.x = 400 + siz;
          isBroke = false;
        }
          pos.x -= speed;
          break;
        case 4:
          if(pos.x > 400 + siz){
            pos.x = siz * -1;
            isBroke = false;
          }
          pos.x += speed;
          pos.y += sin(frameCount / 5);
          break;
        default:
          println("something has gone terribly wrong (TwT)");
          break;
    }
  }
}
