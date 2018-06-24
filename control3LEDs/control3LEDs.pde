/**
 * Simple Write. 
 * 
 * Check if the mouse is over a rectangle and writes the status to the serial port. 
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;        // Data received from the serial port

void setup() 
{
  size(600, 200);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0]; // 연결된 USB COM Port를 순서에 맞게 변경하세요. '0'은 첫번째 포트를 나타냅니다.
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(255);
  if (mouseOverRect1() == true) {  // If mouse is over square,
    fill(255, 0, 0);                    // change color and
    rect(50, 50, 100, 100);
    fill(100,75, 25);
    rect(250, 50, 100, 100);
    fill(0, 100, 0);
    rect(450, 50, 100, 100);
    myPort.write('a');              // send an H to indicate mouse is over square
    println("a");
  } else if (mouseOverRect2() == true) {  // If mouse is over square,
    fill(100, 0, 0);                    // change color and
    rect(50, 50, 100, 100);
    fill(255, 185, 55);
    rect(250, 50, 100, 100);
    fill(0, 100, 0);
    rect(450, 50, 100, 100);
    myPort.write('b');              // send an H to indicate mouse is over square
    println("b");
  } else if (mouseOverRect3() == true) {  // If mouse is over square,
    fill(100, 0, 0);                    // change color and
    rect(50, 50, 100, 100);
    fill(100,75, 25);
    rect(250, 50, 100, 100);
    fill(0, 255, 0);
    rect(450, 50, 100, 100);
    myPort.write('c');              // send an H to indicate mouse is over square
    println("c");
  } else {                        // If mouse is not over square,
    fill(100, 0, 0);                    // change color and
    rect(50, 50, 100, 100);
    fill(100,75, 25);
    rect(250, 50, 100, 100);
    fill(0, 100, 0);
    rect(450, 50, 100, 100);
    myPort.write('d');              // send an H to indicate mouse is over square
    println("d");
  }
}

boolean mouseOverRect1() { // Test if mouse is over square
  return ((mouseX >= 50) && (mouseX <= 150) && (mouseY >= 50) && (mouseY <= 150));
}

boolean mouseOverRect2() { // Test if mouse is over square
  return ((mouseX >= 250) && (mouseX <= 350) && (mouseY >= 50) && (mouseY <= 150));
}

boolean mouseOverRect3() { // Test if mouse is over square
  return ((mouseX >= 450) && (mouseX <= 550) && (mouseY >= 50) && (mouseY <= 150));
}

/*
  // Wiring/Arduino code:
 // Read data from the serial and turn ON or OFF a light depending on the value
 
 char val; // Data received from the serial port
 int ledPin = 4; // Set the pin to digital I/O 4
 
 void setup() {
 pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
 Serial.begin(9600); // Start serial communication at 9600 bps
 }
 
 void loop() {
 while (Serial.available()) { // If data is available to read,
 val = Serial.read(); // read it and store it in val
 }
 if (val == 'H') { // If H was received
 digitalWrite(ledPin, HIGH); // turn the LED on
 } else {
 digitalWrite(ledPin, LOW); // Otherwise turn it OFF
 }
 delay(100); // Wait 100 milliseconds for next reading
 }
 
 */
