/*
project: object oriented target game
coder: Simon. T
date: 2024-12-3
notes: hi
*/

bucket buck = new bucket();
PImage BuckSprite;

void setup(){
  size(400, 600);
  BuckSprite = loadImage("bucket-good.png");
  noStroke();
}

void draw(){
  
  // functions as the background
  rect(0, 0, width, height);
  
  buck.show();
  buck.move();
  
}
