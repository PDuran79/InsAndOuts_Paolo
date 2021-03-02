//PickACard by Paolo Duran
/*
  Use of declared integer and float variables
  At least one conditional statement using if, else if, and else
  Use of the random() function
  Use of at least one of these event functions: keyPressed(), mousePressed()
*/
/*
press w to activate pick a card
can't get reset code to work so no reset other than re-running the program
*/
float Ccount = random(3);
int count = 0;
void setup()
{
   size(800,800);
   rectMode(CENTER);
   strokeWeight(5);
}
void draw()
{
    if(keyPressed)
    {
      if(key == 'w' && count == 0)
      {
         count = 1;
         println(count);
         if(Ccount < 3 && Ccount > 2 )//blue
         {
           fill(#0000FF);
           rect(width/2, height/2, 200, 400);
         }
         else if(Ccount < 2 && Ccount > 1)//red
         {
           fill(#FF0000);
           rect(width/2, height/2, 200, 400);
         }
         else//gold
         {
           fill(#FFD700);
           rect(width/2, height/2, 200, 400);
         }
      }
    }
    else if(keyPressed)
    {
      count = 0;
      println(count);
    }
}
