//piano sketch
import processing.serial.*;
Serial myPort;
int C1 = 0;
int CS = 0;
int D1 = 0;
int DS = 0;
int E1 = 0;
int F1 = 0;
int FS = 0;
int G1 = 0;
int GS = 0;
int A1 = 0;
int AS = 0;
int B1 = 0;
int C2 = 0;
int CS2 = 0;

void setup()
{
  size(800,200);
  rectMode(CENTER);
  printArray(Serial.list());
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  for(int x = 50; x<=750; x+= 100)//create white piano keys
  {
     rect(x, 100, 100, 200); 
  }
  for(int x = 100; x<=200; x+=100)//create C# & D#
  {
      fill(#000000);
      rect(x, 50, 50, 100);
  }
  for(int x = 400; x <= 600; x+=100)//create F#, G#, A#
  {
      fill(#000000);
      rect(x,50, 50, 100);
  }
  //create C#^
  fill(#000000);
  rect(775, 50, 50, 100);
}  
void draw()
{
  if(mousePressed)
  {
    if(mouseX > 0 && mouseX < 75)//C
  {
     //print("C1");
     C1 = int(map(mouseX,1, 0, 75, 18));
     //myPort.write(C1);
     if(mouseX> 0 && mouseX < 100 && mouseY >100)
     {
        //print("C1"); 
        C1 = int(map(mouseX,1, 0, 100, 18));
        ////myPort.write(C1);
     }
  }
  else if(mouseX > 75 && mouseX < 125 && mouseY < 100)//C#
  {
    //print("C#");
    CS = int(map(mouseX,75, 18, 125, 36));
    //myPort.write(CS);
  }
  else if(mouseX > 125 && mouseX <175)//D
  {
    //print("D");
    D1 = int(map(mouseX,125, 36, 175, 54));
    if(mouseX>100 && mouseX < 200 && mouseY > 100)
    {
      //print("D");
      D1 = int(map(mouseX,100, 36, 200, 54));
    }
  }
  else if(mouseX >175 && mouseX < 225 && mouseY < 100)//D#
  {
    //print("D#");
    DS = int(map(mouseX,175, 54, 225, 72));
  }
  else if(mouseX > 225 && mouseX < 300)//E
  {
    //print("E");
    E1 = int(map(mouseX,225, 72, 300, 90));
    if(mouseX > 200 && mouseX < 300 && mouseY > 100)
    {
       //print("E"); 
       E1 = int(map(mouseX,200, 72, 300, 90));
    }
  }
  else if(mouseX > 300 && mouseX < 375)//F
  {
    //print("F");
    F1 = int(map(mouseX,300, 90, 375, 108));
    if(mouseX > 300 && mouseX < 400 && mouseY > 100)
    {
       //print("F"); 
       F1 = int(map(mouseX,300, 90, 375, 108));
    }
  }
  else if(mouseX >375 && mouseX < 425 && mouseY < 100)//F#
  {
    //print("F#");
    FS = int(map(mouseX,375, 108, 425, 126));
  }
  else if(mouseX > 425 && mouseX < 475)//G
  {
    //print("G");
    G1 = int(map(mouseX,425, 126, 475, 144));
    if(mouseX > 400 && mouseX < 500 && mouseY > 100)
    {
       //print("G"); 
       G1 = int(map(mouseX,400, 126, 500, 144));
    }
  }
  else if(mouseX >475 && mouseX < 525 && mouseY < 100)//G#
  {
    //print("G#");
    GS = int(map(mouseX,475, 144, 525, 162));
  }
  else if(mouseX > 525 && mouseX < 575)//A
  {
    //print("A");
    A1 = int(map(mouseX,525, 162, 575, 180));
    if(mouseX > 500 && mouseX < 600 && mouseY > 100)
    {
       //print("A"); 
       A1 = int(map(mouseX,500, 162, 600, 180));
    }
  }
  else if(mouseX >575 && mouseX < 625 && mouseY < 100)//A#
  {
    //print("A#");
    AS = int(map(mouseX,525, 180, 575, 198));
  }
  else if(mouseX > 625 && mouseX < 700)//B
  {
    //print("B");
    B1 = int(map(mouseX,625, 198, 700, 216));
    if(mouseX > 600 && mouseX < 700 && mouseY > 100)
    {
       //print("B"); 
       B1 = int(map(mouseX,600, 198, 700, 216));
    }
  }
  else if(mouseX > 700 && mouseX < 750)//C2
  {
    //print("C2");
    C2 = int(map(mouseX,700, 216, 750, 234));
    if(mouseX > 700 && mouseX < 800 && mouseY > 100)
    {
       //print("C2"); 
       C2 = int(map(mouseX,700, 216, 800, 234));
    }
  }
  else if(mouseX >750 && mouseX < 800 && mouseY < 100)//C#2
  {
    //print("C#2");
    CS2 = int(map(mouseX,750, 234, 800, 252));
  }
  }
}
