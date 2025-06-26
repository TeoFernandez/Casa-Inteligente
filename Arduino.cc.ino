#include <Servo.h>
//

Servo servoMotor;  // Define el objeto servo

int servoPin = 6;
int ledDormitorio = 7;
int ledLiving = 9;
int ledCocina = 10;
int ledbanio = 8;
int ledGaraje = 11;
int ledPuerta = 12;


bool garageAbierto = false;  // Variable para controlar el estado del garaje

void setup() {
  servoMotor.attach(servoPin);  // Asigna el pin del servo al objeto servo

  pinMode(ledDormitorio, OUTPUT);
  pinMode(ledLiving, OUTPUT);
  pinMode(ledbanio, OUTPUT);
  pinMode(ledCocina, OUTPUT);
  pinMode(ledGaraje, OUTPUT);
  pinMode(ledPuerta, OUTPUT);
  


  Serial.begin(9600);  // Inicializa la comunicación serial
}

void loop() {
  if (Serial.available() > 0) {
    char command = Serial.read();

    switch(command) {
      case 'A':
        digitalWrite(ledDormitorio, HIGH);  // Enciende el LED del dormitorio
        break;
      case 'a':
        digitalWrite(ledDormitorio, LOW);  // Apaga el LED del dormitorio
        break;       
      case 'B':
        digitalWrite(ledLiving, HIGH);  // Enciende el LED del living
        break;
      case 'b':
        digitalWrite(ledLiving, LOW);  // Apaga el LED del living
        break;
      case 'C':
        digitalWrite(ledCocina, HIGH);  // Enciende el LED de la cocina
        break;
      case 'c':
        digitalWrite(ledCocina, LOW);  // Apaga el LED de la cocina
        break;
      case 'F':
        digitalWrite(ledbanio,HIGH);
        break;
      case 'f':
        digitalWrite(ledbanio, LOW);
        break;
      case 'E':
        if (!garageAbierto) {
          servoMotor.write(90);  // Abre el garaje
          garageAbierto = true;
        }
        digitalWrite(ledGaraje, LOW);
        break;
      case 'e':
        if (garageAbierto) {
          servoMotor.write(0);   // Cierra el garaje
          garageAbierto = false;
        }
        digitalWrite(ledGaraje, HIGH);
        break;
      case 'D':
        digitalWrite(ledPuerta, HIGH);  // Enciende el LED de la puerta
        break;
      case 'd':
        digitalWrite(ledPuerta, LOW);  // Apaga el LED de la puerta
        break;
    }
  }
}

