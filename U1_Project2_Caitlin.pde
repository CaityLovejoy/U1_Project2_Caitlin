import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Player P1;
enemyType1[] enemy1;
enemyType2[] enemy2;
enemyType3[] enemy3;
int count = 0;
int count1 = 0;
int count2 = 0;
int startTime = 0;
int invulnTime =500;
int endTime = 0;
int c = 90;
int sceneNum = 0;
int gameTime = 0;
Minim minim;
AudioPlayer injury;
AudioPlayer background;

void setup()
{
  fullScreen();
  minim = new Minim(this);
  injury = minim.loadFile("Beep.mp3");
  P1 = new Player(10, 10, 20, 5, 5, 100);
  enemy1 = new enemyType1[500];
  enemy2 = new enemyType2[500];
  enemy3 = new enemyType3[500];
  colorMode(HSB, 360, 100, 100);
  for (int x=0; x < 500; x++)
  {
    enemy1[x]= new enemyType1(random(0, width), random(0, height), 10, random(-2, 2), random(-2, 2));
  }
  for (int x=0; x < 50; x++)
  {
    enemy2[x]= new enemyType2(random(0, width), random(0, height), 10, random(-4, 4), random(-4, 4));
  }
  for (int x=0; x < 50; x++)
  {
    enemy3[x]= new enemyType3(random(0, width), random(0, height), 10, random(-10, 10), random(-10, 10));
  }
}

void draw()
{
  if (sceneNum ==  0)
  {
    menu();
  }
  if (sceneNum ==  1)
  {
    mainCode();
  }
  if (sceneNum ==  2)
  {
    gameOver();
  }
}

void menu()
{
  textSize(50);
  text("LEVEL SELECT", width/2, height/8);
  text("\n 1:Easy", width/2, height/8);
  text("\n\n 2:Medium", width/2, height/8);
  text("\n\n\n 3:Hard", width/2, height/8);
  text("\n\n\n\n 4:Extreme", width/2, height/8);
  if (keyPressed)
  {
    if (key == '1')
    {
      count = 50;
      count1 = 5;
      count2 = 2;
      sceneNum = 1;
      text(count, 100, 100);
      gameTime = millis();
    }
    if (key == '2')
    {
      count = 100;
      count1 = 10;
      count2 = 5;
      sceneNum = 1;
      text(count, 100, 100);
      gameTime = millis();
    }
    if (key == '3')
    {
      count = 250;
      count1 = 25;
      count2 = 10;
      sceneNum = 1;
      text(count, 100, 100);
      gameTime = millis();
    }
    if (key == '4')
    {
      count = 500;
      count1 = 50;
      count2 = 25;
      sceneNum = 1;
      text(count, 100, 100);
      gameTime = millis();
    }
  }
}

void mainCode()
{
  background(0);
  fill(c, 255, 255);
  P1.Draw();
  P1.Move();
  for (int a=0; a < count; a++)
  {
    fill(283, 128, 255);
    enemy1[a].Draw();
    enemy1[a].Move();
    if ( enemy1[a].Collision(P1, enemy1[a]))
    {

      if (millis()- startTime > invulnTime)
      {
        P1.health = P1.health-10;
        c = c-10;
        injury.play();
        injury.rewind();
        startTime = millis();
      }
    }
  }
  for (int a=0; a < count1; a++)
  {
    fill(313, 76, 99);
    enemy2[a].Draw();
    enemy2[a].Move();
    if ( enemy2[a].Collision(P1, enemy2[a]))
    {

      if (millis()- startTime > invulnTime)
      {
        P1.health = P1.health-10;
        c = c-10;
        injury.play();
        injury.rewind();
        startTime = millis();
      }
    }
  }
for (int a=0; a < count2; a++)
  {
    fill(195, 76, 99);
    enemy3[a].Draw();
    enemy3[a].Move();
    if ( enemy3[a].Collision(P1, enemy3[a]))
    {

      if (millis()- startTime > invulnTime)
      {
        P1.health = P1.health-10;
        c = c-10;
        injury.play();
        injury.rewind();
        startTime = millis();
      }
    }
  }


  if (P1.health <= 0)
  {
    background(255);
    sceneNum = 2;
  }

  if (P1.health > 0)
  {
    endTime = millis();
  }
}


void gameOver()
{
  fill(255, 0, 0);
  textSize(50);
  text("GAME OVER", height/2, width/2);
  text(endTime - gameTime, width/2, height/4);
}