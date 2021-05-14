import processing.serial.*;

Serial myPort;

boolean Connection = false;
String gameState = "Menu";
int keyState = 0;
PImage Floor;
PImage Wall;
PImage Key;
PImage Door;
String DState;
String SState;
String AState;
String WState;
int Px = 225;
int Py = 25;

void setup()
{
  size(1200,1000);
  ellipseMode(CENTER);
  textAlign(CENTER);
  Floor = loadImage("floor.png");
  Floor.resize(1000,1000);
  Wall = loadImage("wall.jpeg");
  Wall.resize(50,50);
  Key  = loadImage("key.png");
  Key.resize(50,50);
  Door = loadImage("door.png");
  Door.resize(50,50);
  
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
}
void draw()
{
  background(#000000);
  //print(inByte);
  if(gameState == "Menu")
  {
    Menu();
  }
  else if(gameState == "Game")
  {
    Game();
    if(mouseX < width/2)
    {
       keyState = 1; 
    }
  }
  myPort.write(keyState);
}

void serialEvent(Serial myPort)
{
  if(myPort.available() > 0)
  {
    int inByte = myPort.read();
    if(Connection == false)
    {
       if(inByte == 'X')
       {
         myPort.clear();
         Connection = true;
         myPort.write(0);
       }
    }
    else
    {
       if(inByte == 'A')
       {
         gameState = "Game";
         println("A");
       }
       else if(inByte == 'B')
       {
         gameState = "Menu";
         println("B");
       }
    }
  }  
}
void Menu()
{
  //background(255,0,0);
  image(Floor, 100, 0);
  fill(0);
  textSize(50);
  text("Welcome to the Maze Game!", width/2, height/4);
  text("Press ENTER to proceed.", width/2, height/3);
}
void Game()
{
  Instructions();
  image(Floor, 200, 0);
  fill(#00ff04);
  rect(200,0, 50,50);//start
  fill(#ff0000);
  rect(1150,950,50,50);//finish
  image(Key, 300, 0);
  image(Door, 200,900);
  image(Wall, 500, 600);
  fill(#00b7ff);
  ellipse(Px, Py, 50, 50);//player
  for(int y = 0; y<450; y += 50)
  {
    image(Wall, 250, y);
    image(Wall, 250, y+500);
    image(Wall, 450, y+100);
  }
  for(int x = 300; x <1150; x+=50)
  {
    image(Wall, x, 50);
  }
  for(int x = 300; x <=1150; x+=50)
  {
    image(Wall, x, 900);
  }
  for(int y = 150; y < 850; y += 50)
  {
    image(Wall, 350, y);
  }
  for(int y = 600; y < 950; y += 50)
  {
    image(Wall, 450, y);
  }
  for(int x = 500; x < 1150; x += 50)
  {
     image(Wall, x, 250); 
     image(Wall, x, 450);
     image(Wall, x+50, 150);
     image(Wall, x+50, 350);
  }
  for(int y = 600; y < 750; y += 50)
  {
    image(Wall, 550, y);
    image(Wall, 1000, y+50);
  }
  for(int y = 450; y < 850; y += 50)
  {
    image(Wall, 1100, y);
  }
  for(int x = 550; x < 1050; x += 50)
  {
    image(Wall, x, 550);
  }
  for(int x = 650; x < 1000; x += 50)
  {
    image(Wall, x, 700);
    image(Wall, x, 650);
  }
  for(int x = 550; x < 1100; x += 50)
  {  
    image(Wall, x, 800);
  } 
}
void Instructions()
{
  fill(255);
  textSize(20);
  text("Instructions:",100, 100);
  text("W: move up",100, 200);
  text("A: move left",100, 250);
  text("S: move down",100, 300);
  text("D: move right",100, 350);
}
