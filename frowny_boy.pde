int value =255;
 float frown = 0;
 int moveFrownX= 0;
 int moveFrownY =0;
void setup(){
 size(1440,1080);
}

void draw(){
  background(200);
  //head//
fill(255,value,0);
circle (0+mouseX, 0+mouseY, 40);
//eyes//
fill(29);
circle (-8+mouseX,-8+mouseY, 5);
circle (8+mouseX,-8+mouseY, 5);
//smile//
noFill();
arc(0+mouseX, 0+mouseY+moveFrownY, 30, 30, 0+frown, PI+frown);
//make red on click//
  if (mousePressed) {
    frown = PI ;
    value = 0;
    moveFrownY = 9;
  } else {
    value = 255;
    frown = 0 ;
    moveFrownY = 0;
  }
  }
