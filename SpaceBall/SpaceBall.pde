import processing.sound.*;

PImage bgr;
PImage p1;
PImage p2;
float p1x, p1y, p2x, p2y;
Ball ball1;
float dlbf1, drbf2, dbbt1, dbbt2, dtbb1, dtbb2, drbb1, dlbb2;
int spd; //player move speed
int P1Score=0;
int P2Score=0;
SoundFile p1s, p2s;
int winScore=5;



void setup()
{
  size(600, 360);
  bgr = loadImage("SFBackground.jpg");
  ball1 = new Ball();
  p1 = loadImage("player1.png");
  p2 = loadImage("player2.png");
  spd = 13;
  p1s = new SoundFile(this, "p1goal.wav");
  p2s = new SoundFile(this, "p2goal.wav");

  //player sprite dimensions are (76,120)

  p1x=40;
  p1y=240;
  p2x=484;
  p2y=240;
}

void draw()
{
  image(bgr, 0, 0);
  ball1.draw();
  ball1.move();
  image(p1, p1x, p1y);
  image(p2, p2x, p2y);
  drawGoal();

  fill(255);
  textSize(26);
  text(P1Score, 45, 30);
  text(P2Score, width-60, 30);
  
  if (P1Score == winScore){
    ball1.v.x = 0; 
    ball1.v.y = 0;
    textSize(70);
    textAlign(CENTER, CENTER);
    fill(#FFFF00);
    text("PLAYER 1 WINS",width/2,height/2);
  }
    
if (P2Score == winScore){
    ball1.v.x = 0; 
    ball1.v.y = 0;
    textSize(70);
    textAlign(CENTER, CENTER);
    fill(#FFFF00);
    text("PLAYER 2 WINS",width/2,height/2);
  }    

  //distances between (for debugging purposes)
  //dlbf1=((ball1.p.x)-(ball1.r))-(p1x+76); //left side of ball - front of p1
  //drbf2=((ball1.p.x)+(ball1.r))-p2x; //right side of ball - front of p2
  //dbbt1=((ball1.p.y)+(ball1.r))-p1y; //bottom of ball - top of p1
  //dbbt2=((ball1.p.y)+(ball1.r))-p2y; //bottom of ball - top of p2
  //dtbb1=((ball1.p.y)-(ball1.r))-(p1y+120); //top of ball - bottom of p1
  //dtbb2=((ball1.p.y)-(ball1.r))-(p2y+120); //top of ball - bottom of p2
  //drbb1=((ball1.p.x)+(ball1.r))-p1x; //right side of ball - back of p1
  //dlbb2=((ball1.p.x)-(ball1.r))-(p2x+76); //left side of ball - back of p2
}


void drawGoal()
{
  fill(255, 255, 255, 180);
  rect(0, 0, 40, height); //left goal
  rect(560, 0, 40, height); //right goal
}

void keyPressed()
{
  //PLAYER 2 CONTROLS
  if (keyCode == UP)
  {
    if (p2y==0) {
    } else
    {
      p2y=p2y-spd;
    }
  }

  if (keyCode == DOWN)
  {
    if (p2y==240) {
    } else
    {
      p2y=p2y+spd;
    }
  }


  if (keyCode == LEFT)
  {
    if (p2x==44) {
    } else
    {
      p2x=p2x-spd;
    }
  }

  if (keyCode == RIGHT)
  {
    if (p2x==484) {
    } else
    {
      p2x=p2x+spd;
    }
  }

  //PLAYER ONE CONTROLS
  if (key == 'W' || key == 'w')
  {
    if (p1y==0) {
    } else
    {
      p1y=p1y-spd;
    }
  }

  if (key == 'S' || key == 's')
  {
    if (p1y==240) {
    } else
    {
      p1y=p1y+spd;
    }
  }


  if (key == 'A'|| key == 'a')
  {
    if (p1x==40) {
    } else
    {
      p1x=p1x-spd;
    }
  }

  if (key == 'D' || key == 'd')
  {
    if (p1x==480) {
    } else
    {
      p1x=p1x+spd;
    }
  }
}
