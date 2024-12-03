class bucket{

  // i'll likely have to add hitboxes to this calculation
  PVector position;
  boolean moveLeft;
  
  
  bucket(){
    position = new PVector(0, 500);
    moveLeft = false;
    
    //BuckSprite = loadImage("bucket.png");
  }
  
  void show(){
    image(BuckSprite, position.x, position.y);
  }
  
}
