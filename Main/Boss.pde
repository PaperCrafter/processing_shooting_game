public class Boss {
  
  float xPos, yPos;   // Variables for location of enemy
  float xSpeed;  //xSpeed of Boss
  float ySpeed;  // ySpeed of Boss
  float C_radius; // Radius of Boss
  PImage Boss;
  float Hp = 100;
  float collider_b;
  
  Boss() {
    C_radius = 450;                   // All raindrops are the same size
    xPos = width/2;       // Start with a random x location
    yPos = -10000; 
    xSpeed = 5;
    ySpeed = 3;  
    Boss = loadImage("VS_demilich.png");
  }

//getdowm the boss
  void move() {
    //start speed  
    if(yPos<=200){
    yPos += ySpeed;
    }
    else if(yPos>=200 && ySpeed >= 0){      
      ySpeed -= 0.1;
      yPos +=ySpeed;       
    }
    if(ySpeed <= 0){
      xPos +=xSpeed;
      if(xPos<=200 ||xPos>=width-200){
        xSpeed *= -1;       
      }    
    }    
  }

  // Display the Boss
  void display() {
    noStroke();
    imageMode(CENTER);//need to be modified
    image(Boss, xPos , yPos );
    }
  
  //collide;
  void collide(float bulletx, float bullety)
  {
     collider_b = sqrt( (xPos-bulletx)*(xPos-bulletx)+(yPos-bullety)*(yPos-bullety) );
 
         if(collider_b <= 200)
         {
           Hp --;
         }
                     
  }
  
  
  //return collider to make collided bullet invisible.
  float returncollide(){
    return collider_b;
  }
  
  
  void Disappear(){
  if(this.Hp==0){
  
  }
 }
}