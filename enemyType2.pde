class enemyType2 extends baseEntity
{
  enemyType2()
  {
    super();
  }

  enemyType2(float _x, float _y, int _size, float _xVel, float _yVel)
  {
    super(_x, _y, _size, _xVel, _yVel);
  }

  void Move()
  {
    x+= xVel;
    y+= yVel;
    if (x > width || x < 0)
    {
      xVel *= -1;
      x+= xVel;
    }
    if (y > height || y < 0)
    {
      x+= xVel;
      yVel *= -1;
    }
  }
}