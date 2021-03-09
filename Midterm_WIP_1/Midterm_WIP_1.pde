//picka card 2
String Cardstate[] = {"Blue","Red","Gold"};//state of cards used to display different effects
PImage cards[] = new PImage [3];//creates the images for the cards
int pick = 0;//used in the cycling of the card images
boolean next;//used to signal start of cycling images
int startc = (int)random(0,2);//used to signal random start of cycle
//above code taken from https://forum.processing.org/one/topic/how-to-pick-random-value-from-array.html
void setup()
{
    size(1000,1000);
    frameRate(10);
    imageMode(CENTER);
    
    for(int i = 0; i < cards.length; i++)
    {
       cards[i] = loadImage("Card" + i + ".png");
       cards[i].resize(100,100);
    }
}
void draw()
{
    background(255);
    image(cards[startc], width/2, height/2);
}
void keyPressed()
{
  if(key == 'w')
  {
    Cycle(true);
  }
}
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
