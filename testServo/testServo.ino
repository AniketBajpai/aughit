int gnd=2,vcc=3,inp=4;
#include <Servo.h> 
 
Servo myservo;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
 
int pos = 0;    // variable to store the servo position 

void setup()
{
  pinMode(gnd,OUTPUT);
    pinMode(vcc,OUTPUT);
      pinMode(inp,OUTPUT);
      Serial.begin(9600);
      myservo.attach(8);  // attaches the servo on pin 9 to the servo object 
}
void loop()
{
 // int x=(int)Serial.parseFloat();
 while(Serial.available()>0)
  {
    pos=Serial.parseInt();
  }
  digitalWrite(vcc,HIGH);
  digitalWrite(gnd,LOW);
//      digitalWrite(vcc,HIGH);
  myservo.write(pos);              // tell servo to go to position in variable 'pos' 
}
