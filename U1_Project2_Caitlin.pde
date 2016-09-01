Player Player1;

void setup()
{
  fullScreen();
  Player1 = new Player(10,10,10,10,10,100);
 }

void draw()
{
  Player1.Draw();
  Player1.Move();
}