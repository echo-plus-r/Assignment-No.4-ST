/*
project: object oriented target game
coder: Simon. T
date: 2024-12-3
notes: welcome to assignment 4! pro tip, press shift plus '.' for something interesting
*/


// defining objects
bucket buck = new bucket();
ball orb = new ball();
target[] targ = new target[13];

// defining images
PImage Ball;
PImage BuckSprite; // used for bucket
PImage AmmoSprite; // used for the ammo count background
PImage ScoreSprite; // used for score background
PImage title;
PImage win, lose;
PImage TargetWood, TargetSnakeUp, TargetSnakeDown, TargetJelly, TargetUfo; // used for the targets

// ammo holds the amount of ammo the player has
// score holds the player's score
// cheatmulti is short for cheat multiplyer and is used for when players press ">"
int ammo, score, cheatmulti;

// GameOver holds if the game is over or not
boolean GameOver;

// setup
void setup(){
  
  // defining size
  size(400, 600);
  
  //// loading images ////
  Ball = loadImage("Ball.png");
  BuckSprite = loadImage("big-bucket.png");
  AmmoSprite = loadImage("ammo-count.png");
  ScoreSprite = loadImage("score-count-better.png");
  title = loadImage("title screen.png");
  win = loadImage("victory.png");
  lose = loadImage("game-over.png");
  TargetWood = loadImage("Target-Wood-Big.png");
  TargetSnakeUp = loadImage("Target-Snake-Up.png");
  TargetSnakeDown = loadImage("Target-Snake-Down.png");
  TargetJelly = loadImage("Target-Jelly.png");
  TargetUfo = loadImage("Target-Ufo.png");
  
  // defining the wooden targets and setting their position
  for(int i = 0; i < 5; i ++){
    targ[i] = new target(1);
    targ[i].pos.x += (100 * i); // setting x position
    targ[i].pos.y = 280;
  }
  
  // defining the sky snakes and setting their position
  for(int i = 5; i < 9; i++){
    targ[i] = new target(2);
    targ[i].pos.x += (120 * (i - 5));
    targ[i].pos.y = 180;
  }
  
  // defining the spase jellyfish and setting their position
  for(int i = 9; i < 12; i++){
    targ[i] = new target(3);
    targ[i].pos.x += (160 * (i - 9)); // setting x position
    targ[i].pos.y = 100;
  }
  
  // defining the ufo and setting it's position
  targ[12] = new target(4);
  targ[12].pos.x += 160;
  targ[12].pos.y = 20;
  
  // setting the game as over
  GameOver = true;
  
  // setting the cheat multiplyer
  cheatmulti = 100;
  
  // removing stroke
  noStroke();
}

// draw
void draw(){
  
  // if statement for if the game is over
  if(GameOver == true){
    image(title, 0, 0);
    if(score > 10000){
      image(win, 0, 0);
    }
    else if(score > 0 && score <= 10000){
      image(lose, 0, 0);
    }
  }
  
  // else statement for if the game is not over
  else{
    
    // checking if the game is over
    // the game is over if no ball is active and ammo is 0
    if(orb.active == false && ammo == 0){
      GameOver = true;
    }
    
    // setting background colour
    fill(175, 169, 212);
    // functions as the background
    rect(0, 0, width, height);
    
    // moving the ball
    orb.move();
    
    // moving the bucket
    buck.move();
    
    // moving all the targets
    for(target i : targ){
      i.move();
    }
    
    // checks colisions for every target and the ball, also displays every ball if it's not broken
    for(target i : targ){
      // checking the colisions between a target and the ball
      orb.check(i);
      // checks that the target is not broken before displaying it
      if(i.isBroke == false){
        i.show();
      }
      
    }
    
    // displaying the ammo count background
    image(AmmoSprite, 0, 460);
    textSize(25); // setting the text size
    fill(0); // setting the text colour
    text(ammo, 10, 500); // displaying the text
    
    // displaying the score background
    image(ScoreSprite, 300, 460);
    textSize(15); // setting the text size
    text(score + "\n" + orb.roundScore, 305, 485); // displaying the text
    fill(255); // i don't know if this actually does anything, but i'm too scared to remove it :(
    
    // displaying the ball
    orb.show();
    
    // display the bucket
    buck.show(); 
    
    // shows where the ball will go
    stroke(0); // setting the stroke colour
    // drawing the line
    line(map(mouseX, 0, width, 190, 210), map(constrain(mouseY, 0, 479), 0, height, 470, 490), 200, 490);
    noStroke(); // removing the stroke
  }
}

