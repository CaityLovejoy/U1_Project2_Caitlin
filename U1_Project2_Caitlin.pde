Player P1;
enemyType1[] e;
int count = 50;
boolean isAvailable = true;

void setup()
{
  fullScreen();
  P1 = new Player(10, 10, 10, 5, 5, 100);
  e = new enemyType1[count];
  for (int x=0; x < count; x++)
  {
    e[x]= new enemyType1(random(0, width), random(0, height), 5, random(-2, 2), random(-2, 2));
  }
}

void draw()
{
  background(0);
  P1.Draw();
  P1.Move();
  text(P1.health, 100, 100);
  for (int a=0; a < count; a++)
  {
    e[a].Draw();
    e[a].Move();
    if ( e[a].Collision(P1, e[a]))
    {
      P1.health = P1.health-10;
    }
    if (P1.health <= 0)
    {
      gameover();
      background(255);
      break;
    }
  }

  void gameover()
  {
    text("GAME OVER", 200, 200)
  }
}