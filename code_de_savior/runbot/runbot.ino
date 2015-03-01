//#include <Servo.h>

//Servo myServo;
int rn=5,rp=6;
//int servopin=10;
double totalX=800.0;
double timeTot=10000.0;
void setup() {                
  // initialize the digital pin as an output.
  pinMode(rp, OUTPUT); 
  pinMode(rn, OUTPUT); 
  //pinMode(lp, OUTPUT); 
  //pinMode(ln, OUTPUT);
  //myServo.attach(servopin); 
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  int t=0,angle;
  float p=0,data=0;
  while(Serial.available())
  {
    p=Serial.parseFloat();
    data=p;
  //data=p/1000;
  //angle=p%1000;
    t=abs(data*timeTot/totalX);
    //t=250;
    if(data<0)
    {
      digitalWrite(rp,HIGH);
      digitalWrite(rn,LOW);
         // turn the LED on (HIGH is the voltage level)
                     // wait for a second
      delay(t);      
    }
    else if(data>0)
    {
      digitalWrite(rp, LOW);    // turn the LED off by making the voltage LOW
      // turn the LED on (HIGH is the voltage level)
      // turn the LED off by making the voltage LOW
      digitalWrite(rn, HIGH);   // turn the LED on (HIGH is the voltage level)
      delay(t);               // wait for a second
    }
    else
    {
      digitalWrite(rn, LOW);    // turn the LED off by making the voltage LOW
      //digitalWrite(ln, LOW);    // turn the LED off by making the voltage LOW  
      digitalWrite(rp, LOW);    // turn the LED off by making the voltage LOW
      //digitalWrite(lp, LOW);
    }
  }
  digitalWrite(rn, LOW);
  digitalWrite(rp, LOW);
  /*if(angle<0)
    angle+=180;
  myServo.write(angle);  // turn the LED off by making the voltage LOW  */
}
