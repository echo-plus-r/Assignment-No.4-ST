class target{
  
  // type holds the type of target
  // it goes from low to high (1 = wooden target, 5 = U.U.F.O.)
  int type;
  
  // pos holds position of the targets
  PVector pos;
  
  // siz holds the width and height of the targets (they're all just cubes)
  float siz;
  
  target(){}
  
  // show displays the target
  void show(){}
  
  // move changes the target's position depending on it's type.
  // it also checks if the target is off screen, and resets the target's position if it is.
  void move(){}
}