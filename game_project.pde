boolean jump = false;
boolean left;
boolean right;
boolean on = true;
boolean restart = false;
boolean shield = false;
boolean shieldUnlock = false;
boolean in = false;
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
float xC = -30;
float yC = -30;
float xC2 = -30;
float yC2 = -30;
float xC3 = -30;
float yC3 = -30;
float variation = 1;
float variationC = 1;
float accel =0.001;
float time;
int unit = 1;
PShape card, button, skillCard;
int i = 0;
float skill1 = 1;
float skill2 = 1;
float skill3 = 1;
float coolS = 0;
void setup(){
  size(1200,800);
  frameRate(60);
  skillCard = createShape(GROUP);
  card =  createShape(RECT, 20, 20, 200, 300);
  button = createShape(RECT, 40, 250, 160, 40);
  skillCard.addChild(card);
  skillCard.addChild(button);
  
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
  time += unit;
 
  float seconds = time/60;
   text(seconds, 20,20);
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
  //  hit boxes for objectives
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
  //projectiles 
  // projectiles from top
    //inittial trianghles top
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
    //big boy circles top
      float lethalC = sqrt(pow((xC+5) - (bodyCX), 2) + pow( (yC+5) - (bodyCY), 2));
      fill(255,0,0);
      circle(xC, yC, 30);
      if(seconds >10){
        if (xC >= 1250 || yC >= 850){
          xC = random(100, 1100);
          yC = -5;
          variationC = random(-2, 2);
          }
        xC += variationC*speed;
        yC += speed;
    }
  // projectiles from left side
    //initial triangles
      float lethal2 = sqrt(pow((x2+5) - (bodyCX), 2) + pow( (y2+5) - (bodyCY), 2));
      triangle(x2,y2, x2+10,y2,x2+5, y2+10);
      if (x2 >= 1250 || y2 >= 850){
        x2 = -5;
        y2 = random(10, floorY-10);
        variation = random(-1, 1);
      }
      x2 += speedP;
      y2 += variation*speedP;
    //big boy circles left
      float lethalC2 = sqrt(pow((xC2+5) - (bodyCX), 2) + pow( (yC2+5) - (bodyCY), 2));
      fill(255,0,0);
      circle(xC2, yC2, 30);
      if(seconds >15){
        if (xC2 >= 1250 || yC2 >= 850){
          xC2 = -5;
          yC2 = random(10, floorY-10);
          variationC = random(-2, 2);
          }
        xC2 += speed; 
        yC2 += variationC*speed;
      }
  
  // projectiles from right sidea
    //initial triangles right
      float lethal3 = sqrt(pow((x3+5) - (bodyCX), 2) + pow((y3+5) - (bodyCY), 2));
      triangle(x3,y3, x3+10,y3,x3+5, y3+10);
      if (x3 >= 1250 || y3 >= 850){
        x3 = 1205;
        y3 = random(10, floorY-10);
        variation = random(-1, 1);
      }
      x3 -= speedP;
      y3 += variation*speedP;
    //big boy circles right
      float lethalC3 = sqrt(pow((xC3+5) - (bodyCX), 2) + pow( (yC3+5) - (bodyCY), 2));
        fill(255,0,0);
        circle(xC3, yC3, 30);
        if(seconds > 20){
          if (xC3 >= 1250 || yC3 >= 850){
            xC3 = -5;
            yC3 = random(10, floorY-10);
            variationC = random(-2, 2);
            }
          xC3 += speed;
          yC3 += variationC*speed;
        }
  // upgrades
  if (score == 4 || score == 8 || score == 59){
    in = true;
  }
  if (score == 5 || score == 9 || score == 60) {
    if (in){
    grav=0;
    speed = 0;
    speedP =0;
    accel = 0;
    jump = false;
    yeet = 0;
    unit = 0;
    textSize(100);
    text("pick an upgrade", 300 ,100);
    shape(skillCard, 200, 300);
    shape(skillCard, 500, 300);
    shape(skillCard, 800, 300);
    
   if (mouseX>240 && mouseX< 400 && mouseY < 590 && mouseY > 550 ){
      if ( mousePressed && (mouseButton == LEFT)){
      skill1 ++;
      shieldUnlock = true;
      in = false;
      grav=20;
      speed = 8;
      speedP =8;
      accel = 0.001;
      jump = false;
      yeet = 13;
      unit = 1;
      }
    }
  //skill from list
        if (skill1 == 1){
          textSize(32);
          text("shield",240,400);
          textSize(20);
          text(" temporary protection \n from this hell. \n (hold right click to \n deploy a shield)", 235, 450);
        }
        if (skill1 == 2){
          textSize(32);
          text("shield big",240,400);
        }
        if (skill1 == 3){
          textSize(32);
          text("shield mega",240,400);
        }
        if (skill2 == 1){
          textSize(32);
          text("click delete",540,400);
        }
        if (skill2 == 2){
          textSize(32);
          text("bigger range",540,400);
        }  
        if (skill2 == 3){
          textSize(32);
          text("drag",540,400);
        }
        if (skill3 == 1){
          textSize(32);
          text("dash",840,400);
        }
        if (skill3 == 2){
          textSize(32);
          text("double dash",840,400);
        }  
        if (skill3 == 3){
          textSize(32);
          text("3",840,400);
        }
    }
  }
  //shield skill
  if (mousePressed && (mouseButton == RIGHT)){
    shield = true;
  } else { 
    shield = false;
  }
  if (shieldUnlock && coolS <= 240){
    if (shield){
    coolS ++;
      if (coolS <= 60){
        noFill();
        stroke(0,25,240);
        strokeWeight(30);
        circle(bodyCX, bodyCY, 100);
        stroke(0);
        strokeWeight(1);
        if (lethal < 50){
           xP = 0;
           yP=0;
        }else if (lethal2 < 50){ 
           x2=0;
           y2=0;
        }else if (lethal3 < 50 ){ 
           x3=0;
           y3=0;
        }else if (lethalC < 60){ 
           xC = -30;
           yC = -30;
        }else if (lethalC2 < 60) {
           xC2 = -30;
           yC2 = -30;
        }else if (lethalC3 < 60){
           xC3 = -30;
           yC3 = -30;
        }
      }
    }
    if (coolS == 240){
        coolS =0;
  }
  
  }
    
  //death
  if (lethal < 20 || lethal2 < 20 || lethal3 < 20|| lethalC < 30|| lethalC2 < 30 || lethalC3 < 30)  {
    grav=0;
    textSize(200);
    text("Game Over", 100, 400);
    textSize(40);
    text("Press shift + r to restart", 400, 600);
    speed = 0;
    speedP =0;
    accel = 0;
    jump = false;
    yeet = 0;
    unit = 0;
    shieldUnlock=false;
    //restart
      if(restart){
       accel = 0.001;
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
       xC = -30;
       yC = -30;
       xC2 = -30;
       yC2 = -30;
       xC3 = -30;
       yC3 = -30;
       yeet = 13;
       time=0;
       unit = 1;
       skill1 =1;
       skill2 =1;
       skill3 =1;
     }
  }
  textSize(20);
  text(mouseX, mouseX+10, mouseY);
  text(mouseY, mouseX, mouseY-10);
}
