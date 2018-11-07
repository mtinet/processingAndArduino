import processing.serial.*;

Serial myPort; 

int val = 0;

void setup() {
  size(255, 200);
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  background(val, val, 0);
  analogRead();
  ball();
  val();
}

void analogRead() {
  while (myPort.available() > 0) {
    val = myPort.read();
    println(val);
  }
}

void ball() {
  fill(255, 0, 0);
  ellipse(val, height/3, 50, 50);
}

void val() {
  fill(0, 255, 200);
  textAlign(CENTER);
  textSize(32);
  text("val = " + val, width/2, 3*height/4);
}
