
//MoverObject
class Mover{
  float x,y;
  float fastx,fasty;
  float fastmx,fastmy;
  int draggflag;
  float r;
  color c;
  Mover(){
    r = 30;
    c = color(random(10,255),255,255);
  }
  
  void ondragg(int _mx,int _my){
    if(draggflag == 1){
      x = _mx + (fastx - fastmx);
      y = _my + (fasty - fastmy);
    }
  }
  
  void setonpress(int _mx,int _my){
    fastmx = _mx;
    fastmy = _my;
    fastx = x;
    fasty = y;
    draggflag = 1;
  }
  
  void Draw(){
    fill(c);
   ellipse(x,y,r*2,r*2); 
  }
  //Collision true = 1,false = 0
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
  obj.x = 150;
  obj.y = 150;
}

void draw(){
  //BackScreen
  background(100,0,255);
  obj.Draw();
}

void mouseDragged(){
    text("dragg",10,20);
    obj.ondragg(mouseX,mouseY);
}

void mousePressed(){
 println("mousePressed");
  if(obj.LengthColl(mouseX,mouseY) == 1){
    text("press",10,20);
    obj.setonpress(mouseX,mouseY);
  }
}

void mouseReleased(){
  println("mouseReleasse");
  obj.draggflag = 0;
}
