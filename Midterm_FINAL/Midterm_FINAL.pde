//Midterm Final
PImage TFW;//spell indicator image
PImage cards[] = new PImage[3];//images for the cards
PImage SR;//background image
PImage Teemo;//enemy image
PImage stun;
PImage slow;
int pick = 0;//used in the cycling of images
boolean next;//used to start cycling images
int Simage = (int)random(0,3);//used to start image cycling at a random image
//above code taken from https://forum.processing.org/one/topic/how-to-pick-random-value-from-array.html
boolean Select = false;//used to show that you "picked" a card
int Pimage = Simage;//used to bring up image of which card was picked
String state = "Start";//used to define which state the code is in
String cardState;//state of the card
int Maxmana = 996;//Max mana value
int addMana = 150;
int Cmana = Maxmana;//current mana 
int BHP = 2132;//health value
int WDMG;// Damage a card does
int ManaB = 900;//right side point value for mana quad
int AD = 108;//base number used to modify WDMG
int manaCount = 0;//allows mana to increase once
void setup()
{
    size(1000,1000);
    frameRate(3);
    imageMode(CENTER);
    textAlign(CENTER);
    rectMode(CENTER);
    for(int i = 0; i < cards.length; i++)//used to create card images
    {
        cards[i] = loadImage("Card" + i + ".png");
        cards[i].resize(100,100);
    }
    TFW = loadImage("TFw.png");
    TFW.resize(100,100);
    SR = loadImage("SummonersRift.jpg");
    SR.resize(1000,700);
    Teemo = loadImage("Teemo.png");
    Teemo.resize(100,100);
    stun = loadImage("Stun.png");
    stun.resize(50,50);
    slow = loadImage("Slow.png");
    slow.resize(50,50);
}
void draw()
{
    background(0);
    image(SR, width/2, 300);
    image(Teemo, 700, 400);
    //rect(width/2, 675, 800,50);
    if(state == "Start")
    {
        fill(255);
        textSize(30);
        text("This is a Pick a Card practice tool", width/2, 700);
        text("To proceed Press the Space Bar.", width/2, 750);
    }
    else if(state == "SpellIcon")
    {
      fill(255);
      text("To reset Mana press ENTER", width/2, 900);
      text("Press W to begin card looping.", width/2, 950);
      image(TFW, width/2, 800);
      fill(#2fff00);
      quad(100,650, 100, 700, 900, 700, 900,650);
      fill(#808080);
      quad(100, 700, 100, 750, 900, 750, 900, 700);
      fill(#00b8ff);
      quad(100, 700, 100, 750, ManaB, 750, ManaB, 700);
      fill(0);
      text(BHP, width/2, 700);
      text(Cmana + "/" + Maxmana, width/2, 750);
    }
    else if(state == "PickaCard")
    {
      fill(255);
      text("Press S to select a card.", width/2, 900);
      text("To reset Mana press ENTER", width/2, 950);
      fill(#2fff00);
      quad(100, 650, 100, 700, 900, 700, 900, 650);
      fill(#808080);
      quad(100, 700, 100, 750, 900, 750, 900, 700);
      fill(#00b8ff);
      quad(100, 700, 100, 750, ManaB, 750, ManaB, 700);
      fill(0);
      text(BHP, width/2, 700);
      text(Cmana + "/" + Maxmana, width/2, 750);
      if(next == true)//starts image looping
      {
         image(cards[Simage], width/2, 800);
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
      } 
    }
    else if(state == "CardSelect")
    {
        fill(#2fff00);
        quad(100,650, 100, 700, 900, 700, 900,650);
        fill(#808080);
        quad(100, 700, 100, 750, 900, 750, 900, 700);
        fill(#00b8ff);
        quad(100, 700, 100, 750, ManaB, 750, ManaB, 700);
        fill(0);
        text(BHP, width/2, 700);
        text(Cmana + "/" + Maxmana, width/2, 750);
        if(Select == true)
        {
             image(cards[Pimage],width/2, 800);
             if(cards[Pimage] == cards[0])//determine if card is blue
             {
                 cardState = "Blue";
                 WDMG = AD + 120;
                 CardEffect();
             }
             else if(cards[Pimage] == cards[1])//determine if card is red
             {
                 cardState = "Red";
                 WDMG = AD + 90;
                 CardEffect();
             }
             else if(cards[Pimage] == cards[2])//determine if card is gold
             {
                 cardState = "Gold";
                 WDMG = AD + 45;
                 CardEffect();
             }
        }
    }
    else if(state == "NoMana")
    {
        fill(255);
        text("You don't have the mana to cast this spell.", width/2, 850);
        text("To reset press ENTER and then press R", width/2, 900);
    }
}
void keyPressed()
{
   if(key == 'w' && Cmana >= 100)
   {
      state = "PickaCard";
      Cmana -= 100;
      ManaB -= 80;
      next = true; 
   }
   else if(key == 'w' && Cmana < 100)
   {
       state = "NoMana";
   }
   if(key == 's')
   {
      state = "CardSelect";
      Select = true;
      next = false; 
   }
   if(key == ENTER)
   {
      Cmana = Maxmana;
      ManaB = 900;
   }
   if(key == 'i')
   {
      state = "Instructions"; 
   }
   if(key == 'r')
   {
      state = "SpellIcon"; 
      fill(255);
      next = false;
      Select = false;
      manaCount = 0;
   }
   if(key == ' ')
   {
       state = "SpellIcon";
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
    background(0);
    image(SR, width/2, 300);
    image(Teemo, 700, 400);
    fill(#2fff00);
    quad(100,650, 100, 700, 900, 700, 900,650);
    fill(#808080);
    quad(100, 700, 100, 750, 900, 750, 900, 700);
    fill(#00b8ff);
    quad(100, 700, 100, 750, ManaB, 750, ManaB, 700);
    fill(#f63bf6);
    text(WDMG, 810, 350);
    fill(#FFA500);
    text(AD, 810, 400);
    image(cards[0],width/2, 800);
    fill(255);
    text("Press R to reset.", width/2, 900);
    if(manaCount < 1)
    {
       if(Cmana < Maxmana)
       {
           Cmana += addMana;
           manaCount = 1;
       }
       else
       {
          Cmana = Maxmana; 
       }
       if(ManaB < 900)
       {
          ManaB += 152;
          manaCount = 1;
       }
       else
       {
         ManaB = 900;
       }
    }
    fill(0);
    text(BHP, width/2, 700);
    text(Cmana + "/" + Maxmana, width/2, 750);
}
void Red()
{
    background(0);
    image(SR, width/2, 300);
    image(Teemo, 700, 400);
    fill(#2fff00);
    quad(100,650, 100, 700, 900, 700, 900,650);
    fill(#808080);
    quad(100, 700, 100, 750, 900, 750, 900, 700);
    fill(#00b8ff);
    quad(100, 700, 100, 750, ManaB, 750, ManaB, 700);
    fill(0);
    text(BHP, width/2, 700);
    text(Cmana + "/" + Maxmana, width/2, 750);
    fill(#f63bf6);
    text(WDMG, 810, 350);
    fill(#FFA500);
    text(AD, 810, 400);
    image(cards[1],width/2, 800);
    fill(255);
    text("Press R to reset.", width/2, 900);
    image(slow, 690, 325);
}
void Gold()
{
    background(0);
    image(SR, width/2, 300);
    image(Teemo, 700, 400);
    fill(#2fff00);
    quad(100,650, 100, 700, 900, 700, 900,650);
    fill(#808080);
    quad(100, 700, 100, 750, 900, 750, 900, 700);
    fill(#00b8ff);
    quad(100, 700, 100, 750, ManaB, 750, ManaB, 700);
    fill(0);
    text(BHP, width/2, 700);
    text(Cmana + "/" + Maxmana, width/2, 750);
    fill(#f63bf6);
    text(WDMG, 810, 350);
    fill(#FFA500);
    text(AD, 810, 400);
    image(cards[2],width/2, 800);
    fill(255);
    text("Press R to reset.", width/2, 900);
    image(stun, 690, 325);
}
