/*
hello, this is the first file of assignment 4
*/

bucket buck = new bucket();
PImage BuckSprite;

void setup(){
  size(400, 600);
  BuckSprite = loadImage("bucket.png");
}

void draw(){
  rect(0, 0, width, height);
  buck.show();
}
