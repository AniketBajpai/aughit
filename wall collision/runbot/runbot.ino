#include <Servo.h>

Servo myServo;
int rn=5,rp=6;
//int ln=9,lp=11;
int servopin=9;
double totalX=800.0;
double timeTot=6000.0;
int angle=90;
int flag=0;
void setup() {                
  // initialize the digital pin as an output.
  pinMode(rp, OUTPUT); 
  pinMode(rn, OUTPUT); 
  //pinMode(lp, OUTPUT); 
  //pinMode(ln, OUTPUT);
  myServo.attach(servopin); 
  Serial.begin(9600);
  myServo.write(90);
}

// the loop routine runs over and over again forever:
void loop() {
  float data=0,t1=0;
  int t=0;
  int p=0;
  if(Serial.available())
  {
    myServo.write(90);
    data=Serial.parseFloat();
    angle=(int)Serial.parseFloat();
    //data=p;
    if(flag==0)
      flag=1;
    //data=p/1000;
    //angle=p%1000;
    //Serial.print(p);
    //Serial.print(" ");
    //Serial.print(data);
    //Serial.print(" ");
    //Serial.println(angle);
    t1=abs(data*timeTot/totalX);
    t=(int)t1;
    if(data<0)
    {
      //analogWrite(rp, 100);   // turn the LED on (HIGH is the voltage level)
      digitalWrite(rn, HIGH);    // turn the LED off by making the voltage LOW
      digitalWrite(rp, LOW);
     // turn the LED on (HIGH is the voltage level)
      //digitalWrite(ln, LOW);    // turn the LED off by making the voltage LOW  
      delay(t);
      digitalWrite(rn,LOW);      // wait for a second      
    }
    else if(data>0)
    {
      digitalWrite(rp, HIGH);    // turn the LED off by making the voltage LOW
      //analogWrite(rn, 100);   // turn the LED on (HIGH is the voltage level)
      digitalWrite(rn, LOW);    // turn the LED off by making the voltage LOW
      //analogWrite(ln, 102);
      delay(t);
      digitalWrite(rp,LOW);   // turn the LED on (HIGH is the voltage level)
                     // wait for a second
    }
    else
    {
      digitalWrite(rn, LOW);    // turn the LED off by making the voltage LOW
      //digitalWrite(ln, LOW);    // turn the LED off by making the voltage LOW  
      digitalWrite(rp, LOW);    // turn the LED off by making the voltage LOW
      //digitalWrite(lp, LOW);
    }
    myServo.write(angle);
  }
  
  /*if(angle<0)
    angle;*/
  //myServo.write(angle);  // turn the LED off by making the voltage LOW  */
}
