
class Mover{
  float x,y;
  float r;
  color c;
  Mover(){
    r = 30;
    c = color(random(10,255),255,255);
  }
  void Draw(){
    fill(c);
   ellipse(x,y,r*2,r*2); 
  }
  //true = 1 false = 0
  int LengthColl(int _x,int _y){
    if( ((x - _x)*(x - _x) + (y - _y)*(y - _y)) <= (r*r) )
    {
      return 1; 
    }
    return 0;
  }
}


Mover obj;
void setup(){
  size(300,300);
  colorMode(HSB);
  obj = new Mover();
}
void draw(){
  //BackScreen
  background(100,0,255);
  obj.Draw();
}

void mouseDragged(){
  if(obj.LengthColl(mouseX,mouseY) == 1){
    obj.x = mouseX;
    obj.y = mouseY;
  }
}

void mousePressed(){
 println("mousePressed");
}

void mouseReleased(){
  println("mouseReleasse");
}
