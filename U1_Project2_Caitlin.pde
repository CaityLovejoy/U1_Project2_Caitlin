Player Player1;
enemyType1[] e;
int count = 50;

void setup()
{
  fullScreen();
  Player1 = new Player(10,10,10,10,10,100);
  e = new enemyType1[count];
  for (int x=0; x < count; x++)
  {
    e[x]= new enemyType1(random(0,width),random(0,height),5,random(-2,2),random(-2,2));
  }
 }

void draw()
{
  background(0);
  Player1.Draw();
  Player1.Move();
 for(int a=0; a < count; a++)
 {
  e[a].Draw();
  e[a].Move();
 }

}