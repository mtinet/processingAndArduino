#include <Servo.h>
#define led 11

Servo myServo;

int val = 0;

void setup() {
  Serial.begin(9600);
  pinMode(led, OUTPUT);
  myServo.attach(3);
}

void loop() {
  // 밝기를 조절할 때 주석 해제  
  //receiveBrightnessData();
  
  // 서보모터 각도를 조절할 때 주석 해제  
  receiveDegreeData();  
}

void receiveBrightnessData() {
  if(Serial.available()) {
    val = Serial.read();
    //Serial.println(val);
    analogWrite(led, val); 
  }
}

void receiveDegreeData() {
  if(Serial.available()) {
    val = Serial.read();
    //Serial.println(val);
    myServo.write(val); 
    delay(15);
  }
}
