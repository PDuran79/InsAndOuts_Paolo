/*
PacMan by Paolo Duran
At least one conditional statement
At least two for loops that create a pattern of some kind
At least one rollover response
*/
/*
Instructions:
Press W,A,S,D to move 
Align the "Player" and the boxes for messages
*/
int hor = 100;
int vert = 100;
PImage brick;
void setup()
{
    size(1000,1000);
    brick = loadImage("Brick.png");
    brick.resize(100,100);
    ellipseMode(CORNER);
    textAlign(CENTER);
}
void draw()
{
    //int f1 = 100;
    //int f2 = 100;
    background(255);
    for(int t = 0; t<1000; t+=100)//create top and bottom bricks
    {
       image(brick,t, 0); 
       image(brick,t, 900);
    }
    for(int s = 0; s<1000; s+=100)//create side bricks
    {
       image(brick, 0, s);
       image(brick, 900, s);
    }
    for(int f1 =  300; f1<=600; f1+=300)//create 2 fruits
    {
        fill(#ff0000);
        rect(f1, 300, 100,100);
        if(f1 == 600)
        {
            fill(#42ee33);
            rect(f1, 300, 100,100);
        }
    }
    for(int f2 =  300; f2<=600; f2+=300)//create 2 fruits
    {
        fill(#ffb400);
        rect(f2, 600, 100,100);
        if(f2 == 600)
        {
             fill(#bfad00);
             rect(f2, 600, 100,100);
        }
    }
    fill(#fddc29);
    noStroke();
    ellipse(hor, vert, 100, 100);
    if(hor == 300 && vert == 300)
    {
       textSize(32);
       fill(#ff0000);
       text("Cherry", width/2, height/2); 
    }
    else if(hor == 600 && vert == 300)
    {
       textSize(32);
       fill(#42ee33);
       text("Pear", width/2, height/2); 
    }
    else if(hor == 300 && vert == 600)
    {
       textSize(32);
       fill(#ffb400);
       text("Orange", width/2, height/2); 
    }
    else if(hor == 600 && vert == 600)
    {
       textSize(32);
       fill(#bfad00);
       text("Banana", width/2, height/2); 
    }
}
void keyPressed()
{
   if(key == 'd')//right
   {
       hor += 10;
       if(hor > 800)
       {
          hor-=10; 
       }

   }
   else if(key == 'a')//left
   {
       hor -=10; 
       if(hor < 100)
       {
          hor+=10; 
       }
   }
   else if(key == 'w')//up
   {
       vert -=10;
       if(vert <100)
       {
          vert+=10; 
       }
   }
   else if(key == 's')//down
   {
       vert+=10;
       if(vert > 800)
       {
          vert -=10; 
       }
   }
}
