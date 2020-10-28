#include <SoftwareSerial.h>

SoftwareSerial bluetooth(0,1);

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);

  bluetooth.begin(9600);
  
  pinMode(LED_BUILTIN, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);                       // wait for a second
}
