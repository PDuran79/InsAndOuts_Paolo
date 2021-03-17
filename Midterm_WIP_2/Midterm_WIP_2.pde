//Midterm WIP 2
/*
When pressing w Cards cycle starting at a random card
^finished
when pressing w a 2nd time stop at the card shown
*/
PImage TFW;//spell indicator image
PImage cards[] = new PImage[3];//images for the cards
int pick = 0;//used in the cycling of images
boolean next;//used to start cycling images
int Simage = (int)random(0,3);//used to start image cycling at a random image
//above code taken from https://forum.processing.org/one/topic/how-to-pick-random-value-from-array.html
int Scycle = 0;//used to start cycling
int Select = 0;//used to show that you "picked" a card
int Pimage = Simage;//used to bring up image of which card was picked
String state = "Instructions";//used to define which state the code is in
void setup()
{
    size(1000,1000);
    frameRate(4);
    imageMode(CENTER);
    textAlign(CENTER);
    for(int i = 0; i < cards.length; i++)//used to create card images
    {
        cards[i] = loadImage("Card" + i + ".png");
        cards[i].resize(200,200);
    }
    TFW = loadImage("TFw.png");
    TFW.resize(200,200);
}
void draw()
{
    background(255);
    if(state == "Instructions")
    {
        fill(0);
        textSize(30);
        text("Instructions: ", width/2, 200);
        text("Press W to begin card looping.", width/2, 300);
        text("Press S to select a card.", width/2, 400);
        text("Press R to reset.", width/2, height/2);
        text("To proceed press Enter.", width/2, 600);
    }
    else if(state == "PickaCard")
    {
      image(TFW, width/2, 200);
      println(Simage);
      if(next == true && Scycle == 0)//starts image looping
      {
         image(cards[Simage], width/2, height/2);
         if(Simage == cards.length-1)
         {
             Simage = 0;
         }
         else
         {
             Simage++;
         }
      }
      if(next == true && Select == 1)//code to pick one card
      {
          image(cards[Simage],width/2, height/2);
      }
    }
}
void keyPressed()
{
   if(key == 'w')
   {
      CycleStart(); 
   }
   if(key == 's')
   {
      Select = 1;
      CardEffect(); 
   }
   if(key == ENTER)
   {
      state = "PickaCard"; 
   }
   if(key == 'i')
   {
      state = "Instructions"; 
   }
   if(key == 'r')
   {
      next = false;
      Select = 0;
   }
}
void CycleStart()
{
   next = true; 
}
void CardEffect()
{
    //Select = 1;
}
