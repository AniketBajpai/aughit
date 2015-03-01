int rp=6,rn=5;
void setup()
{
  // put your setup code here, to run once:
  //Serial.begin(9600);
  pinMode(rn,OUTPUT);
  pinMode(rp,OUTPUT);
  Serial.begin(9600);
}

void loop()
{
  int time;
  while(Serial.available()>0)
  {
    time=Serial.parseInt();
    digitalWrite(rn,HIGH);
    digitalWrite(rp,LOW);
    delay(time);
    digitalWrite(rp,LOW);
    digitalWrite(rn,LOW);
    delay(2000);
    digitalWrite(rp,HIGH);
  digitalWrite(rn,LOW);
  delay(time);
  }
  digitalWrite(rp,LOW);
  digitalWrite(rn,LOW);
}
