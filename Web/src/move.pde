float x;
float y;
void setup(){
  size(1280,720);
  x=width/2;
  y=height/2;
}

void draw(){
  x+=random(-5,5);
  y+=random(-3,3);
  //ellipse(random(width),random(height),10,10);
  stroke(0,0,0);
  ellipse(x,y,25,25);
}
