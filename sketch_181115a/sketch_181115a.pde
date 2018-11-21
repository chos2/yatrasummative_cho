PImage cliff;
PImage man;
PImage rock;
float x =700;
float y =205;
float X =500;
float Y =650;
int scene = 0;
PImage dead;
PImage alive;
import processing.sound.*;
SoundFile file;
SoundFile crush;

void setup()
{
  size (800, 800);

  cliff = loadImage("cliff.jpg");
  man = loadImage("man.png");
  rock = loadImage("rock.png");
  dead = loadImage("dead.jpg");
  alive = loadImage("alive.jpg");
file = new SoundFile(this, "watersound.mp3");
crush = new SoundFile(this, "crushing.mp3");
file.play();


}




void draw()
{
  if (scene== 0)
  {
    game();
  }

  if (scene== 1)
  {
    gameover();
  }

  if (scene== 2)
  {
    alive();
  }
}





void gameover()
{
  background(dead);
  textSize(100);
  text("You're Dead", 100, 200);
}

void game()
{
  background(cliff);
  image(man, x, y, 100, 100);


  if (keyCode == RIGHT)
    x+=7;

  if (keyCode == LEFT)
    x-=7;


  if (keyCode == DOWN)
    y+=7;


  image (rock, X, Y, 100, 100);

  X = X-15;
  if ( X < 0)
  {
    X =500;
  }

  if (dist(x, y, X, Y)<50)
  {
    scene = 1;
    x=700;
    y=205;
    crush.play();
  }

  if ( y>800)
  { 
    x=700;
    y=205;
    scene = 2;
  }

}
void keyPressed()
{
  if (scene==1 || scene ==2  )
  {
    if (key =='r' || key =='R')
    {
      scene=0;
      
    }
  }
}

void alive()
{
  background(alive);
  textSize(100);
  text("You lived", 100, 200);
}
