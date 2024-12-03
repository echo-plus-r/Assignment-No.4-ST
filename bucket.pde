class bucket{

  // i'll likely have to add hitboxes to this calculation
  PVector position;
  boolean moveLeft;
  
  bucket(){
    position = new PVector(0, 590);
    moveLeft = false;
  }
  
  void show(){
    rect(position.x, position.y, 10, 10);
  }
  
}
