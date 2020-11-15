#include <SoftwareSerial.h>

SoftwareSerial bluetooth(0, 1);

String state;

// the setup function runs once when you press reset or power the board
void setup()
{
  Serial.begin(9600);

  bluetooth.begin(9600);

  pinMode(LED_BUILTIN, OUTPUT);
}

// the loop function runs over and over again forever
void loop()
{
  if (Serial.available() > 0) {
    state = Serial.readString();
    Serial.println(state);
    if (state[0] == '1') {
      digitalWrite(LED_BUILTIN, HIGH); 
      Serial.println("LED ON");
    } else if (state[0] == '0') {
      digitalWrite(LED_BUILTIN, LOW);
      Serial.println("LED OFF");
    }
  }
}
