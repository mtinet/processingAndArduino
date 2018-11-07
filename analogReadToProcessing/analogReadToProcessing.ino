#define potentio A0

int valPotentio = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  valPotentio = analogRead(potentio);
  Serial.print(valPotentio);
  Serial.print("\n");
}
