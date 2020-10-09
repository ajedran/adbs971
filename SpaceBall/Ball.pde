class Ball
{
  PVector p; //position of ball
  PVector v; //velocity of ball
  int r; //radius of ball
  color c; //colour of ball
  float a; //angle

  //initalise ball state
  Ball()
  {
    a=random(-PI/4, PI/4);
    p = new PVector (width/2, height/2);
    v = new PVector (2*cos(a), 2*sin(a));
    r = 17;
    c = color(random(255), random(255), (255));
  }

  //draw ball at current position
  void draw()
  {
    fill(c);
    ellipse(p.x, p.y, r*2, r*2);
  }

  //reset method
  void reset() {
    a=random(-PI/4, PI/4);
    p.x=width/2;
    p.y=height/2;
    v.x=2*cos(a); 
    v.y=2*sin(a);
    p1x=40;
    p1y=240;
    p2x=484;
    p2y=240;
  }

  //move ball according to its velocity
  void move()
  {
    p.x = p.x + v.x;
    p.y = p.y + v.y;

    if (p.x-r < 0 && v.x < 0)
    {
      //ball escaping to left, move back in
      v.x = -1*v.x;
    } else if (p.x+r > width && v.x > 0)
    {
      //ball escaping to right, move back in
      v.x = -1*v.x;
    }

    if (p.y-r < 0 && v.y <0)
    {
      //escaping up, move back down
      v.y = -1*v.y;
    } else if (p.y+r > height && v.y > 0)
    {
      //escaping down, move back up
      v.y = -1*v.y;
    }
    ////////////////////////////////////////
    //goal detection
    if (p.x-r<40) {
      println("Goal Player 2!");
      p2s.play();
      P2Score++;
      reset();
    }

    if (p.x+r>560) {
      println("Goal Player 1!");
      p1s.play();
      P1Score++;
      reset();
    }
    ///////////////////////////////////////////
    //player 1 collisions
    if (((ball1.p.x)+(ball1.r))> p1x && ((ball1.p.x)-(ball1.r))<(p1x+76)) {
      //if right side of ball > back of p1 and if left side of ball < front of p1
      if (((ball1.p.y)+(ball1.r))> p1y && ((ball1.p.y)-(ball1.r))<(p1y+120)) {
        //if bottom of ball > top of p1 and if top of ball > bottom of p1
        //v.x=-1*v.x;
        //v.y=-1*v.y;
        float diff = ball1.p.y - (p1y);
        float rad=radians(45);
        float ang = map(diff, 0, 120, -rad, rad);
        v.x=2*cos(ang);
        v.y=2*sin(ang);
      }
    }

    //player 2 collisions
    if (((ball1.p.x)+(ball1.r))>p2x && ((ball1.p.x)-(ball1.r))<(p2x+76)) {
      //if right ball > front of p1 and if left ball < back p2
      if (((ball1.p.y)+(ball1.r))>p2y && ((ball1.p.y)-(ball1.r))<(p2y+120)) {
        //v.x=-1*v.x;
        //v.y=-1*v.y;
        float diff = ball1.p.y - (p2y);
        float rad=radians(135);
        float ang = map(diff, 0, 120, -rad, rad);
        v.x=2*cos(ang);
        v.y=2*sin(ang);
      }
    }
  } //move bracket
} //class bracket
