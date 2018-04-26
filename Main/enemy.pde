public class Enemy 
{
  
  float xPos;
  float yPos;  
  float speed;  // Speed of enemy
  float c_radius;      
  PImage Enemy1;
  float Hp = 20;

  Enemy(float yPos) {
    c_radius = 220;                   // All raindrops are the same size
    xPos = random(width);      
    speed = random(4, 5);    
    Enemy1 = loadImage("Enemyship1.png");
    this.yPos = yPos;
  }

//getdown the anemy
  void move() {
    //start speed  
    if(yPos<=200){
    yPos += speed;
    }
    
    else if(yPos>=140 && speed >= 0){
      
      speed -= 0.05;
      yPos +=speed;       
    }
  }

  // Display the enemy
  void display() 
  {
    fill(150);
    imageMode(CENTER);
    image(Enemy1, xPos , yPos );
    
    if(Hp>0){
    imageMode(CENTER);
    image(Enemy1, xPos , yPos );
    }
    if(Hp<=0){
    
    }
  }

  //collide;
  void collide(float bulletx, float bullety)
  {
     collider_e = sqrt( (xPos-bulletx)*(xPos-bulletx)+(yPos-bullety)*(yPos-bullety) );
 
         if(collider_e < 160)
         {
           Hp --;
         }
           
         //MODIFY
         if(Hp <=0){
           speed = 10;
         }              
  }
    //return collider to make collided bullet invisible.
  float returncollide(){
    return collider_e;
  }


  // 
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    yPos = -1000;
  }
  
}