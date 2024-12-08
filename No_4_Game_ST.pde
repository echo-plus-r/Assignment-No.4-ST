/*
project: object oriented target game
coder: Simon. T
date: 2024-12-3
notes: hello!
*/

bucket buck = new bucket();
ball orb = new ball();
target[] targ = new target[13];
PImage Ball;
PImage BuckSprite;
PImage AmmoSprite;
PImage TargetWood, TargetSnakeUp, TargetSnakeDown, TargetJelly, TargetUfo;
int ammo, score;
boolean GameOver;

void setup(){
  size(400, 600);
  
  //// loading images ////
  Ball = loadImage("Ball.png");
  BuckSprite = loadImage("bucket-good.png");
  AmmoSprite = loadImage("ammo-count.png");
  TargetWood = loadImage("Target-Wood-Big.png");
  TargetSnakeUp = loadImage("Target-Snake-Up.png");
  TargetSnakeDown = loadImage("Target-Snake-Down.png");
  TargetJelly = loadImage("Target-Jelly.png");
  TargetUfo = loadImage("Target-Ufo.png");
  
  // defining the wooden targets and setting their position
  for(int i = 0; i < 5; i ++){
    targ[i] = new target(1);
    targ[i].pos.x += (100 * i); // setting x position
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
  
  // setting default ammo amount
  ammo = 10;
  GameOver = true;
  
  textSize(25);
  
  noStroke();
}

void draw(){
  
  // functions as the background
  rect(0, 0, width, height);
  
  orb.move();
  buck.move();
  
  for(target i : targ){
    i.move();
  }
  
  for(target i : targ){
    orb.check(i);
    // checks that the target is not broken before displaying it
    if(i.isBroke == false){
      i.show();
    }
    
  }
  
  // displaying the ammo count background
  image(AmmoSprite, 0, 460);
  fill(0);
  text(ammo, 10, 500);
  fill(255);
  
  orb.show();
  buck.show(); 
  
  // shows where the ball will go
  stroke(0);
  line(map(mouseX, 0, width, 190, 210), map(constrain(mouseY, 0, 479), 0, height, 470, 490), 200, 490);
  noStroke();
}

// needs more work
void mousePressed(){
  if(orb.active == false && ammo > 0){
    
    // both of these should be moved to happening after the active variable for the ball is set to false.
    orb.pos.x = 190; // resetting x position
    orb.pos.y = 480; // resetting y position
    
    orb.vel.x = map(mouseX, 0, width, -5, 5); // calculating x velocity based on mouse position
    
    orb.vel.y = map(constrain(mouseY, 0, 479), 0, height, -10, -1); // calculating y velocity based on mouse position
    
    orb.active = true;
  }
}

// needs more work/remove later
void keyPressed(){
  
  // remove later... maybe
  if(key == '}'){
    ammo += 1000000;
  }
}
