#define potentio A0

int valPotentio = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  valPotentio = analogRead(potentio);
  valPotentio = map(valPotentio, 0, 1023, 0, 255);
  Serial.write(valPotentio);
//   Serial.print("\n");
}
