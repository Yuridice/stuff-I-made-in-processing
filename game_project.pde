boolean jump = false;
boolean left;
boolean right;
boolean on = true;
boolean restart = false;
boolean shield = false;
boolean shieldUnlock = false;
boolean defenderUnlock = false;
boolean dashUnlock = false;
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
float angle = 0;
int unit = 1;
PShape card, button, skillCard;
int i = 0;
int skill1 = 1;
int skill2 = 1;
int skill3 = 1;
float coolS = 120;
float shieldSize=100;
boolean regen;
float countdown = 0;
boolean lessReload=false;
boolean maxReload=false;
boolean dash = false;
float accru;
float flicker;
float limit;
float timeLimit;
float delay;

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
   if (key =='w'||key=='W' ){
        jump = true;
    }
  if(key == 'd'||key == 'D'){
    right = true;
  }
  if(key =='a'){
    left = true;
  }
  if(key == 'R'){
    restart = true;
  }
  if ( key == ' ' ){
    dash=true;
  }
}
void keyReleased(){
  if (key =='w' || key == 'W'){
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
  if ( key == ' ' ){
    dash=false;
  }
}
void draw(){
  background(40);
  line(0,floorY, 1200, 750);
  speedP += accel;
  time += unit;
 
  float seconds = time/60;
   
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
  float distance = sqrt(pow(x - bodyCX, 2) + pow(y - bodyCY, 2));
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
        xC += variationC*speedP;
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
        xC2 += speedP; 
        yC2 += variationC*speedP;
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
          xC3 += speedP;
          yC3 += variationC*speedP;
        }
  // upgrades
  if (score == 0 || score == 8 || score == 59){
    in = true;
  }
  if (score == 1 || score == 9 || score == 60) {
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
    //slect skill1
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
    if (mouseX>540 && mouseX< 700 && mouseY < 590 && mouseY > 550 ){
      if ( mousePressed && (mouseButton == LEFT)){
      skill2 ++;
      defenderUnlock = true;
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
    if (mouseX>840 && mouseX< 1000 && mouseY < 590 && mouseY > 550 ){
      if ( mousePressed && (mouseButton == LEFT)){
      skill3 ++;
      dashUnlock = true;
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
       switch (skill1){
           case 1:
            textSize(32);
            text("shield",240,400);
            textSize(20);
            text(" temporary protection \n from this hell. \n (hold right click to \n deploy a shield)", 235, 450);
            break;
        
          case 2:
            textSize(32);
            text("shield big",240,400);
            shieldSize = 120;
            break;
          case 3:
            textSize(32);
            text("shield mega",240,400);
            shieldSize = 180;
            break;
       }
       switch (skill2){
          case 1:
            textSize(32);
            text("defender",540,400);
            break;
          case 2:
            textSize(32);
            text("less reload time",540,400);
            lessReload=true;
            break;
          case 3:
            textSize(32);
            text("even less reload time",540,400);
            maxReload=true;
            lessReload=false;
            break;
       }
       switch(skill3){
        case 1:
          textSize(32);
          text("dash",840,400);
          limit=0;
          break;
        case 2:
          textSize(32);
          text("double dash",840,400);
          limit=1;
          break;
        case 3:
          textSize(32);
          text("triple dash",840,400);
          limit=2;
          break;
        }
    }
  }
  //shield skill1
  if (mousePressed && (mouseButton == RIGHT)){
    shield = true;
  } else { 
    shield = false;
  }
  if (shieldUnlock){
    fill(0,0,255);
    float coolDown = coolS/60;
    rect (900, 100, coolDown*100, 20);
    text("Cool down : ", 900, 50) ;
    if (coolS == 0){
      regen = false;
    }
    if (coolS == 120){
      regen = true;
    }
    if (!regen){
      coolS ++;
    }
    if (shield && regen && coolS > 0){
        noFill();
        stroke(0,25,240);
        strokeWeight(30);
        circle(bodyCX, bodyCY, shieldSize);
        stroke(0);
        strokeWeight(1);
        coolS -=1;
        if (lethal < shieldSize/2){
           xP = 0;
           yP = 0;
        }else if (lethal2 < shieldSize/2){ 
           x2=0;
           y2=0;
        }else if (lethal3 < shieldSize/2 ){ 
           x3=0;
           y3=0;
        }else if (lethalC < shieldSize/2 + 10){ 
           xC = -30;
           yC = -30;
        }else if (lethalC2 < shieldSize/2 + 10) {
           xC2 = -30;
           yC2 = -30;
        }else if (lethalC3 < shieldSize/2 + 10){
           xC3 = -30;
           yC3 = -30;
        }
      }
    }


  //  defender skill2
  if(defenderUnlock){
    noFill();
    strokeWeight(4);
    stroke(255,0,0);
    circle(mouseX,mouseY,20);
    float shot1 = sqrt(pow((xP+5) - mouseX, 2) + pow( (yP+5) - mouseY, 2));
    float shot2 = sqrt(pow((x2+5) - mouseX, 2) + pow( (y2+5) - mouseY, 2));
    float shot3 = sqrt(pow((x3+5) - mouseX, 2) + pow( (y3+5) - mouseY, 2));
    float shot4 = sqrt(pow((xC+5) - mouseX, 2) + pow( (yC+5) - mouseY, 2));
    float shot5 = sqrt(pow((xC2+5) - mouseX, 2) + pow( (yC2+5) - mouseY, 2));
    float shot6 = sqrt(pow((xC3+5) - mouseX, 2) + pow( (yC3+5) - mouseY, 2));
    if (countdown != 0){
      countdown --;
    }
    if(mousePressed && (mouseButton == LEFT) && countdown == 0){
      if (shot1 <30){
           xP = 0;
           yP = 0;
        }else if (shot2 < 30){ 
           x2=0;
           y2=0;
        }else if (shot3 < 30){ 
           x3=0;
           y3=0;
        }else if (shot4 < 30){ 
           xC = -30;
           yC = -30;
        }else if (shot5 < 30) {
           xC2 = -30;
           yC2 = -30;
        }else if (shot6 < 30){
           xC3 = -30;
           yC3 = -30;
        }
        if (lessReload){
          countdown= 100;
        }else if (maxReload){
          countdown = 60;
        } else{
          countdown = 140;
        }
     }   
     strokeWeight(1);
     fill(255,0,0);
     stroke(0);
     rect(mouseX-10, mouseY+30, countdown*0.9, 5);
  }
  // dash skill3
  if (dashUnlock){
    fill(200,30,90);
    if (timeLimit>60 || accru != 0){
      flicker=0;
    }
    if(dash && flicker == 0 && (timeLimit>30 || accru != 0)){
      speed=100;
      flicker++;
      if (accru!=0){
        accru --;
      }
      timeLimit = 0;
    }else{
      speed=8;
      timeLimit ++;
    }
    if (delay >= 120 && accru < limit){
      accru ++;
      delay = 0;
    }
    delay++;
    text(floor(accru), 1100,700);
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
    defenderUnlock=false;
    dashUnlock = false;
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
  //dev tools
  text(seconds, 20,20);
  textSize(20);
  print();
  //text(mouseX, mouseX+10, mouseY);
  //text(mouseY, mouseX, mouseY-10);
}
