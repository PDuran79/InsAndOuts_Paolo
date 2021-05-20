const int Butt1 = 2;//button 1
const int Butt2 = 4;// button 2
const int LED = 8;//led
int B1val = 0;// button 1 value
int B2val = 0;// button 2 value
int xValue = 0;// Xvalue joystick
int yValue = 0;// Yvalue joystick
int Kval = 0;//keyState value from processing
int msg = 0;//char sendout
void setup()
{
  Serial.begin(9600);
  pinMode(Butt1, INPUT);
  pinMode(Butt2, INPUT);
  pinMode(LED, OUTPUT);
}
void loop()
{
  xValue = analogRead(A0);
  yValue = analogRead(A1);
  B1val = digitalRead(Butt1);
  B2val = digitalRead(Butt2);
  delay(10);
  if(B1val == HIGH)
  {
    msg = 'A';
  }
  else if(B2val == HIGH)
  {
    msg = 'B';
  }
  else
  {
    msg = 'X';
  }
  Serial.print(xValue, DEC);
  Serial.print(",");
  Serial.print(yValue, DEC);
  Serial.print(",");
  Serial.print(msg);
  Serial.print("\n");

  if(Serial.available() > 0)
  {
    Kval = Serial.read();
    if(Kval > 0)
    {
      digitalWrite(LED, HIGH);
    }
    else
    {
      digitalWrite(LED, LOW);
    }
  }
  
  delay(10);
}
