boolean jump = false;
boolean left;
boolean right;
boolean on = true;
boolean restart = false;
float grav = 20;
float speed = 8;
float speedP = 8;
float yeet = 13;
float x = 600;
float y = 400;
float floorY= 750;
float xR = 600;
float yR = 650;
int score = 0;
float xP;
float yP;
float x2;
float y2;
float x3;
float y3;
float variation = 1;
float accel =0.01;



void setup(){
  size(1200,800);
  frameRate(60);
}
void keyPressed(){
   if (key =='w' || key == ' ' ){
        jump = true;
    }
  if(key == 'd'){
    right = true;
  }
  if(key =='a'){
    left = true;
  }
  if(key == 'R'){
    restart = true;
  }
}

void keyReleased(){
  if (key =='w' || key == ' '){
    jump = false;
  }
  if(key == 'd'){
    right = false;
  }
  if(key =='a'){
    left = false;
  }
  if(key == 'R'){
    restart = false;
  }
}
void draw(){
  background(40);
  line(0,floorY, 1200, 750);
  speedP += accel;
  //rules
  yR += grav;
  if (yR+50 >= floorY || jump){
    grav = 0;
  } 
  else {
    grav = 8;
  }
   if (yR <= 0){
      jump = false;
  }
  if (xR <= 0){
    xR = 1;
  } 
  if ( xR >= 1200){
    xR =1174;
  }
  //character movement+gravity
  if (jump){
    yR = yR - (yeet);
  }
  if (left){
    xR -= speed;
  }
  if (right){
    xR += speed;
  }
  fill (11,218,81);
  rect(xR, yR, 25, 50);
  float bodyCX = xR +12.5;
  float bodyCY = yR + 25;
  // objectives
  if(!on){
    x = random(10,1190);
    y = random(10,floorY-10);
  }
  fill (255,255,0);
  circle(x,y,20);
  //  hit boxes
  float distance = sqrt(pow(x - xR, 2) + pow(y - yR, 2));
  if (distance <= 40) {
    on = false;
    score += 1;
  } 
  else {
    on = true;
  }
  //score board
  textSize(32);
  text(score, 600, 200 );
  // projectiles from top
  float lethal = sqrt(pow((xP+5) - (bodyCX), 2) + pow( (yP+5) - (bodyCY), 2));
  fill(255,0,0);
  triangle(xP,yP, xP+10,yP,xP+5, yP+10);
  if (xP >= 1250 || yP >= 850){
    xP = random(100, 1100);
    yP = -5;
    variation = random(-1, 1);
    }
  xP += variation*speedP;
  yP += speedP;
  //projectile 
  textSize(32);
  text(score, 600, 200 );
  // projectiles from left side
  float lethal2 = sqrt(pow((x2+5) - (bodyCX), 2) + pow( (y2+5) - (bodyCY), 2));
  triangle(x2,y2, x2+10,y2,x2+5, y2+10);
  if (x2 >= 1250 || y2 >= 850){
    x2 = -5;
    y2 = random(10, floorY-10);
    variation = random(-1, 1);
  }
  x2 += speedP;
  y2 += variation*speedP;
  // projectiles from right sidea
  float lethal3 = sqrt(pow((x3+5) - (bodyCX), 2) + pow((y3+5) - (bodyCY), 2));
  triangle(x3,y3, x3+10,y3,x3+5, y3+10);
  if (x3 >= 1250 || y3 >= 850){
    x3 = 1205;
    y3 = random(10, floorY-10);
    variation = random(-1, 1);
  }
  x3 -= speedP;
  y3 += variation*speedP;
  //death
  if (lethal < 20 || lethal2 < 20 || lethal3 < 20)  {
    textSize(200);
    text("Game Over", 100, 400);
    textSize(40);
    text("Press shift + r to restart", 400, 600);
    speed = 0;
    speedP =0;
    accel = 0;
    jump = false;
    grav=0;
    yeet = 0;
      if(restart){
       speed = 8;
       score=0;
       speedP = 8;
       grav = 20;
       xR =600;
       yR = 650;
       x = 600;
       y = 400;
       xP = 0;
       yP=0;
       x2=0;
       y2=0;
       x3=0;
       y3=0;
       yeet = 13;
     }
  }
 
}
