public class Player
{
  
  float size;
  float xPos;
  float yPos;
  PImage plane;
  int i = 0;
  int Btemp;
  float p_radius =20;
  float collider_p;
  int life = 10;
  
  Player(){

  xPos = 0;
  yPos = 0;
  plane = loadImage("Bluejet1.png");
  noCursor();
  }
  
  void setLocation(float Xpos, float Ypos){
  this.xPos = Xpos;
  this.yPos = Ypos;  
  }

  void Display(){
    imageMode(CENTER);
    image(plane,xPos, yPos );
     
  }
  
  //collide;
  void collide(float bulletx, float bullety)
  {
     collider_p = sqrt( (xPos-bulletx)*(xPos-bulletx)+(yPos-bullety)*(yPos-bullety) );
 
         if(collider_p <= 35 && collider_p >= 33.3)
         {
           life --;
         }          
  }
  
  
  
  
} 