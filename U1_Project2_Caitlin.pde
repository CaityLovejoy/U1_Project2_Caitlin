Player P1;
enemyType1[] e;
int count = 500;
int startTime = 0;
int invulnTime =500;
int endTime = 0;
int c = 90;

void setup()
{
  fullScreen();
  P1 = new Player(10, 10, 20, 5, 5, 100);
  e = new enemyType1[count];
  colorMode(HSB,360,100,100);
  for (int x=0; x < count; x++)
  {
    e[x]= new enemyType1(random(0, width), random(0, height), 10, random(-2, 2), random(-2, 2));
  }
}

void draw()
{
  
  background(0);
  fill(c,255,255);
  P1.Draw();
  P1.Move();
  for (int a=0; a < count; a++)
  {
    fill(283,128,255);
    e[a].Draw();
    e[a].Move();
    if ( e[a].Collision(P1, e[a]))
    {
      
      if(millis()- startTime > invulnTime)
      {
      P1.health = P1.health-10;
      c = c-10;
      startTime = millis();
      
      }   
    }
 
    if (P1.health <= 0)
    {
      background(255);
      gameOver();
    }
   
   if(P1.health > 0)
   {
     endTime = millis();
   }
  }
}


 void gameOver()
  {
   
    fill(255,0,0);
    textSize(50);
    text("GAME OVER",height/2, width/2);
    text(endTime, width/2, height/4);
  }