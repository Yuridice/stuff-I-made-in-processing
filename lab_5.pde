color bgColor = color(150);
PImage pumpkin;

void setup(){
  size(1000,800);
  pumpkin = loadImage("Pumpkin.png");
  pumpkin.resize(600,0);
}
void draw(){
  background(bgColor);
  int hsw = width/2;
  int hsh = height/2;
  int hiw = pumpkin.width/2;
  int hih = pumpkin.height/2;
  int ix = hsw-hiw;
  int iy = hsh-hih;
  image(pumpkin, ix, iy); 
}
