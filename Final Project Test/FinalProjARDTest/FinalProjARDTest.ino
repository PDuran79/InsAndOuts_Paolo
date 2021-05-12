const int BA = 2;
const int BB = 4;
const int LED = 8;
int inByte = 0;
int BAState = LOW;
int BBState = LOW;

void setup() 
{
  Serial.begin(9600);
  while(!Serial)
  {
    ;
  }
  pinMode(BA, INPUT);
  pinMode(BB, INPUT);
  pinMode(LED, OUTPUT);
  link();
}

void loop() 
{
  BAState = digitalRead(BA);
  BBState = digitalRead(BB);

  if(BAState == HIGH)
  {
    Serial.print('A');
  }
  else if(BBState == HIGH)
  {
    Serial.print('B');
  }

  if(Serial.available() > 0)
  {
    inByte = Serial.read();
    if(inByte == 0)
    {
      digitalWrite(LED, LOW);
    }
    else if(inByte == 1)
    {
      digitalWrite(LED, HIGH);
    }
  }
}

void link()
{
  while(Serial.available() <= 0)
  {
    Serial.print('X');
    delay(300);
  }
}
