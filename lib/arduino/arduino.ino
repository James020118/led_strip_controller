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
    // get data from App
    state = Serial.readString();
    Serial.println(state);
    
    // first character: brightness
    // value: a-f
    switch (state[0]){
      case 'a':
        FastLED.setBrightness(0);
        Serial.println("Light Brightness at 0%");
        break;
      case 'b':
        FastLED.setBrightness(20);
        Serial.println("Light Brightness at 20%");
        break;
      case 'c':
        FastLED.setBrightness(40);
        Serial.println("Light Brightness at 40%");
        break;
      case 'd':
        FastLED.setBrightness(60);
        Serial.println("Light Brightness at 60%");
        break;
      case 'e':
        FastLED.setBrightness(80);
        Serial.println("Light Brightness at 80%");
        break;
      case 'f':
        FastLED.setBrightness(100);
        Serial.println("Light Brightness at 100%");
        break;
      default:
        Serial.println("Invalid character");
        break;
    }

    // second character: pattern
    // value: 0-2
    switch (state[1]){
      case '0':
        // set LED to pattern 1
        Serial.println("LED pattern: #1");
        break;
      case '1':
        // set LED to pattern 2
        Serial.println("LED pattern: #2");
        break;
      case '2':
        // set LED to pattern 3
        Serial.println("LED pattern #3");
        break;
      default:
        Serial.println("Invalid character");
        break;
    }

    // third character: frequencies
    // value: 3-9
    switch (state[2]){
      case '3':
        // change frequency to 63Hz
        Serial.println("Frequency at 63Hz");
        break;
      case '4':
        // change frequency to 160Hz
        Serial.println("Frequency at 160Hz");
        break;
      case '5':
        // change frequency to 400Hz
        Serial.println("Frequency at 400Hz");
        break;
      case '6':
        // change frequency to 1kHz
        Serial.println("Frequency at 1kHz");
        break;
      case '7':
        // change frequency to 2.5kHz
        Serial.println("Frequency at 2.5kHz");
        break;
      case '8':
        // change frequency to 6.25kHz
        Serial.println("Frequency at 6.25kHz");
        break;
      case '9':
        // change frequency to 16kHz
        Serial.println("Frequency at 16kHz");
        break;
      default:
        Serial.println("Invalid character");
        break;
    }

    // fourth character: light colour
    // value: A-L
    switch (state[3]){
      case 'A':
        // change color to BLUE
        Serial.println("Color of LED is BLUE");
        break;
      case 'B':
        // change color to GREEN
        Serial.println("Color of LED is GREEN");
        break;
      case 'C':
        // change color to HOT PINK
        Serial.println("Color of LED is HOT PINK");
        break;
      case 'D':
        // change color to ORANGE
        Serial.println("Color of LED is ORANGE");
        break;
      case 'E':
        // change color to RED
        Serial.println("Color of LED is RED");
        break;
      case 'F':
        // change color to PURPLE
        Serial.println("Color of LED is PURPLE");
        break;
      case 'G':
        // change color to YELLOW
        Serial.println("Color of LED is YELLOW");
        break;
      case 'H':
        // change color to TURQUOISE
        Serial.println("Color of LED is TURQUOISE");
        break;
      case 'I':
        // change color to FUCHSIA
        Serial.println("Color of LED is FUCHSIA");
        break;
      case 'J':
        // change color to GOLD
        Serial.println("Color of LED is GOLD");
        break;
      case 'K':
        // change color to SALMON
        Serial.println("Color of LED is SALMON");
        break;
      case 'L':
        // change color to RAINBOW
        Serial.println("Color of LED is RAINBOW");
        break;
      default:
        Serial.println("Invalid character");
        break;
    }
    
  }
}
