import processing.serial.*;

Serial myPort;

boolean Connection = false;
String gameState = "Menu";
int keyState = 0;

void setup()
{
  size(500,500);
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
}
void draw()
{
  background(255);
  //print(inByte);
  if(myPort.available() >0)
  {
    int inByte = myPort.read();
    print(inByte);
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
      if(gameState == "Menu")
      {
         if(inByte == 'A')
         {
           gameState = "Game";
         }
         Menu();
      }
      else if(gameState == "Game")
      {
         if(inByte == 'B')
         {
           gameState = "Menu";
         }
         Game();
         if(mouseX < width/2)
         {
           keyState = 1;
           myPort.write(keyState);
         }
      }
    }
  }
}

void Menu()
{
  background(255,0,0);
}
void Game()
{
  background(0,255,0);
}
