import processing.serial.*;

Serial conexion;
PImage aa1, aa2, ab1, ab2, ba1, ba2, ca1, ca2, cb1, cb2, da1, da2;
int senalaa = 0, senalab = 0, senalba = 0, senalca = 0, senalcb = 0, senalda = 0;

void setup() {
  size(440, 660);
  background(255, 0, 0);
  printArray(Serial.list());
  conexion = new Serial(this, Serial.list()[0]);
  aa1 = loadImage("dormitorio1.jpg");
  aa2 = loadImage("dormitorio2.jpg");
  ab1 = loadImage("living1.jpg");
  ab2 = loadImage("living2.jpg");
  ba1 = loadImage("banio1.jpg");
  ba2 = loadImage("banio2.jpg");
  ca1 = loadImage("cocina1.jpg");
  ca2 = loadImage("cocina2.jpg");
  cb1 = loadImage("garage2.jpg");
  cb2 = loadImage("garage1.jpg");
  da1 = loadImage("puerta1.jpg");
  da2 = loadImage("puerta2.jpg");

  // Coloca las imagenes en sus posiciones iniciales
  image(aa1, 10, 10);
  image(ab1, 230, 10);
  image(ba1, 10, 230);
  image(ca1, 230, 230);
  image(cb1, 10, 450);
  image(da1, 230, 450);
}

void draw() {
  if (mousePressed && mouseButton == LEFT) {
    // Boton Dormitorio
    if (mouseX >= 10 && mouseX <= 210 && mouseY >= 10 && mouseY <= 210) {
      if (senalaa == 0) {
        image(aa1, 10, 10);
        conexion.write('A');
        senalaa = 1;
      } else {
        image(aa2, 10, 10);
        conexion.write('a');
        senalaa = 0;
      }
      delay(150);
    }

    // Botón Living
    if (mouseX >= 230 && mouseX <= 430 && mouseY >= 10 && mouseY <= 210) {
      if (senalab == 0) {
        image(ab1, 230, 10);
        conexion.write('B');
        senalab = 1;
      } else {
        image(ab2, 230, 10);
        conexion.write('b');
        senalab = 0;
      }
      delay(150);
    }

    // Boton Baño
    if (mouseX >= 10 && mouseX <= 210 && mouseY >= 230 && mouseY <= 430) {
      if (senalba == 0) {
        image(ba1, 10, 230);
        conexion.write('C');
        senalba = 1;
      } else {
        image(ba2, 10, 230);
        conexion.write('c');
        senalba = 0;
      }
      delay(150);
    }

    
    
    // Boton Cocina
    if (mouseX >= 230 && mouseX <= 430 && mouseY >= 230 && mouseY <= 430) {
      if (senalca == 0) {
        image(ca1, 230, 230);
        conexion.write('D');
        senalca = 1;
      } else {
        image(ca2, 230, 230);
        conexion.write('d');
        senalca = 0;
      }
      delay(150);
    }
    
    // Botón Puerta
    if (mouseX >= 10 && mouseX <= 210 && mouseY >= 450 && mouseY <= 650) {
      if (senalcb == 0) {
        image(cb1, 10, 450);
        conexion.write('E');
        senalcb = 1;
      } else {
        image(cb2, 10, 450);
        conexion.write('e');
        senalcb = 0;
      }
      delay(150);
    }
    
    // Botón Garage
    if (mouseX >= 230 && mouseX <= 430 && mouseY >= 450 && mouseY <= 650) {
      if (senalda == 0) {
        image(da1, 230, 450);
        conexion.write('F');
        senalda = 1;
      } else {
        image(da2, 230, 450);
        conexion.write('f');
        senalda = 0;
      }
      delay(150);
    }
  }
}



  
