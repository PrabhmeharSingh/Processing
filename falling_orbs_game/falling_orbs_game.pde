void setup()
{
  size(500, 500);

  for (int i=0; i<=4; i++)
  {
    x[i]=80*(i+1);
  }
}
float n[]={0, 0, 0, 0, 0}, y[]={30, 30, 30, 30, 30}, s[]={random(5, 15), random(5, 15), random(5, 15), random(5, 15), random(5, 15)}, d[]={random(20, 50), random(20, 50), random(20, 50), random(20, 50), random(20, 50)};
int i, score=0;
float x[]=new float[5];
void go()
{
  fill(255, 0, 255);
  textSize(50);
  text("GAME OVER", 100, 250);
}
void draw()
{
 noCursor();
  background(0);
  if ((mouseX>0)&&(mouseX<500))
  {
    fill(255, 0, 0);
    ellipse(mouseX, 410, 10, 10);
    for (i=0; i<=4; i++)
    {
      if ((y[i]+s[i])>=470)
      {
        score++;
        y[i]=30;
        s[i]=random(5, 15);

        x[i]=random(30, 470);
        d[i]=random(20, 50);
      }
      n[i]=sqrt((((d[i])/2)*((d[i])/2))-((mouseX-x[i])*(mouseX-x[i])));
      fill(255);
      ellipse(x[i], y[i], d[i], d[i]);
      y[i]=y[i]+s[i];
      if (((mouseX>=x[i]-d[i]/2)&&(mouseX<=x[i]+d[i]/2))&&((410>=y[i]-n[i])&&(410<=y[i]+n[i])))
      {

        go();
        noLoop();
      }
    }
    fill(0, 255, 0);
    textSize(30);
    text("score =", 300, 50);
    fill(0, 255, 255);
    textSize(30);
    text(score, 420, 50);
  } else
  {
    fill(255, 0, 255);
    textSize(46);
    text("GAME PAUSED", 100, 250);
  }
}
