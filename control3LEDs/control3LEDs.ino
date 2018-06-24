char val; // Data received from the serial port
 
int ledRed = 8; // Set the pin to digital I/O 4
int ledYellow = 9; 
int ledGreen = 10;

void setup() {
pinMode(ledRed, OUTPUT); // Set pin as OUTPUT
pinMode(ledYellow, OUTPUT);
pinMode(ledGreen, OUTPUT);
Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {
  while (Serial.available()) { // If data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  if (val == 'a') { 
   digitalWrite(ledRed, HIGH);
   digitalWrite(ledYellow, LOW);
   digitalWrite(ledGreen, LOW);
  } else if (val == 'b') {
   digitalWrite(ledRed, LOW);
   digitalWrite(ledYellow, HIGH);
   digitalWrite(ledGreen, LOW);
  } else if (val == 'c') {
   digitalWrite(ledRed, LOW);
   digitalWrite(ledYellow, LOW);
   digitalWrite(ledGreen, HIGH);
  } else if (val == 'd') {
   digitalWrite(ledRed, LOW);
   digitalWrite(ledYellow, LOW);
   digitalWrite(ledGreen, LOW);
  } 
}