// mouse pressed, controlls where the ball is shot
void mousePressed(){
  
  // checking if the ball can be fired
  if(orb.active == false && ammo > 0 && GameOver == false){

    orb.pos.x = 190; // resetting x position
    orb.pos.y = 480; // resetting y position
    
    orb.vel.x = map(mouseX, 0, width, -5, 5); // calculating x velocity based on mouse position
    
    orb.vel.y = map(constrain(mouseY, 0, 479), 0, height, -10, -1); // calculating y velocity based on mouse position
    
    // setting the ball to active
    orb.active = true;
  }
  
  // starting the game if it is over and the user clicks
  if(GameOver == true){
    GameOver = false; // setting the game to not over
    ammo = 20; // resetting ammo
    score = 0; // resetting score
  }
}

// this is used to start the game and for weird cheats
void keyPressed(){
  
  // starts the game if it's over
  if(GameOver == true){
    GameOver = false; // setting the game to not over
    ammo = 20; // resetting ammo
    score = 0; // resetting score
  }
  
  // cheat that grants 1,000,000 ammo
  if(key == '}'){
    ammo += 1000000;
  }
  
  // cheat that multiplies a random user defined variable by what the cheat multiplyer is set as (1000 normally)
  if(key == '>'){
    switch(round(random(21))){
      case(1):
        ammo *= cheatmulti;
        println("ammo times " + cheatmulti);
        break;
      case(2):
        score *= cheatmulti;
        println("score times " + cheatmulti);
        break;
      case(3):
        orb.pos.x *= cheatmulti;
        println("ball x position times " + cheatmulti);
        break;
      case(4):
        orb.pos.y *= cheatmulti;
        println("ball y position times " + cheatmulti);
        break;
      case(5):
        orb.vel.x *= cheatmulti;
        println("ball x velocity times " + cheatmulti);
        break;
      case(6):
        orb.vel.y *= cheatmulti;
        println("ball y velocity times " + cheatmulti);
        break;
      case(7):
        orb.acc.x *= cheatmulti;
        println("ball x acceleration times " + cheatmulti);
        break;
      case(8):
        orb.acc.y *= cheatmulti;
        println("ball y acceleration times " + cheatmulti);
        break;
      case(9):
        orb.siz *= cheatmulti;
        println("ball size times " + cheatmulti);
        break;
      case(10):
        orb.roundScore *= cheatmulti;
        println("round score times " + cheatmulti);
        break;
      case(11):
        buck.pos.x *= cheatmulti;
        println("bucket x position times " + cheatmulti);
        break;
      case(12):
        buck.pos.y *= cheatmulti;
        println("bucket y position times " + cheatmulti);
        break;
      case(13):
        buck.size.x *= cheatmulti;
        println("bucket width times " + cheatmulti);
        break;
      case(14):
        buck.size.y *= cheatmulti;
        println("bucket height times " + cheatmulti);
        break;
      case(15):
        buck.speed *= cheatmulti;
        println("bucket speed times "  + cheatmulti);
        break;
      case(16):
        targ[round(random(12))].type *= cheatmulti;
        println("random target type times "  + cheatmulti);
        break;
      case(17):
        targ[round(random(12))].pos.x *= cheatmulti;
        println("random target x position times "  + cheatmulti);
        break;
      case(18):
        targ[round(random(12))].pos.y *= cheatmulti;
        println("random target y position times "  + cheatmulti);
        break;
      case(19):
        targ[round(random(12))].siz *= cheatmulti;
        println("random target size times "  + cheatmulti);
        break;  
      case(20):
        targ[round(random(12))].speed *= cheatmulti;
        println("random target speed times "  + cheatmulti);
        break;
      case(21):
        cheatmulti *= cheatmulti; // CHEAT MULTI SQUARED?!
        println("cheat multiplyer times " + cheatmulti);
        break;
      default:
        println("MISSFIRE?!");
        break;
      
    }
  }
  
}
