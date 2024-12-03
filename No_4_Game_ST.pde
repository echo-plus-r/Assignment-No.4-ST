/*
hello, this is the first file of assignment 4
*/

bucket buck = new bucket();
PImage BuckSprite;

void setup(){
  size(400, 600);
  BuckSprite = loadImage("bucket-good.png");
}

void draw(){
  
  // functions as the background
  rect(-1, -1, width, height);
  
  buck.show();
  buck.move();
  
}
