import processing.serial.*;

Serial myPort;
int val = 0;
int x1 = 73;
int x2 = 327;
int add = 73;//add to x and y positions
int y1 = 150;
int y2 = 250;

void setup()
{
   size(400,400);
   String[] portlist = Serial.list();
   printArray(portlist);
   String portname = portlist[2];
   myPort = new Serial(this,portname,9600);
   textSize(30);
   textAlign(CENTER);
}
void draw()
{
   if(myPort.available() > 0)
   {
       val = myPort.read();
   }
   background(0);
   fill(255);
   quad(x1, y1, x2, y1, x2, y2, x1,y2);
   if(val <= 85)//red
   {
       fill(#ff0000);
       quad(x1, y1, val + add, y1, val + add, y2, x1,y2);
       if(val > 64 && val < 128)
       {
          fill(255);
          text("Quarter of the way done!", width/2, 100);
       }
   }
   else if(val > 85 && val <= 170)//yellow
   {
       fill(#ffff00);
       quad(x1, y1, val + add, y1, val + add, y2, x1,y2);
       if(val > 128 && val <192)
       {
          fill(255);
          text("Halfway done!", width/2, 100);
       }
   }
   else //green
   {
       fill(#008000);
       quad(x1, y1, val + add, y1, val + add, y2, x1,y2);
       if(val > 192 && val < 254)
       {
          fill(255);
          text("Almost Done!", width/2, 100);
       }
       else if(val == 255)
       {
          fill(255);
          text("Done Loading!", width/2, 100); 
       }
   }
   //quad(x1, y1, val, y1, val, y2, x1,y2);
   print(val);
}
