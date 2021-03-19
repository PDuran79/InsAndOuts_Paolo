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
boolean Select = false;//used to show that you "picked" a card
int Pimage = Simage;//used to bring up image of which card was picked
String state = "Instructions";//used to define which state the code is in
String cardState;
void setup()
{
    size(500,500);
    frameRate(3);
    imageMode(CENTER);
    textAlign(CENTER);
    for(int i = 0; i < cards.length; i++)//used to create card images
    {
        cards[i] = loadImage("Card" + i + ".png");
        cards[i].resize(100,100);
    }
    TFW = loadImage("TFw.png");
    TFW.resize(100,100);
}
void draw()
{
    background(255);
    if(state == "Instructions")
    {
        fill(0);
        textSize(30);
        text("Instructions: ", width/2, 100);
        text("Press W to begin card looping.", width/2, 150);
        text("Press S to select a card.", width/2, 200);
        text("Press R to reset.", width/2, 250);
        text("To proceed press Enter.", width/2, 300);
    }
    else if(state == "SpellIcon")
    {
      text("Press I to go back", width/2, 100);
      text("to instructions page.", width/2, 150);
      image(TFW, width/2, height/2);
    }
    else if(state == "PickaCard")
    {
      println("Simage: " + Simage);
      println("Pimage: " + Pimage);
      println("Select: " + Select);
      if(next == true)//starts image looping
      {
         image(cards[Simage], width/2, height/2);
         if(Simage == cards.length-1)
         {
             Simage = 0;
             Pimage = 0;
         }
         else
         {
             Simage++;
             Pimage++;
         }
         //delay(1000);
      } 
    }
    if(state == "CardSelect")
    {
        println("Card State: " + cardState);
        if(Select == true)
        {
             image(cards[Pimage],width/2, height/2);
             if(cards[Pimage] == cards[0])//determine if card is blue
             {
                 cardState = "Blue";
                 CardEffect();
             }
             else if(cards[Pimage] == cards[1])//determine if card is red
             {
                 cardState = "Red";
                 CardEffect();
             }
             else if(cards[Pimage] == cards[2])//determine if card is gold
             {
                 cardState = "Gold";
                 CardEffect();
             }
        }
    }
}
void keyPressed()
{
   if(key == 'w')
   {
      state = "PickaCard";
      next = true; 
   }
   if(key == 's')
   {
      state = "CardSelect";
      Select = true;
      next = false;
      //CardEffect(); 
   }
   if(key == ENTER)
   {
      state = "SpellIcon"; 
   }
   if(key == 'i')
   {
      state = "Instructions"; 
   }
   if(key == 'r')
   {
      state = "SpellIcon"; 
      next = false;
      Select = false;
   }
}
void CardEffect()//shows the cards effect
{
    if(cardState == "Blue")
    {
      Blue();
    }
    else if(cardState == "Red")
    {
      Red();
    }
    else if(cardState == "Gold")
    {
       Gold();
    }
}
void Blue()
{
    //Restores mana
    background(255);
    fill(#0000ff);
    text("Blue", width/2, 100);
    image(cards[0],width/2, height/2);
}
void Red()
{
   //slows 
    background(255);
    fill(#ff0000);
    text("Red", width/2, 100);
    image(cards[1],width/2, height/2);
}
void Gold()
{
    //stuns
    background(255);
    fill(#FFD700);
    text("Gold", width/2, 100);
    image(cards[2],width/2, height/2);
}
