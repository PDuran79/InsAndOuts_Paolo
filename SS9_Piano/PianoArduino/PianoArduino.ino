//piano sketch
const int buzzer = 5;
int val = 0;
int C1 = 523;
int CS = 554;
int D = 587;
int DS = 622;
int E = 659;
int F = 698;
int FS = 740;
int G = 784;
int GS = 831;
int A = 880;
int AS = 932;
int B = 988;
int C2 = 1047;
int CS2 = 1109;

void setup() 
{
  // put your setup code here, to run once:
  pinMode(buzzer, OUTPUT);
  Serial.begin(9600);
}

void loop() 
{
  // put your main code here, to run repeatedly:
  if(Serial.available())
  {
      val = Serial.read();
      delay(10);
  }
  if(val > 0 && val < 18 )
  {
    tone(buzzer, C1);
    delay(100);
  }
  else if(val > 18 && val < 36)
  {
    tone(buzzer, CS);
    delay(100);
  }
  else if(val > 36 && val < 54)
  {
    tone(buzzer, D);
    delay(100);
  }
  else if(val > 54 && val < 72)
  {
    tone(buzzer, DS);
    delay(100);
  }
  else if(val > 72 && val < 90)
  {
    tone(buzzer, E);
    delay(100);
  }
  else if(val > 90 && val < 108)
  {
    tone(buzzer, F);
    delay(100);
  }
  else if(val > 108 && val < 126)
  {
    tone(buzzer, FS);
    delay(100);
  }
  else if(val > 126 && val < 144)
  {
    tone(buzzer, G);
    delay(100);
  }
  else if(val > 144 && val < 162)
  {
    tone(buzzer, GS);
    delay(100);
  }
  else if(val > 162 && val < 180)
  {
    tone(buzzer, A);
    delay(100);
  }
  else if(val > 180 && val < 198)
  {
    tone(buzzer, AS);
    delay(100);
  }
  else if(val > 198 && val < 216)
  {
    tone(buzzer, B);
    delay(100);
  }
  else if(val > 216 && val < 234)
  {
    tone(buzzer, C2);
    delay(100);
  }
  else if(val > 234 && val < 252)
  {
    tone(buzzer, CS2);
    delay(100);
  }
}
