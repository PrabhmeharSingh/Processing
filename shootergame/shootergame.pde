void setup()
{
  size(500, 500);
}
float thetadfinder(float ang)
{
  return 180*ang/PI;
}

float velfinder(float mx, float my)
{
  float velocity;
  velocity=sqrt(sq(mx-100)+sq(my-350));
  if (velocity<22)
  {  
    velocity=22;
  } else if (velocity>97)
  {  
    velocity=97;
  }
  return velocity;
}  

float thetafinder(float mx, float my)
{
  float pr, ba;
  pr=my-350;
  ba=100-mx;
  float angle;
  angle=atan(pr/ba);
  return angle;
}
void activeangleguide(float a, float b, float ang)
{
  float aagx=100+mals*cos(ang);
  float aagy=350-mals*sin(ang);
  stroke(0);
  strokeWeight(4);
  line(a, b, aagx, aagy);
}
float p=0, r=0;//press and release
float theta=0, vel=0; 
float thetad;
final int cliffx=0, cliffy=350, cliffw=100, cliffh=150;//cliff parameters
float ballx=cliffx+cliffw, bally=cliffy;//starting position of cannonball
final int ballsize=50;//diameter of cannonball
final int tn=round(random(3, 9));    //green target no.
int tc;                    //target colour(red or green)
final int tw=50, th=25; //target width and height
final float mals=75;//minimum and max angle line size
float t=0;
void posfinder(float time, float v)
{
  ballx=100+v*cos(theta)*time;
  bally=350-v*sin(theta)*time+16*time*time;//- sign used because pr is taken mouseY-500 instead of 500-mouseY which would result in -sin(theta)
}
void draw()
{
  float n;
  n=sqrt(sq(ballsize/2)-sq(mouseX-ballx));
  if (r!=2)
  {
    background(#62ADED);
    strokeWeight(1);
    fill(#A2590F);
    rect(cliffx, cliffy, cliffw, cliffh);
    if ((mouseX>=100-ballsize/2)&&(mouseX<=100+ballsize/2)&&(mouseY>=350-n)&&(mouseY<=350+n))
    {
      if (mousePressed==true)
      {
        p=1;
      }
    }
    if ((p==1)&&(r==0))
    {
      fill(255, 255, 0);
      ellipse(100, 350, ballsize, ballsize);
    }

    if ((mouseX>0)&&(mouseY<500)&&(mouseX<100)&&(mouseY>350)&&(p==1)&&(r==0))
    {
      theta=thetafinder(mouseX, mouseY);
      thetad=thetadfinder(theta);
      vel=velfinder(mouseX, mouseY);
      ballx=mouseX;
      bally=mouseY;
      activeangleguide(mouseX, mouseY, theta);
    }
    if (r==1)
    {

      posfinder(t, vel);
    }
    strokeWeight(1);
    fill(255, 255, 0);
    ellipse(ballx, bally, ballsize, ballsize);
    for (int i=3; i<=9; i++)
    {
      if (i!=tn)
      {
        tc=#FF0000;
      } else
      {
        tc=#00FF00;
      }
      fill(tc);
      rect(i*50, 475, tw, th);
    }
    strokeWeight(2);
    fill(0);
    line(100, 350, 100+mals, 350);//minimum angle guide
    line(100, 350, 100, 350-mals);//maximum angle guide 
    textSize(15);
    text("INSTRUCTIONS", 10, 30);
    text("1.TO START MOVE CANNONBALL AWAY", 10, 50);
    text("2.CHANGE ANGLE OF PROJECTILE WITHIN THE GUIDES", 10, 70);
    text("3.CHANGE SPEED OF THE CANNONBALL BY PULLING AWAY", 10, 90);
    text("4.RELEASE CANNONBALL TO FIRE SHOT", 10, 110);
    textSize(20);
    fill(0);
    text("THETA =", 290, 130);
    text(thetad, 410, 130);
    text("VELOCITY =", 290, 170);
    text(vel, 410, 170);
    if ((bally>=450)&&(r==1))
    {

      r=2;//signifies game ended
    }
    t+=0.1;
  } else
  {
    over();
  }
}
void over()
{
  fill(0);
  square(0, 0, 500);
  if ((ballx>=tn*50)&&(ballx<=(tn+1)*50))
  {
    fill(255);
    textSize(25);
    text("YOU WIN:)", 180, 200);
  } else
  {
    fill(255, 0, 0);
    textSize(25);
    text("YOU LOSE:(", 180, 200);
  }
  fill(255);
  rect(215, 395, 60, 30);
  fill(0);
  text("EXIT", 220, 420);
  if ((mouseX>225)&&(mouseX<285)&&(mouseY>395)&&(mouseY<425))
  {
    if (mousePressed==true)
      exit();
  }
}

void mouseReleased()
{
  if ((p==1)&&(r==0))// to watch game replay on mouse click remove r==0 condition
  {
    r=1;
    t=0;
  }
}
