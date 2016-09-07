class Player extends baseEntity
{
   int health;
   boolean isAvailable = true;
   
  Player()
  {
    super();
    health = 100;
  }
  
  Player(float _x, float _y, int _size, float _xVel, float _yVel, int _health)
  {  
    super(_x, _y, _size, _xVel, _yVel);
    health = _health;
  }
 
 void Move()
 {
  super.Move();
 }
 
  void invincibilty()
  {
  }
 
}