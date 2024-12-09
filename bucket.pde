class bucket{

  // pos holds the bucket's x and y position
  // size holds the dimentions of the bucket (60, 40)
  PVector pos, size;
  
  // speed holds how far the bucket will move each frame
  float speed;
  
  // moveLeft holds if the bucket should move left or right (true is left, false is right)
  boolean moveLeft;
  
  // bucket constructor
  bucket(){
    
    // defining variables
    pos = new PVector(0, 550);
    size = new PVector(60, 40);
    moveLeft = false;
    speed = 1;
  }
  
  // displaying the bucket sprite
  void show(){
    image(BuckSprite, pos.x, pos.y);
  }
  
  // moving the bucket
  void move(){
    
    // moving left if moveLeft is true
    if(moveLeft){
      pos.x -= speed;
    }
    // moving right if moveLeft is false
    else{
      pos.x += speed;
    }
    
    // checking if the bucket has hit the right edge of the screen
    if(pos.x > width - size.x){
      moveLeft = true; // switching to moving the bucket left
    }
    
    // checking if the bucket has hit the left edge of the screen
    if(pos.x < 0){
      moveLeft = false; // switching to moving the bucket right
    }
  }
  
}
