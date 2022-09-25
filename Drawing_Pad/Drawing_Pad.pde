void setup()
{
  size(1920, 1080);
  background(0);
  fill(100);
  rect(0, 0, 400, 1080);
  fill(255);
  rect(400, 0, 1520, 1080);
  textSize(20);
  fill(255);
  text("Background Colour", 20, 50);
  textSize(20);
  fill(255);
  text("Stroke Colour", 20, 170);
  textSize(20);
  fill(255);
  text("Stroke Width", 20, 290);
  fill(255);
  rect(20, 800, 150, 30);
  textSize(20);
  fill(0);
  text("Clear Canvas", 30, 820);
  for (int i=0; i<=4; i++)
  {
    
    fill(255);
    square(40*(i+1)-20, 320, 40);
    strokeWeight(2*(i+1));
    fill(0);
    line(40*(i+1), 320+(2*(i+1)),40*(i+1),360-(2*(i+1)));
    strokeWeight(1);
  }
  for (int i=0; i<=8; i++)
  {
    if (i==0)
      bg=#8F00FF;
    if (i==1)
      bg=#4B0082;
    if (i==2)
      bg=#0000FF;
    if (i==3)
      bg=#00FF00;
    if (i==4)
      bg=#FFFF00;
    if (i==5)
      bg=#FFA500;
    if (i==6)
      bg=#FF0000;
    if (i==7)
      bg=255;
    if (i==8)
      bg=0;
    fill(bg);
    square(40*(i+1)-20, 80, 40);
    fill(bg);
    square(40*(i+1)-20, 200, 40);
  }
}
int x=255, bg, j, k, l, y=0, z=2;
void draw()
{
  if (mouseX<=400)
  {
    if (mousePressed==true)
    {
      if ((mouseX>19)&&(mouseX<171)&&(mouseY>=800)&&(mouseY<=830))
      { 
        fill(x);
        rect(400, 0, 1520, 1080);
      } else if ((mouseX>=20)&&(mouseX<=220)&&(mouseY>=320)&&(mouseY<=360))
      {
        for (l=0; l<=4; l++)
        {
          if ((mouseX>=40*(l+1)-20)&&(mouseX<=40*(l+2)-20))
          {
            z=2*(l+1);
          }
        }
      } else if ((mouseX>=20)&&(mouseX<=380)&&(mouseY>=80)&&(mouseY<=120))
      {
        for ( j=0; j<=8; j++)
        { 
          if ((mouseX>=40*(j+1)-20)&&(mouseX<=40*(j+2)-20))
          {
            break;
          }
        }
        if (j==0)
          x=#8F00FF;
        if (j==1)
          x=#4B0082;
        if (j==2)
          x=#0000FF;
        if (j==3)
          x=#00FF00;
        if (j==4)
          x=#FFFF00;
        if (j==5)
          x=#FFA500;
        if (j==6)
          x=#FF0000;
        if (j==7)
          x=255;
        if (j==8)
          x=0;
        fill(x);
        rect(400, 0, 1520, 1080);
      } else if ((mouseX>=20)&&(mouseX<=380)&&(mouseY>=200)&&(mouseY<=240))
      {
        for ( k=0; k<=8; k++)
        { 
          if ((mouseX>=40*(k+1)-20)&&(mouseX<=40*(k+2)-20))
          {
            break;
          }
        }
        if (k==0)
          y=#8F00FF;
        if (k==1)
          y=#4B0082;
        if (k==2)
          y=#0000FF;
        if (k==3)
          y=#00FF00;
        if (k==4)
          y=#FFFF00;
        if (k==5)
          y=#FFA500;
        if (k==6)
          y=#FF0000;
        if (k==7)
          y=255;
        if (k==8)
          y=0;
      }
    }
  }
}
void mouseDragged()
{
  if (mouseX>400)
  {
    strokeWeight(z);
    stroke(y);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
