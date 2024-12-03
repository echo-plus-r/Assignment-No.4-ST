class bucket{

  // i'll likely have to add hitboxes to this calculation
  PVector position;
  boolean moveLeft;
  PImage BuckSprite;
  
  bucket(){
    position = new PVector(0, 590);
    moveLeft = false;
    
    BuckSprite = loadImage("bucket.png");
  }
  
  void show(){
    image(BuckSprite, position.x, position.y);
  }
  
}
