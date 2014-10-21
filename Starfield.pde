Particle[] stars;
void setup()
{
  background(0);
  size(500, 500);
  stars=new Particle[200];
  for (int i=0; i<198; i++) 
  {
    stars[i]=new NormalParticle();
  }
  stars[199]=new OddballParticle();
  stars[198]=new JumboParticle();
}
void draw()
{
  background(0);
  for (int i=0; i<200; i++) 
  {
    stars[i].move();
    stars[i].show();
  }
}
class NormalParticle implements Particle
{
  int myColor, nSize;
  double myX, myY, mySpeed, myAngle;
  NormalParticle()
  {
    myColor= color ((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    myX=250;
    myY=250;
    mySpeed= Math.random()*5;
    myAngle=Math.PI*2*Math.random();
    nSize=10;
  }
  public void move()
  {
    myAngle+=0.01;
    myX+=Math.cos(myAngle)*mySpeed;
    myY+=Math.sin(myAngle)*mySpeed;  
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((int)myX, (int)myY, nSize, nSize);
  }
}
interface Particle
{
  public void move();
  public void show();
}
class OddballParticle implements Particle
{
  double myX, myY, mySpeed, myAngle;
  OddballParticle()
  {
    myX=250;
    myY=250;
    mySpeed=Math.random()*15;
    myAngle=Math.PI*2*Math.random();
  }
  public void move()
  {
    myAngle+=0.05;
    myX+=Math.cos(myAngle)*mySpeed;
    myY+=Math.sin(myAngle)*mySpeed;  
  }
  public void show() 
  {
    noStroke();
    fill(255);
    ellipse((int)myX, (int)myY, 20, 20);
  }
}

class JumboParticle extends NormalParticle
{
  JumboParticle()
  {
    nSize=45;
  }
}
