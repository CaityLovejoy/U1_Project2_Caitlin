class baseEntity
{
  float x;
  float y;
  int size;
  float xVel;
  float yVel;

  baseEntity()
  {
    x=0;
    y=0;
    size=100;
    xVel=0;
    yVel=0;
  }

  baseEntity(float _x, float _y, int _size, float _xVel, float _yVel)
  { 
    x = _x;
    y = _y;
    size = _size;
    xVel = _xVel;
    yVel = _yVel;
  }

  void SetVelocity(float _xVel, float _yVel)
  { 
    xVel = _xVel;
    yVel = _yVel;
  }

  boolean Collision(baseEntity a1, baseEntity a2)
  {
    float distance = dist(a1.x, a1.y, a2.x, a2.y);
    if (distance < a1.size +a2.size)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void SetPosition(float _x, float _y)
  {
    x = _x;
    y = _y;
  }

  void Draw()
  {
    ellipse(x, y, size, size);
  }

  void Move()
  { 
    if (keyPressed && key == 'w')
    {
      y-= yVel;
    }
    if (keyPressed && key == 's')
    {
      y+= yVel;
    }
    if (keyPressed && key == 'a')
    {
      x-= xVel;
    }
    if (keyPressed && key == 'd')
    {
      x+= xVel;
    }
  }
}