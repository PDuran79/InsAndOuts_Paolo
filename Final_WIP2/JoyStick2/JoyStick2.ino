const int Butt1 = 2;
const int Butt2 = 4;
int B1val = 0;
int B2val = 0;
int Brest1 = 0;
int Brest2 = 3;
int xVal = 0;
int yVal = 0;

void setup() 
{
  pinMode(Butt1, INPUT);
  pinMode(Butt2, INPUT);
  Serial.begin(9600);
}

void loop() 
{
  B1val = digitalRead(Butt1);
  delay(10);
  B2val = digitalRead(Butt2);
  delay(10);
  xVal = analogRead(A0);
  yValue = analogRead(A1);

  if(B2val == 1)
  {
    B2val = 4;
  }
  else
  {
    B2val = 3;
  }
  Serial.print(xVal, DEC);
  Serial.print(yVal, DEC);
  //Serial.write(B1val);
  //Serial.write(B2val);
  //Serial.print(B2val);
  delay(100);
}
