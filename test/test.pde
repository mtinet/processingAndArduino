import processing.serial.*;

Serial myPort;
PFont f;
int valBrightness = 0;
int valServo = 0;
int adjustBrightness = 0;
int adjustServo = 0;

int x = 100;
int y = 100;
int w = 600;
int h = 100;
int distance = 400;

void setup() {
  size(800, 800);
  //printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
  
  //String[] fontList = PFont.list();
  //printArray(fontList);
  f = createFont("휴먼명조", 16);
  
  background(255);
}

void draw() {
  gauge();
  drawGraph();
   
  //expressBrightness();// 밝기를 조절할 때 주석 해제 
  //expressDegree();// 서보모터 각도를 조절할 때 주석 해제  

  sendData();
}

void gauge() {
  //밝기게이지
  fill(0, 200, 255);
  rect(x, y, w, h);
  
  //서보모터 각도 게이지
  fill(0, 200, 255);
  rect(x, x + distance, w, h);
}
  
void gaugeBrightness() {
  valBrightness = mouseX-x;
  valBrightness = constrain(valBrightness, 0, w);
}
void gaugeServo() {
  valServo = mouseX-100;
  valServo = constrain(valServo, 0, w);
}

void drawGraph() {
  fill(255, 0, 0);
  rect(x, y, valBrightness, h);
  fill(255, 0, 0);
  rect(x, x + distance, valServo, h);
}

void expressBrightness() {
  textFont(f);
  textSize(100);
  
  adjustBrightness = int(map(valBrightness, 0, w, 0, 255));

  fill(255, 0, 0);
  text("밝기 = "+ adjustBrightness, 150, 300);
}

void expressDegree() {
  textFont(f);
  textSize(100);
  
  adjustServo = int(map(valServo, 0, w, 0, 180));

  fill(255, 0, 0);
  text("각도 = "+ adjustServo, 150, 700);
}

void sendData() {
  println(adjustBrightness + " " + adjustServo + "\n");
  myPort.write(adjustBrightness + " " + adjustServo + "\n");
}

void mousePressed() {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    valBrightness = mouseX;
  } 
  if (mouseX > x && mouseX < x + w && mouseY > y + distance && mouseY < y + h + distance) {
    valServo = mouseX;
  }
  
}
