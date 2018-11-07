import processing.serial.*;

Serial myPort; 

int val = 0;

void setup() {
  size(255, 200);
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  background(255);
  
  while (myPort.available() > 0) {
    val = myPort.read();
    println(val);
  }
  
  fill(255, 0, 0);
  ellipse(val, height/2, 50, 50);
}
