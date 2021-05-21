/*
Paolo Duran
Maze Game
*/
import processing.serial.*;

Serial myPort;

player P1;
wall[] walls;

int Px;//x value from joystick
int Py;//y value from joystick
int H = 225;//x(horizontal) value for player 
int V = 25;//y(vertical) value for player
int msg;//button read
String portName;
String val;//value from arduino
String State = "Menu";//game state
PImage Floor;//floor image
PImage Key;//key image
PImage Door;// door image
int keyState;//keystate

//Joystick code based off: https://lastminuteengineers.com/joystick-interfacing-arduino-processing/
//Player and wall code based off: https://forum.processing.org/two/discussion/1028/maze (from user: billautomata)
void setup()
{
  size(1200,1000);
  ellipseMode(CENTER);
  textAlign(CENTER);
  Floor = loadImage("floor.png");
  Floor.resize(1000,1000);
  Key = loadImage("key.png");
  Key.resize(50,50);
  Door = loadImage("door.png");
  Door.resize(50,50);
  P1 = new player(H, V);
  walls = new wall[18];
  walls[0] = new wall(250, 0, 50, 450);//wall V1
  walls[1] = new wall(250, 50, 900, 50);//wall H1
  walls[2] = new wall(250, 500, 50, 450);//wall V2
  walls[3] = new wall(350, 150, 50, 700);//wall V3
  walls[4] = new wall(250, 900, 950, 50);//wall H10
  walls[5] = new wall(450, 50, 50, 500);//wall V4
  walls[6] = new wall(550, 150, 650, 50);//wall H2
  walls[7] = new wall(450, 250, 700, 50);//wall H3
  walls[8] = new wall(550, 350, 650, 50);//wall H4
  walls[9] = new wall(450, 450, 700, 50);//wall H5
  walls[10] = new wall(450, 600, 50, 350);//wall V5
  walls[11] = new wall(550, 550, 500, 50);//wall H6
  walls[12] = new wall(550, 550, 50, 200);//wall V6
  walls[13] = new wall(450, 600, 150, 50);//wall H7
  walls[14] = new wall(1000, 650, 50, 200);//wall V7
  walls[15] = new wall(650, 650, 400, 100);//wall H8
  walls[16] = new wall(1100, 450, 50, 400);//wall V8
  walls[17] = new wall(550, 800, 600, 50);//wall H9
  
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');
}
void draw()
{
  background(#000000);
  if(State == "Menu")
  {
    Menu();
  }
  else if(State == "Game")
  {
    Game();
  }
  else if(State == "End")
  {
    End();
  }
  myPort.write(keyState);
}
class player//create player and movement
{
  int x;//x pos of player
  int y;//y pos of player
   player(int Mx, int My)
   {
      x = Mx; 
      y = My;
   }
   void draw()
   {
       fill(#00b7ff);
       ellipse(x, y, 50, 50);//player
   }
   void move(wall[] walls)//movement/collision
   {
     int possibleX = x;
     int possibleY = y;
     boolean didCollide = false;
     println("X: "+ possibleX);
     println("Y: "+ possibleY);
     println("Key: " + keyState);
     if(val!= null)
     {
       if(Px < 500)
       {
         possibleX -= 5; 
       }
       else if(Px > 520)
       {
         possibleX += 5;
       }
       if(Py< 490)
       {
         possibleY -= 5; 
       }
       else if(Py > 510)
       {
         possibleY += 5;
       }
     }
     if(possibleY > 925)//doorclosed key needed
     {
       didCollide = true;
     }
     if(possibleY > 925 && keyState >= 1)//you have key
     {
        didCollide = false; 
     }
     if(possibleX > (width -25) || possibleX < 225)//Xaxis overscreen
     {
        didCollide =true; 
     }
     if(possibleY > (height-25) || possibleY < 25)//Yaxis overscreen
     {
        didCollide = true; 
     }
     if(possibleX == (width-25) && possibleY == (height-25))//gotten to finish line
     {
        State = "End"; 
     }
     if(possibleX == 340 && possibleY == 25)
     {
         keyState+=1;
         didCollide = true;
     }
     for(int i = 0; i < walls.length; i++)//wall collision
     {
       if(possibleX > walls[i].x && possibleX < (walls[i].x + walls[i].w) && possibleY > walls[i].y && possibleY < walls[i].y + walls[i].h)
       {
          didCollide = true; 
       }
     }
     if(didCollide == false)
     {
       x = possibleX;
       y = possibleY;
     }
   }
}
class wall//create walls
{
  int x;//x of wall
  int y;//y of wall
  int w;//width of wall
  int h;//height of wall
  
  wall(int Wx, int Wy, int Ww, int Wh)
  {
     x = Wx;
     y = Wy;
     w = Ww;
     h = Wh;
  }
  void draw()
  {
     fill(#c1c0c0);
     noStroke();
     rect(x,y,w,h);
  }
}
void serialEvent(Serial myPort)//create connection between arduino & processing
{
  val = myPort.readStringUntil('\n');
  if(val != null)
  {
    val = trim(val);
    int[] vals = int(splitTokens(val, ","));
    Px = vals[0];
    Py = vals[1];
    msg = vals[2];
    if(msg == 'A')
    {
       State = "Game";
    }
    else if(msg == 'B')
    {
       State = "Menu";
    }
    else
    { 
    }  
  }
}
void Game()//create game level
{
  instructions();
  image(Floor, 200, 0);
  fill(#00ff04);
  rect(200,0, 50,50);//start
  image(Key,300,0);
  fill(#ff0000);
  rect(1150, 950,50,50);//finish
  image(Door,200, 900); 
  P1.draw();
  P1.move(walls);
  for(int i = 0; i <walls.length; i++)
  {
     walls[i].draw(); 
  }
}
void instructions()//create instructions tab
{
  fill(255);
  textSize(20);
  text("Instructions:",100, 100);
  text("JS ↑: move up",100, 200);
  text("JS ←: move left",100, 250);
  text("JS ↓: move down",100, 300);
  text("JS →: move right",100, 350);
}
void Menu()
{
   image(Floor, 100, 0);
   fill(0);
   textSize(50);
   text("Welcome to the Maze Game!", width/2, height/4);
   text("Press the A button to proceed.", width/2, height/3);
}
void End()//reset and end screen
{
  image(Floor, 100, 0);
  fill(0);
  textSize(100);
  text("Thanks for Playing!", width/2, height/4);
  //text("Press the B button to return to Menu", width/2, height/3);
}
