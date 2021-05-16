import processing.serial.*;

Serial myPort;

int Px;
int Py;
int b;
PFont f;
String portName;
String val;

void setup()
{
  size(512,512);
  
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('n');
  
  f = createFont("Arial", 16, true);
  textFont(f,16);
}
void draw()
{
  fill(0);
  clear();
  
  fill(255);
  if(b == 1)
  {
    ellipse(Px/2,Py/2,50,50);
  }
  else
  {
    ellipse(Px/2,Py/2,25,25);
  }
  text("AnalogX = " + (1023-Px) + " AnalogY = " + (1023-Py), 10,20);
}

void serialEvent(Serial myPort)
{
  val = myPort.readStringUntil('\n');
  if(val != null)
  {
    val = trim(val);
    
    int[] vals = int(splitTokens(val, ", "));
    Px += vals[0];
    Py += vals[1];
    
  }
}
