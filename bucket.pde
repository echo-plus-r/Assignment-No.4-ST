class bucket{

  // i'll likely have to add hitboxes to this calculation
  PVector pos;
  boolean moveLeft;
  
  
  bucket(){
    pos = new PVector(0, 550);
    moveLeft = false;
  }
  
  void show(){
    image(BuckSprite, pos.x, pos.y);
  }
  
  void move(){
    if(moveLeft){
      pos.x -= 1;
    }
    else{
      pos.x += 1;
    }
    if(pos.x > 375){
      moveLeft = true;
    }
    if(pos.x < 0){
      moveLeft = false;
    }
  }
  
}
