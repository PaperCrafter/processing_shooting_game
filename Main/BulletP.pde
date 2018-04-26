public class BulletP
{
  float xPos;
  float yPos;
  boolean display;
  PImage bulletp;
  
  
   BulletP()
   {
    this.xPos = 2000;
    this.yPos = 2000;
    this. display = false;
    bulletp = loadImage("bullet1.png");
   }
   
   void display(float x, float y )
   {
    this.xPos = x;
    this.yPos = y;
    display = true;       
   }
   
   void move ()
   {
     if(display == true)
     {
     yPos -= 10;
     image(bulletp, xPos,yPos);     
     }
   }
   
  void disappear()
  {
    xPos = 2000;
    yPos = 2000;
  }
}