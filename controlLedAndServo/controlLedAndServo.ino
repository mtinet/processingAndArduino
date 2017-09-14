#include <Servo.h>
#define led 11

Servo myServo;

int valBtightness = 0;
int valServo = 0;

void setup() {
  Serial.begin(9600);
  pinMode(led, OUTPUT);
  myServo.attach(3);
}

void loop() {
  receiveData();
  if(Serial.read() == '\n') {
    adaptBrightnessData();
    adaptDegreeData();    
  }
}

void receiveData() {
  if(Serial.available()) {
    valBtightness = Serial.parseInt();
    valServo = Serial.parseInt();
    Serial.print(valBtightness);
    Serial.print("   ");
    Serial.println(valServo);
  }
}
void adaptBrightnessData() {
  analogWrite(led, valBtightness); 
}

void adaptDegreeData() {
  myServo.write(valServo); 
  delay(15);
}
