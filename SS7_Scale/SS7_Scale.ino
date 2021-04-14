const int LED1 = 13;
const int LED2 = 12;
const int LED3 = 8;
const int LED4 = 7;
const int button = 2;
int CState = 0;
int buttonState = 0;
int quarter = 1000/4;

void setup()
{
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(button, INPUT);
}
void loop()
{
  buttonState = digitalRead(button);
  delay(10);
  if(buttonState == HIGH && CState == 0)
  {
     //1
     digitalWrite(LED1, HIGH);
     digitalWrite(LED2, LOW);
     digitalWrite(LED3, LOW);
     digitalWrite(LED4, LOW);
     delay(quarter);

     //2
     digitalWrite(LED1, LOW);
     digitalWrite(LED2, HIGH);
     digitalWrite(LED3, LOW);
     digitalWrite(LED4, LOW);
     delay(quarter);

     //3
     digitalWrite(LED1, LOW);
     digitalWrite(LED2, LOW);
     digitalWrite(LED3, HIGH);
     digitalWrite(LED4, LOW);
     delay(quarter);

     //4
     digitalWrite(LED1, LOW);
     digitalWrite(LED2, LOW);
     digitalWrite(LED3, LOW);
     digitalWrite(LED4, HIGH);
     delay(quarter);

     CState++;
  }
  else if(buttonState == HIGH && CState >= 1)
  {
     //4
     digitalWrite(LED1, LOW);
     digitalWrite(LED2, LOW);
     digitalWrite(LED3, LOW);
     digitalWrite(LED4, HIGH);
     delay(quarter);

     //3
     digitalWrite(LED1, LOW);
     digitalWrite(LED2, LOW);
     digitalWrite(LED3, HIGH);
     digitalWrite(LED4, LOW);
     delay(quarter);

     //2
     digitalWrite(LED1, LOW);
     digitalWrite(LED2, HIGH);
     digitalWrite(LED3, LOW);
     digitalWrite(LED4, LOW);
     delay(quarter);

     //1
     digitalWrite(LED1, HIGH);
     digitalWrite(LED2, LOW);
     digitalWrite(LED3, LOW);
     digitalWrite(LED4, LOW);
     delay(quarter);
     
     CState = 0;
  }
  else
  {
     digitalWrite(LED1, LOW);
     digitalWrite(LED2, LOW);
     digitalWrite(LED3, LOW);
     digitalWrite(LED4, LOW);
  }
}
