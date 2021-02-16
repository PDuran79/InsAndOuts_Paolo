/*
MC Dirt Hut by Paolo Duran
At least one external image file: .jpg or .png.
Text.
At least one conditional statement.
*/
/*
Click on the screen to begin the program
*/
PImage dirt; 
PImage grass;
PImage craft;
int blockc = 0;
void setup()
{
    size(1000,1000);
    background(#4ad6ff);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("Click on the screen to begin building.", width/2, 200);
    
    dirt = loadImage("Dirt.jpg");
    dirt.resize(100,100);
    grass = loadImage("Grass.png");
    grass.resize(100,100);
    craft = loadImage("Crafting_table.png");
    craft.resize(100,100);
    //code below is setup for the ground
    image(grass, 0, 800);
    image(grass, 100, 800);
    image(grass, 200, 800);
    image(grass, 300, 800);
    image(grass, 400, 800);
    image(grass, 500, 800);
    image(grass, 600, 800);
    image(grass, 700, 800);
    image(grass, 800, 800);
    image(grass, 900, 800);
    image(dirt, 0, 900);
    image(dirt, 100, 900);
    image(dirt, 200, 900);
    image(dirt, 300, 900);
    image(dirt, 400, 900);
    image(dirt, 500, 900);
    image(dirt, 600, 900);
    image(dirt, 700, 900);
    image(dirt, 800, 900);
    image(dirt, 900, 900);
}
void draw()
{
    if(mousePressed && blockc == 0)
    {
       image(dirt, 300, 700);
       blockc = blockc +1; 
       println(blockc);
    }
    else if(mousePressed && blockc == 1)
    {
       image(dirt, 300, 600);
       blockc = blockc +1; 
       println(blockc);
    }
    else if(mousePressed && blockc == 2)
    {
       image(grass, 300, 500);
       blockc = blockc +1; 
       println(blockc);
    }
    else if(mousePressed && blockc == 3)
    {
       image(grass, 400, 500);
       blockc = blockc +1; 
       println(blockc);
    }
    else if(mousePressed && blockc == 4)
    {
       image(grass, 500, 500);
       blockc = blockc +1; 
       println(blockc);
    }
    else if(mousePressed && blockc == 5)
    {
       image(grass, 600, 500);
       blockc = blockc +1; 
       println(blockc);
    }
    else if(mousePressed && blockc == 6)
    {
       image(dirt, 600, 600);
       blockc = blockc +1; 
       println(blockc);
    }
    else if(mousePressed && blockc == 7)
    {
       image(dirt, 600, 700);
       blockc = blockc +1; 
       println(blockc);
    }
    else if(mousePressed && blockc == 8)
    {
       image(craft, 400, 700);
       blockc = blockc +1; 
       println(blockc);
       text("DONE!!!!", width/2, 400);
    }
}
