//picka card 2
int state = 0;//state of cards, 1 = blue, 2 = red, 3 = gold
int wState = 0;
PImage cards[] = new PImage [3];//creates the images for the cards
PImage TFW;
int pick = 0;//used in the cycling of the card images
boolean next;//used to signal start of cycling images
int startc = (int)random(0,2);//used to signal random start of cycle
//above code taken from https://forum.processing.org/one/topic/how-to-pick-random-value-from-array.html
/*
When pressing w Cards cycle starting at a random card:
  
when pressing w a 2nd time stop at card shown:
  
depending on card "Picked" show an "effect": 
  
*/
void setup()
{
    size(1000,1000);
    frameRate(10);
    imageMode(CENTER);
    for(int i = 0; i < cards.length; i++)
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
    image(TFW, width/2, 200);
    
    if (keyPressed)
    {
      if(key == 'w')
      {
         image(cards[startc], width/2, height/2);
         Cycle(true);
      }
    }
    
    //image(cards[startc], width/2, height/2);
}
/*
void keyPressed()
{
  if(key == 'w')
  {
    Cycle(true);
  }
}
*/
void Cycle(boolean next)
{
    if(next == true)
    {
       if(startc == cards.length-1)
       {
           startc = 0;
       }
       else
       {
          startc++; 
       }
    }
    loop();
}
