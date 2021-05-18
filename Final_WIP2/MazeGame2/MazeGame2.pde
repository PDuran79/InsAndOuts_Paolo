//Maze Game 
PImage Floor;
PImage Wall;
PImage Key;
PImage Door;
String keyState = "Don't Have";
String gameState = "Level 1";
Boolean DState = false;
Boolean SState = false;
Boolean AState = false;
Boolean WState = false;
int Px = 225;
int Py = 25;
int CTest = 26;
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
}
void draw()
{
  background(#000000);
  if(gameState == "Menu")
  {
    menu();
  }
  else if(gameState == "Level 1")
  {
    Level1();
    print(Px);
    if(Px == 225 && Py <950)
    {
      AState = false;
      DState = false;
      if(Py >= 25 && Py <= 925)
      {
         if(keyState == "Don't Have" && Py >= 875)
         {
           SState = false;
           WState = true;
         }
         else
         {
           SState = true;
           WState = true;
         }
         if(Py == 25)
         {
           WState = false;
           SState = true;
         }
         if(Py == 475)
         {
           if(Px >= 225 && Px <=325)
           {
              AState = true;
              DState = true;
              if(Px == 225)
              {AState = false;DState = true;}
              if(Px == 325)
              {AState = true;DState = false;}
           }
         }
      }
    }
    if(Px == 325 && Py <950)
    {
      DState = false;
      AState = false;
      if(Py == 475)
      {AState = true;DState = false;}
      if(Py >= 125 && Py <= 875)
      {
        WState = true;
        SState = true;
        if(Py == 125)
        {
          WState = false;
          SState = true;
          DState = true;
          AState = false;
        }
        if(Py == 875)
        {
          WState = true;
          SState = false;
          DState = true;
          AState = false;
        }
      }
      if(Py == 25)
      {
        DState = true;
        AState = false;
        WState = false;
        SState = false;
        keyState = "Have";
        if(Px >= 325 && Px <= 1175)
        {DState = true;AState = true;}
        if(Px == 325)
        {AState = false;DState = true;}
        if(Px == 1175)
        {AState = true;DState = false;}
      }
    }
    if(Px == 425 && Py < 950)
    {
      AState = false;DState = false;
      if(Py >= 125 && Py <= 875)
      {
        WState = true; SState = true;
        if(Py == 125)
        {AState = true;DState = false;WState = false;SState = true;}
        if(Py == 575)
        {DState = true;AState = false;
          if(Px == 525)
          {AState = true;
          DState = false; }
        }
        if(Py == 875)
        {AState = true;DState = false;SState = false;WState = true;}
      }
    }
    if(Px == 525)
    {
        WState = true;
        SState = true;
        if(Py == 575)
        {
          AState = true;
          DState = false;
          SState = false;
        }
        if(Py == 525)
        {
          AState = false;
          DState = true;
          WState = false;
          if(Px >= 525 && Px<= 1075)
          {
            AState = true;
            DState = true;
            if(Px == 525)
            {DState = true;AState = false;}
          }
        }
    }
    if(Px == 1075)
    {
      if(Py >= 525 && Py <= 775)
      {
        WState = true;
        SState = true;
        DState = false;
        AState = true;
        if(Py == 525)
        {SState = true;WState = false;}
        if(Py == 775)
        {SState = false;WState = true;AState = false;DState = false;}
        if(Py == 625)
        {
          AState = true;
          DState = false;
          /*
            if(Py >= 625 && Py <= 775)
            {
              WState = true; 
              SState = true;
              if(Py == 625)
              {
                SState = true;
                WState = false;
              }
              if(Py == 775)
              {
                SState = false;
                WState = true;
              }
            }
            */
         }
      }
    }
    if(Px == 625&& Py ==625)
    {
       AState = false;
       DState = true;
       WState = false;
       SState = false;
       if(Py > 625 && Py < 775)
       {
         WState = true;
         SState = true;
         AState = false;
         DState = false;
         if(Py == 625)
         {
           SState = true;
           WState = true;
           DState = true;
         }
         if(Py == 775)
         {
            WState = true;
            SState = true;
            DState = true;
            AState = true;
         }
       }
    }
  }
 
  else if(gameState == "End Game")
  {
    
  }
} 
void keyPressed()
{
   if(key == 'w')
   {
     if(WState == true)
     {
        Py -= 25;
     }
     else
     {
        Py +=0; 
     }
   }
   else if(key == 'a')
   {
     if(AState == true)
     {
       Px -=25;
     }
     else
     {
        Py +=0; 
     }
   }
   else if(key == 's')
   {
     if(SState == true)
     {
       Py +=25;
     }
     else
     {
        Py +=0; 
     }
   }
   else if(key == 'd')
   {
     if(DState == true)
     {
        Px +=25;
     }
     else
     {
        Py +=0; 
     }
   }
   else if(key == ENTER)
   {
     gameState = "Level 1";
   }
}
void Level1()
{
  instructions();
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
    image(Wall, 250, y);//wall 1 V
    image(Wall, 250, y+500);//wall 2 V
    image(Wall, 450, y+100);//wall 4 V
  }
  for(int x = 300; x <1150; x+=50)
  {
    image(Wall, x, 50);//wall 1 H
  }
  for(int x = 300; x <=1150; x+=50)
  {
    image(Wall, x, 900);//wall 10 H
  }
  for(int y = 150; y < 850; y += 50)
  {
    image(Wall, 350, y);//wall 3 V
  }
  for(int y = 600; y < 950; y += 50)
  {
    image(Wall, 450, y);//wall 5 V 
  }
  for(int x = 500; x < 1150; x += 50)
  {
     image(Wall, x, 250); //wall 3 H
     image(Wall, x, 450);//wall 5 H
     image(Wall, x+50, 150);//wall 2 H
     image(Wall, x+50, 350);//wall 4 H
  }
  for(int y = 600; y < 750; y += 50)
  {
    image(Wall, 550, y);//wall 6 V
    image(Wall, 1000, y+50);//wall 7 V
  }
  for(int y = 450; y < 850; y += 50)
  {
    image(Wall, 1100, y);//wall 8 V
  }
  for(int x = 550; x < 1050; x += 50)
  {
    image(Wall, x, 550);//wall 6 H
  }
  for(int x = 650; x < 1000; x += 50)
  {
    image(Wall, x, 700);//wall 7B H
    image(Wall, x, 650);//wall 7A H
  }
  for(int x = 550; x < 1100; x += 50)
  {  
    image(Wall, x, 800);//wall 8 H
  } 
}
void instructions()
{
    fill(255);
    textSize(20);
    text("Instructions:",100, 100);
    text("W: move up",100, 200);
    text("A: move left",100, 250);
    text("S: move down",100, 300);
    text("D: move right",100, 350);
}
void menu()
{
   image(Floor, 100, 0);
   fill(0);
   textSize(50);
   text("Welcome to the Maze Game!", width/2, height/4);
   text("Press ENTER to proceed.", width/2, height/3);
   //image(Floor, 100, 0);
}
