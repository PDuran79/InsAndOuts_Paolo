const int ButA = 2;
const int ButB = 4;
const int LED = 8;
int inByte = 0;
int BAState = LOW;
int BBState = LOW;
int BACount = 0;
int BBCount = 0;
char outByte = 0;

void setup() 
{
  Serial.begin(9600);
  while(!Serial)
  {
    ;
  }
  pinMode(ButA, INPUT);
  pinMode(ButB, INPUT);
  pinMode(LED, OUTPUT);
  link();
}

void loop() 
{
  BAState = digitalRead(ButA);
  BBState = digitalRead(ButB);

  outByte = 'C';
  if(BAState == HIGH && BACount != 1)
  {
    outByte = 'A';
    BACount = 1;
    BBCount = 0;
  }
  if(BBState == HIGH && BBCount != 1)
  {
    outByte = 'B';
    BACount = 0;
    BBCount = 1;
  }
  delay(10);
  
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
    else{}
    Serial.print(outByte);
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
