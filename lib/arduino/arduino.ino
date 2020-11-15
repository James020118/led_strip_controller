#include <SoftwareSerial.h>

//SoftwareSerial bluetooth(0, 1);

char state;

// the setup function runs once when you press reset or power the board
void setup()
{
  Serial.begin(9600);

  //bluetooth.begin(9600);

  pinMode(LED_BUILTIN, OUTPUT);
}

// the loop function runs over and over again forever
void loop()
{
  if (Serial.available() > 0) {
    Serial.write(343);
    
    state = Serial.read();
    if (state == '1') {
      digitalWrite(LED_BUILTIN, HIGH); 
      Serial.println("LED On");
    } else if (state == '0') {
      digitalWrite(LED_BUILTIN, LOW);
      Serial.println("LED Off");
    }
  }
}
