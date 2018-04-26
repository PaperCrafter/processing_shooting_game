Player Plane;
Enemy[] Shuttle1;
Boss boss;
BulletP[] Bullet;
BulletE[][] bulletE;
BulletE[] bulletB;

float mapMoving = 10;
float maplocation = -3500;
boolean start;
boolean gameover;
boolean victory;
float score;

int Bulletnumber;
int Bulletno = 1;

PFont f;
PImage img;
PImage Opening;
PImage GameOver;
PImage Victory;

//bullet variable
int bulletNum=0;

float collider_e;

void setup(){
  size(1024, 1000);
  frameRate(60);
  start = false;
  gameover = false;
  
//Opening Image
  Opening = loadImage("The Space Striker.jpg");
  
//space image
  img = loadImage("Space.png"); 
  
//end image
  GameOver = loadImage("GameOver.jpg");

//winimage
  Victory = loadImage("victory!.jpg");
  

//Create User
  Plane = new Player();

//create bullet
  Bullet = new BulletP[30];
  for (int i = 0; i < 30; i++)
  {
  Bullet[i] = new BulletP();
  }

//create enemy bullet
  bulletE = new BulletE[8][80];
  for(int i = 0; i<8; i++)
  {
    for(int a = 0; a<80; a++)
    {
      bulletE[i][a]= new BulletE(a);      
    }
  }
//create Boss bullet
 bulletB = new BulletE[200];
 for(int a = 0; a<200; a++)
    {
      bulletB[a]= new BulletE(a);      
    }

  
  
  
  f = createFont("Arial", 16);
  
//Create Enemy  
   float E_location = -900;
   Shuttle1 = new Enemy[8];
   for(int i = 0; i<8 ; i++){
     Shuttle1[i] = new Enemy(E_location);
     E_location -=1000;
   }
   
//create Boss
  boss = new Boss();
  
  
  
//create font
f =createFont("Arial",16);
  
}


void draw(){
//Opening
  if(start==false && gameover == false) 
  { image(Opening, 0,0, 1024,1000);
    if(mousePressed){
      start = true;
      score = 0;
    }
  }
  //GAME 
  if(start && gameover == false && victory == false){
  //background location
    image(img, 500,maplocation +=1) ;
 
 //display Life
   textFont(f, 100); 
   fill(255);         
   text("Life : " + Plane.life, 0, 100);
  
  //display user  
    Plane.Display();
    Plane.setLocation(mouseX, mouseY);
  
 //user crashed
  for(int i = 0; i<8; i++)
  {
    for(int a = 0; a<80; a++)
    {
     Plane.collide( bulletE[i][a].xPos,  bulletE[i][a].yPos);       
    }
  }
  
 //user GameOver 
 if(Plane.life ==0)
 {
  gameover = true;
 }
  
  

  //display enemy bullet + hurt
  for(int i = 0; i<8; i++)
  {
    
   

    for(int a = 0; a<20; a++)
    {
      if( Shuttle1[i].yPos<200)
      {
      bulletE[i][a].display(Shuttle1[i].xPos, Shuttle1[i].yPos);
      }
      
      bulletE[i][a].move1();                 
    }
    
    for(int a = 20; a<40; a++)
    {
      if( Shuttle1[i].yPos<270)
      {
      bulletE[i][a].display(Shuttle1[i].xPos, Shuttle1[i].yPos);
      }
      if(Shuttle1[i].Hp<15)
      {
      bulletE[i][a].move2();
      }
    }  
      for(int a = 40; a<60; a++)
    {
      if( Shuttle1[i].yPos<320)
      {
      bulletE[i][a].display(Shuttle1[i].xPos, Shuttle1[i].yPos);
      }
      if(Shuttle1[i].Hp<10)
      {
      bulletE[i][a].move2();
      } 
      
    }    
    
      for(int a = 60; a<80; a++)
    {
      if( Shuttle1[i].yPos<320)
      {
      bulletE[i][a].display(Shuttle1[i].xPos, Shuttle1[i].yPos);
      }
      if(Shuttle1[i].Hp<5)
      {
      bulletE[i][a].move2();
      } 
     
   }    
 }
 
    
//Boss bullet



 
      for(int i = 0; i < 50 ; i ++){ 
        if( boss.yPos<120){
       bulletB[i].display(boss.xPos, boss.yPos);
        }
       bulletB[i].move2();
      }
      
  

      for(int i = 50; i<100; i++){
        if( boss.Hp==90||boss.Hp == 60||boss.Hp == 30){
        bulletB[i]. xPos = boss. xPos;
        bulletB[i]. yPos = boss. yPos;
        bulletB[i]. display = true;
        }
        if(boss.Hp<=90|| boss.Hp<=60|| boss.Hp<=30)
       bulletB[i].move3();
      }
     
     
       for(int i = 100; i<50; i++){
        if( boss.Hp==80||boss.Hp == 50||boss.Hp == 20){
        bulletB[i]. xPos = boss. xPos;
        bulletB[i]. yPos = boss. yPos;
        bulletB[i]. display = true;
        }
        if(boss.Hp<=80|| boss.Hp<=50|| boss.Hp<=20)
       bulletB[i].move3();
      }
     

       for(int i = 150; i<200; i++){
        if( boss.Hp==70||boss.Hp == 40||boss.Hp == 10){
        bulletB[i]. xPos = boss. xPos;
        bulletB[i]. yPos = boss. yPos;
        bulletB[i]. display = true;
        }
        if(boss.Hp<=70|| boss.Hp<=40|| boss.Hp<=10)
        bulletB[i].move3();
       }
      
     for(int a = 0; a<200; a++)
    {
     Plane.collide( bulletB[a].xPos,  bulletB[a].yPos);       
    }
      
      
      
      
   
//end of boss bullet 
 
 
 
  
//end bullet  
  
  //display enemy
  for(int i = 0; i < 8; i++)
    {
      Shuttle1[i].display();
      Shuttle1[i].move();
    }
    
    
   //bullet collide & crashed bullet disappear
   for(int i = 0; i< 8; i++){
        for(int a=0; a<30; a++){
     Shuttle1[i].collide(Bullet[a].xPos , Bullet[a].yPos);
     
     //notcrashed
    if(Shuttle1[i].returncollide()>160)
     {
       Bullet[a].move();
     }
     
     //crashed
     else if(Shuttle1[i].returncollide()<160)
     {
       Bullet[a].xPos = 2000;
       Bullet[a].yPos = 2000;
     }
     
     
        }       
     }
    
  //display Boss
    boss.display();
    boss.move();
    
    //Boss colide
    for(int a=0; a<30; a++)
    {
     boss.collide(Bullet[a].xPos , Bullet[a].yPos);
     
     //notcrashed
    if(boss.returncollide()>200)
     {
       Bullet[a].move();
     }
     
     //crashed
     else if(boss.returncollide()<=200)
     {
       Bullet[a].xPos = 2000;
       Bullet[a].yPos = 2000;
     }
    }
   //clear boss
   if(boss.Hp == 0)
   {
      victory = true;
      
   }
 
 
 
 
if(start==true && gameover == true)
{
  image(GameOver,512,500);
}


if(start==true && victory == true)
{
  image(Victory,512,500);
}






}
}

   


//display bullet
void mousePressed()
{
  if(mouseButton==LEFT) //When mousebutton was pressed, fire bullet such as ellipse)
  {
    Bullet[bulletNum].display(mouseX, mouseY);
    bulletNum++;
    if(bulletNum==29)
    bulletNum=0;
  } 
}