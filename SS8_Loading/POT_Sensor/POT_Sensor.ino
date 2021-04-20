const int dial = A0;
const int LED = 11;
int value = 0;

void setup()
{
  pinMode(LED,OUTPUT);
  Serial.begin(9600);
}

void loop() 
{
  value = analogRead(dial);//0-1023
  delay(50);
  value = value/4; //reduces range to max 255
  //Serial.print(value);//send human readable data
  Serial.write(value);//sends binary data to processing
  //analogWrite(LED, value);
}
