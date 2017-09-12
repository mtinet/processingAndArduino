import processing.serial.*;

Serial myPort;
PFont f;
int val = 0;

int x = 0;

void setup() {
  size(800, 400);
  //printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
  
  //String[] fontList = PFont.list();
  //printArray(fontList);
  f = createFont("휴먼명조", 16);
}

void draw() {
  background(255);
  
  gauge();
  // 밝기를 조절할 때 주석 해제  
  //expressBrightness();
  //sendBrightnessData();
  
  // 서보모터 각도를 조절할 때 주석 해제  
  expressDegree();
  sendDegreeData();
}

void gauge() {
  fill(0, 200, 255);
  rect(100, 100, 600, 100); 
  
  x = mouseX-100;
  x = constrain(x, 0, 600);
  print(x);
  print("  ");
  
  fill(255, 0, 0);
  rect(100, 100, x, 100); 
}

void expressBrightness() {
  textFont(f);
  textSize(100);
  
  x = int(map(x, 0, 600, 0, 255));
  println(x);

  fill(255, 0, 0);
  text("밝기 = "+ x, 150, 300);
}

void sendBrightnessData() {
  myPort.write(x);
}

void expressDegree() {
  textFont(f);
  textSize(100);
  
  x = int(map(x, 0, 600, 0, 180));
  println(x);

  fill(255, 0, 0);
  text("각도 = "+ x, 150, 300);
}

void sendDegreeData() {
  myPort.write(x);
}
