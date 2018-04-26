public class BulletE
{
  float xPos;
  float yPos;
  boolean display;
  float radius;
  float sTime;
  
  float xPosr =random(-5, 5);
  float yPosr =random(4,15);  
  
  float xPosb1 = random(0, 10);
  float xPosb2 = random(0,-10);

  float yPosr1 =random(4,14);  
  
  float xPosb12 = random(-5, 5);
  float xPosb23 = random(0,-5);
  
  
  PImage bullete;
    
  BulletE(int radius){
    this.xPos = 0;
    this.yPos = 0;
    this.display = false;
    this. radius = radius;
    
    bullete = loadImage("E_bullet2.png");
  }
  
  void display(float x, float y )
  {    
    image(bullete, x, y);
    
    xPos = x;
    yPos = y;
        
    if(y > 100)
    {
    display = true;    
    } 
  }

  void move1()
  {
    image(bullete, xPos, yPos);
    if(display == true)
    { 
      
      
   for(int f = 0;f < 5; f++)
   {
     if(radius/5>=f && radius/5<=f+1)
       {
       yPos +=7.5- 1.5* f;
       }
   }
      
      
    if(radius%5 == 0)
       {
       xPos -=0.5;
       }
     
       if(radius%5 == 1)
       {
       xPos -= 0.2;
       }
     
       if(radius%5 == 2)
       {
       //stay still
       }
     
       if(radius%5 == 3)
       {
       xPos +=0.2;
       }
     
       if(radius%5 == 4)
       {
       xPos +=0.5;
       }
    } 
  }
  
 void move2()
  {
    image(bullete, xPos, yPos);
    if(display == true)
    { 
      xPos += xPosr;
      yPos += yPosr;
    } 
  }
  
  void move3()
  {
    image(bullete, xPos, yPos);
    if(display == true)
    { 
      xPos += xPosb12;
      yPos += yPosr1;
    } 
  } 
  
  
 void moveb1()
  {
    image(bullete, xPos, yPos);
    if(display == true)
    { 
      xPos += xPosb1;
      yPos += yPosr;
    } 
  } 
  
void moveb2()
  {
    image(bullete, xPos, yPos);
    if(display == true)
    { 
      xPos += xPosb2;
      yPos += yPosr;
    } 
  }
  
  
  
  void disappear()
  {
    xPos = 2000;
    yPos = 2000;
  }
}