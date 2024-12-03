class bucket{

  // pos holds the bucket's x and y position
  PVector pos;
  
  // Buck Width holds the width of the bucket, which is 25. this is a variable for collision calculatioins that will be added later
  float BuckWidth;
  
  // moveLeft holds if the bucket should move left or right (true is left, false is right)
  boolean moveLeft;
  
  // bucket constructor
  bucket(){
    pos = new PVector(0, 550);
    BuckWidth = 25;
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
    if(pos.x > width - BuckWidth){
      moveLeft = true;
    }
    if(pos.x < 0){
      moveLeft = false;
    }
  }
  
}
