/*
project: object oriented target game
coder: Simon. T
date: 2024-12-3
notes: hello
*/

bucket buck = new bucket();
target targ = new target(1);
PImage BuckSprite;
PImage TargetWood;

void setup(){
  size(400, 600);
  BuckSprite = loadImage("bucket-good.png");
  TargetWood = loadImage("Target-Wood-Big.png");
  noStroke();
}

void draw(){
  
  // functions as the background
  rect(0, 0, width, height);
  
  buck.move();
  buck.show();  
  targ.show();
}
