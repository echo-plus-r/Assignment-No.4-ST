/*
project: object oriented target game
coder: Simon. T
date: 2024-12-3
notes: hello
*/

bucket buck = new bucket();
target[] targ = new target[9];
PImage BuckSprite;
PImage TargetWood, TargetSnakeUp, TargetSnakeDown;

void setup(){
  size(400, 600);
  BuckSprite = loadImage("bucket-good.png");
  TargetWood = loadImage("Target-Wood-Big.png");
  TargetSnakeUp = loadImage("Target-Snake-Up.png");
  TargetSnakeDown = loadImage("Target-Snake-Down.png");
  
  // defining the wooden targets and setting their position
  for(int i = 0; i < 5; i ++){
    targ[i] = new target(1);
    targ[i].pos.x += 20 + (80 * i); // setting x position
    targ[i].pos.y = 200;
  }
  
  // defining the sky snakes and setting their position
  for(int i = 5; i < 9; i++){
    targ[i] = new target(2);
    targ[i].pos.x += 20 + (100 * (i - 5));
    targ[i].pos.y = 140;
  }
  
  noStroke();
}

void draw(){
  
  // functions as the background
  rect(0, 0, width, height);
  
  buck.move();
  buck.show(); 
  for(target i : targ){
    i.show();
  }
  //targ.show();
}
