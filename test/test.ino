/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */
 
// Pin 13 has an LED connected on most Arduino boards.
// give it a name:
int led = 13;
int rn=3,rp=6;
int ln=9,lp=11;

// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
    pinMode(rp, OUTPUT); 
      pinMode(rn, OUTPUT); 
      pinMode(lp, OUTPUT); 
      pinMode(ln, OUTPUT); 
  pinMode(led, OUTPUT);     
}

// the loop routine runs over and over again forever:
void loop() {
  analogWrite(rp, 100);   // turn the LED on (HIGH is the voltage level)
    digitalWrite(rn, LOW);    // turn the LED off by making the voltage LOW
    analogWrite(lp, 100);   // turn the LED on (HIGH is the voltage level)
    digitalWrite(ln, LOW);    // turn the LED off by making the voltage LOW  
  delay(1200);               // wait for a second
  
    digitalWrite(rn, LOW);    // turn the LED off by making the voltage LOW
    digitalWrite(ln, LOW);    // turn the LED off by making the voltage LOW  
  digitalWrite(rp, LOW);    // turn the LED off by making the voltage LOW
      digitalWrite(lp, LOW);    // turn the LED off by making the voltage LOW  
  delay(1000);               // wait for a second

  
  digitalWrite(rp, LOW);    // turn the LED off by making the voltage LOW
    analogWrite(rn, 100);   // turn the LED on (HIGH is the voltage level)
      digitalWrite(lp, LOW);    // turn the LED off by making the voltage LOW
    analogWrite(ln, 100);   // turn the LED on (HIGH is the voltage level)

  delay(1300);               // wait for a second
  
      digitalWrite(rn, LOW);    // turn the LED off by making the voltage LOW
    digitalWrite(ln, LOW);    // turn the LED off by making the voltage LOW  
  digitalWrite(rp, LOW);    // turn the LED off by making the voltage LOW
      digitalWrite(lp, LOW);    // turn the LED off by making the voltage LOW  
  delay(1000);               // wait for a second

  
  
}
