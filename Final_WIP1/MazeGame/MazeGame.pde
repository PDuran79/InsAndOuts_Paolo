//Maze Game 
PImage Floor;
PImage Wall;
PImage Key;
PImage Door;
String keyState = "Don't Have";
String gameState = "Level 1";
void setup()
{
  size(800,800);
  Floor = loadImage("floor.png");
  Floor.resize(800,800);
  Wall = loadImage("wall.jpeg");
  Wall.resize(100,100);
  Key  = loadImage("key.png");
  Key.resize(100,100);
  Door = loadImage("door.png");
  Door.resize(100,100);
}
void draw()
{
  background(Floor);
  if(gameState == "Menu")
  {
    
  }
  else if(gameState == "Tutorial")
  {
    
  }
  else if(gameState == "Level 1")
  {
    fill(#00ff04);
    rect(0,0, 100,100);//start
    fill(#ff0000);
    rect(500,500,100,100);//finish
    image(Key, 300, 200);
  }
  else if(gameState == "Level 2")
  {
    
  }
  else if(gameState == "Level 3")
  {
    
  }
  else if(gameState == "End Game")
  {
    
  }
} 
void keyPressed()
{
   if(key == 'w')
   {
     
   }
   else if(key == 'a')
   {
     
   }
   else if(key == 's')
   {
     
   }
   else if(key == 'd')
   {
     
   }
}
