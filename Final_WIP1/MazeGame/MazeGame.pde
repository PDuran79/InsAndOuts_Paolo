//Maze Game 
PImage Floor;
PImage Wall;
PImage Key;
PImage Door;
String keyState = "Don't Have";
String gameState = "Menu";
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
    if(Px == 225 && Py <950)
    {
      AState = "No";
      DState = "No";
      if(Py >= 25 && Py <= 925)
      {
         if(keyState == "Don't Have" && Py >= 875)
         {
           SState = "No";
           WState = "Yes";
         }
         else
         {
           SState = "Yes";
           WState = "Yes";
         }
         if(Py == 25)
         {
           WState = "No";
           SState = "Yes";
         }
         if(Py == 475)
         {
           if(Px >= 225 && Px <=325)
           {
              AState = "Yes";
              DState = "Yes";
              if(Px == 225)
              {AState = "No";DState = "Yes";}
              if(Px == 325)
              {AState = "Yes";DState = "No";}
           }
         }
      }
    }
    if(Px == 325 && Py <950)
    {
      DState = "No";
      AState = "No";
      if(Py == 475)
      {AState = "Yes";DState = "No";}
      if(Py >= 125 && Py <= 875)
      {
        WState = "Yes";
        SState = "Yes";
        if(Py == 125)
        {
          WState = "No";
          SState = "Yes";
          DState = "Yes";
          AState = "No";
        }
        if(Py == 875)
        {
          WState = "Yes";
          SState = "No";
          DState = "Yes";
          AState = "No";
        }
      }
      if(Py == 25)
      {
        DState = "Yes";
        AState = "No";
        WState = "No";
        SState = "No";
        keyState = "Have";
        if(Px >= 325 && Px <= 1175)
        {DState = "Yes";AState = "Yes";}
        if(Px == 325)
        {AState = "No";DState = "Yes";}
        if(Px == 1175)
        {AState = "Yes";DState = "No";}
      }
    }
    if(Px == 425 && Py < 950)
    {
      AState = "No";DState = "No";
      if(Py >= 125 && Py <= 875)
      {
        WState = "Yes"; SState = "Yes";
        if(Py == 125)
        {AState = "Yes";DState = "No";WState = "No";SState = "Yes";}
        if(Py == 575)
        {DState = "Yes";AState = "No";
          if(Px == 525)
          {AState = "Yes";
          DState = "No"; }
        }
        if(Py == 875)
        {AState = "Yes";DState = "No";SState = "No";WState = "Yes";}
      }
    }
    if(Px == 525)
    {
        WState = "Yes";
        SState = "Yes";
        if(Py == 575)
        {
          AState = "Yes";
          DState = "No";
          SState = "No";
        }
        if(Py == 525)
        {
          AState = "No";
          DState = "Yes";
          WState = "No";
          if(Px >= 525 && Px<= 1075)
          {
            AState = "Yes";
            DState = "Yes";
            if(Px == 525)
            {DState = "Yes";AState = "No";}
          }
        }
    }
    if(Px == 1075)
    {
      if(Py >= 525 && Py <= 775)
      {
        WState = "Yes";
        SState = "Yes";
        DState = "No";
        AState = "Yes";
        if(Py == 525)
        {SState = "Yes";WState = "No";}
        if(Py == 775)
        {SState = "No";WState = "Yes";AState = "No";DState = "No";}
        if(Py == 625)
        {
          if(Px == 625&& Py < 575)
          {
            AState = "No";
            DState = "Yes";
            if(Py >= 625 && Py <= 775)
            {
              WState = "Yes"; 
              SState = "Yes";
              if(Py == 625)
              {
                SState = "Yes";
                WState = "No";
              }
              if(Py == 775)
              {
                SState = "No";
                WState = "Yes";
              }
            }
          }
        }
      }
    }
    if(Py == 975)
    {WState = "Yes";DState = "Yes";AState = "No";SState = "No";}
    /*
    if(Px == 75 || Px == 175 || Px == 275 || Px >= 375 && Px <= 825)
    {
       WState = "No";
       SState = "No";
    }
    */
  }
  else if(gameState == "Level 2")
  {
    Level2();
  }
  else if(gameState == "Level 3")
  {
    Level3();
  }
  else if(gameState == "End Game")
  {
    
  }
} 
void keyPressed()
{
   if(key == 'w')
   {
     if(WState == "Yes")
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
     if(AState == "Yes")
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
     if(SState == "Yes")
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
     if(DState == "Yes")
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
void Level2()
{
  
}
void Level3()
{
  
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
