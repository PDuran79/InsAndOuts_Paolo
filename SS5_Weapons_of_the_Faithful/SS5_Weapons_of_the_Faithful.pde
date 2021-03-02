/*
Weapons of the Faithful by Paolo Duran
At least two original functions (defined outside of void draw()).
At least one array.
At least one conditional statement.
*/
/*
press w to cycle through modes
*/
PImage[] Guns = new PImage[5];
String[] Names = {"Calibrum", "Severum", "Gravitum", "Infernum", "Crescendum"};
int[] fontColor = {#00ff9f, #DC143C, #6900b2, #0045ff, #c1c1c1};
int pick = 0;
boolean spellcast = true;
void setup()
{
   size(800,800);
   frameRate(10);
   imageMode(CENTER);
   textAlign(CENTER);
   textSize(30);
   for(int c = 0; c < Guns.length; c++)
   {
      Guns[c] = loadImage("Gun" + c + ".png");
      Guns[c].resize(100,100);
   }
}
void draw()
{
   background(255);
   image(Guns[pick], width/2, height/2);
   fill(fontColor[pick]);
   text(Names[pick], width/2, (height/2)/2);
}
void keyPressed()
{
    if(key == 'w')
    {
       Cycle(true); 
    }
}
void Cycle(boolean spellcast)
{
   if(spellcast == true)
    {
        if(pick == Guns.length-1)
        {
            pick = 0;
        }
        else
        {
           pick++; 
        }
    }
    else
    {
       if(pick == 0)
       {
           pick = Guns.length-1;
       }
       else
       {
          pick--; 
       }
    }
}
