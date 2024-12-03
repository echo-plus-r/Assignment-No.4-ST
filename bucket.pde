class bucket{

  // i'll likely have to add hitboxes to this calculation
  PVector pos;
  boolean moveLeft;
  
  
  bucket(){
    pos = new PVector(0, 500);
    moveLeft = false;
    
    //BuckSprite = loadImage("bucket.png");
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
    if(pos.x > 400){
      moveLeft = true;
    }
    if(pos.x < 0){
      moveLeft = false;
    }
  }
  
}
