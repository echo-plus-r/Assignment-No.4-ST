/*
project: object oriented target game
coder: Simon. T
date: 2024-12-3
notes: hello
*/

bucket buck = new bucket();
target[] targ = new target[13];
PImage BuckSprite;
PImage TargetWood, TargetSnakeUp, TargetSnakeDown, TargetJelly, TargetUfo;

void setup(){
  size(400, 600);
  
  //// loading images ////
  BuckSprite = loadImage("bucket-good.png");
  TargetWood = loadImage("Target-Wood-Big.png");
  TargetSnakeUp = loadImage("Target-Snake-Up.png");
  TargetSnakeDown = loadImage("Target-Snake-Down.png");
  TargetJelly = loadImage("Target-Jelly.png");
  TargetUfo = loadImage("Target-Ufo.png");
  
  // defining the wooden targets and setting their position
  for(int i = 0; i < 5; i ++){
    targ[i] = new target(1);
    targ[i].pos.x += 20 + (80 * i); // setting x position
    targ[i].pos.y = 200;
  }
  
  // defining the sky snakes and setting their position
  for(int i = 5; i < 9; i++){
    targ[i] = new target(2);
    targ[i].pos.x += (120 * (i - 5));
    targ[i].pos.y = 140;
  }
  
  // defining the spase jellyfish and setting their position
  for(int i = 9; i < 12; i++){
    targ[i] = new target(3);
    targ[i].pos.x += (160 * (i - 9)); // setting x position
    targ[i].pos.y = 80;
  }
  
  // defining the ufo and setting it's position
  targ[12] = new target(4);
  targ[12].pos.x += 160;
  targ[12].pos.y = 20;
  
  noStroke();
}

void draw(){
  
  // functions as the background
  rect(0, 0, width, height);
  
  buck.move();
  buck.show(); 
  
  for(target i : targ){
    i.move();
  }
  
  for(target i : targ){
    i.show();
  }
  //targ.show();
}
