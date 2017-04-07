import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

pieza agonia;
pieza agonia1;
pieza agonia2;
pieza agonia3;
pieza agonia4;
pieza agonia5;
pieza agonia6;
pieza agonia7;

Spring tortura;
Spring tortura1;
Spring tortura2;
Spring tortura3;
Spring tortura4;
Spring tortura5;
Spring tortura6;
Spring tortura7;

int velx = 0;
int vely = -5;

Box2DProcessing box2d;

float a = 400;
float b = 400;
float c = 400;
float d = 400;


hueso musloI;
hueso piernaI;
hueso musloD;
hueso piernaD;
hueso brazoI;
hueso antebI;
hueso brazoD;
hueso antebD;

ArrayList<Box> boxes;


void setup(){
  size(800,800);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  
  box2d.listenForCollisions();
  agonia = new pieza(480,620);
  agonia1 = new pieza(530,780);
  agonia2 = new pieza(320,620);
  agonia3 = new pieza(270,780);
  agonia4 = new pieza(550,420);
  agonia5 = new pieza(620,500);
  agonia6 = new pieza(250,420);
  agonia7 = new pieza(180,500);
  
  boxes = new ArrayList<Box>();
  
  tortura = new Spring();
  tortura.bind(480,620,agonia);
  
  tortura1 = new Spring();
  tortura1.bind(530,780,agonia1);
  
  tortura2 = new Spring();
  tortura2.bind(320,620,agonia2);
  
  tortura3 = new Spring();
  tortura3.bind(270,780,agonia3);
  
  tortura4 = new Spring();
  tortura4.bind(550,420,agonia4);
  
  tortura5 = new Spring();
  tortura5.bind(620,500,agonia5);
  
  tortura6 = new Spring();
  tortura6.bind(250,420,agonia6);
  
  tortura7 = new Spring();
  tortura7.bind(180,500,agonia7);
  
  musloI = new hueso(420,480,450,480,500,620,460,620);
  piernaI = new hueso(500,620,460,620,510,780,550,780);
  
  musloD = new hueso(380,480,350,480,300,620,340,620);
  piernaD = new hueso(300,620,340,620,290,780,250,780);
  
  brazoI = new hueso(450,320,450,360,530,420,570,420);
  antebI = new hueso(530,420,570,420,640,500,600,500);
  
  brazoD = new hueso(350,320,350,360,270,420,230,420);
  antebD = new hueso(270,420,230,420,160,500,200,500);
  

}




void draw(){
  background(255);
  

  
  box2d.setGravity(velx, vely);
  
  box2d.step();
    fill(200,160,100);
  cuerpo();
  quad(musloI.x1,musloI.y1,musloI.x2,musloI.y2,musloI.x3,musloI.y3,musloI.x4,musloI.y4);
  quad(piernaI.x1,piernaI.y1,piernaI.x2,piernaI.y2,piernaI.x3,piernaI.y3,piernaI.x4,piernaI.y4);
  
  quad(musloD.x1,musloD.y1,musloD.x2,musloD.y2,musloD.x3,musloD.y3,musloD.x4,musloD.y4);
  quad(piernaD.x1,piernaD.y1,piernaD.x2,piernaD.y2,piernaD.x3,piernaD.y3,piernaD.x4,piernaD.y4);
  
  quad(brazoI.x1,brazoI.y1,brazoI.x2,brazoI.y2,brazoI.x3,brazoI.y3,brazoI.x4,brazoI.y4);
  quad(antebI.x1,antebI.y1,antebI.x2,antebI.y2,antebI.x3,antebI.y3,antebI.x4,antebI.y4);
  
  quad(brazoD.x1,brazoD.y1,brazoD.x2,brazoD.y2,brazoD.x3,brazoD.y3,brazoD.x4,brazoD.y4);
  quad(antebD.x1,antebD.y1,antebD.x2,antebD.y2,antebD.x3,antebD.y3,antebD.x4,antebD.y4);

  if (keyPressed) {
    if (key == '0') {
      vely = -20;  
      velx = 0;
    }
  }
  
  if (keyPressed) {
    if (key == '9') {
      velx = -20;
      vely = -20;  
    }
  }
  
  if (keyPressed) {
    if (key == '8') {
      vely = 0; velx = -20;  
    }
  }
  
  if (keyPressed) {
    if (key == '7') {
      vely = 0; velx = 0;  
    }
  }
  

  if (random(5) < 2) {
    Box p = new Box(random(width),random(-50,-5));
    boxes.add(p);
  }
  
  for (Box b: boxes) {
    b.display();
  }
  
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
  
  
  if (random(5) < 2) {
    Box p = new Box(width+random(5,40),random(height));
    boxes.add(p);
  }
  
  for (Box b: boxes) {
    b.display();
  }
  
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
  

  

  if (keyPressed) {
    if (key == 'q' || key == 'Q') {
      noFill();
      stroke(2);
      rect(500,630,120,120);
      if(mouseX>450 && mouseX<570 && mouseY>570 && mouseY<690){
        musloI.x3 = mouseX;
        musloI.y3 = mouseY;
        musloI.x4 = mouseX-30;
        musloI.y4 = mouseY;
        piernaI.x1 = mouseX;
        piernaI.y1 = mouseY;
        piernaI.x2 = mouseX-30;
        piernaI.y2 = mouseY;
        
        tortura.update(mouseX-20,mouseY);
        tortura.display();
      }
    }
  }
  
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      noFill();
      stroke(2);
      rect(500,760,180,80);
        if(mouseX>420 && mouseX<600 && mouseY>720 && mouseY<800){
        piernaI.x4 = mouseX;
        piernaI.y4 = mouseY;
        piernaI.x3 = mouseX-30;
        piernaI.y3 = mouseY;
        tortura1.update(mouseX-20,mouseY);
        tortura1.display();
      }
    }
  }
  
  if (keyPressed) {
    if (key == 'e' || key == 'E') {
      noFill();
      stroke(2);
      rect(290,630,120,120);
        if(mouseX>230 && mouseX<350 && mouseY>570 && mouseY<690){
        musloD.x3 = mouseX-30;
        musloD.y3 = mouseY;
        musloD.x4 = mouseX;
        musloD.y4 = mouseY;
        piernaD.x1 = mouseX;
        piernaD.y1 = mouseY;
        piernaD.x2 = mouseX-30;
        piernaD.y2 = mouseY;
        tortura2.update(mouseX-20,mouseY);
        tortura2.display();
      }
    }
  }
  
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      noFill();
      stroke(2);
      rect(290,760,180,80);
        if(mouseX>200 && mouseX<380 && mouseY>720 && mouseY<800){
        piernaD.x4 = mouseX;
        piernaD.y4 = mouseY;
        piernaD.x3 = mouseX-30;
        piernaD.y3 = mouseY;
        tortura3.update(mouseX-20,mouseY);
        tortura3.display();
      }
    }
  }
  
  if (keyPressed) {
    if (key == 't' || key == 'T') {
      noFill();
      stroke(2);
      rect(520,360,120,220);
      if(mouseX>460 && mouseX<580 && mouseY>250 && mouseY<470){
        brazoI.x3 = mouseX-30;
        brazoI.y3 = mouseY;
        brazoI.x4 = mouseX;
        brazoI.y4 = mouseY;
        antebI.x1 = mouseX;
        antebI.y1 = mouseY;
        antebI.x2 = mouseX-30;
        antebI.y2 = mouseY;
        tortura4.update(mouseX-20,mouseY);
        tortura4.display();
      }
    }
  }
  
  if (keyPressed) {
    if (key == 'y' || key == 'Y') {
      noFill();
      stroke(2);
      rect(580,340,160,270);
        if(mouseX>500 && mouseX<660 && mouseY>200 && mouseY<470){
        antebI.x4 = mouseX;
        antebI.y4 = mouseY;
        antebI.x3 = mouseX-30;
        antebI.y3 = mouseY;
        tortura5.update(mouseX-20,mouseY);
        tortura5.display();
      }
    }
  }
  
  if (keyPressed) {
    if (key == 'u' || key == 'U') {
      noFill();
      stroke(2);
      rect(280,360,120,220);
        if(mouseX>220 && mouseX<360 && mouseY>250 && mouseY<470){
        brazoD.x3 = mouseX;
        brazoD.y3 = mouseY;
        brazoD.x4 = mouseX-30;
        brazoD.y4 = mouseY;
        antebD.x1 = mouseX;
        antebD.y1 = mouseY;
        antebD.x2 = mouseX-30;
        antebD.y2 = mouseY;
        tortura6.update(mouseX-20,mouseY);
        tortura6.display();
      }
    }
  }
  
  if (keyPressed) {
    if (key == 'i' || key == 'I') {
      noFill();
      stroke(2);
      rect(200,335,160,270);
      if(mouseX>140 && mouseX<300 && mouseY>200 && mouseY<470){
        antebD.x4 = mouseX;
        antebD.y4 = mouseY;
        antebD.x3 = mouseX-30;
        antebD.y3 = mouseY;
        tortura7.update(mouseX-20,mouseY);
        tortura7.display();
      }
    }
  }
  
    agonia.display();
    agonia1.display();
    agonia2.display();
    agonia3.display();
    agonia4.display();
    agonia5.display();
    agonia6.display();
    agonia7.display();
    
  fill(150, 200);
  rect(160,120,240,200);
  
  fill(0);
  text("presione las teclas Q, W, E, R, T, Y, U, I",50,50);
  text("para mover las Extremidades",50,65);
  
  text("presione las teclas 1, 2, 3",50,110);
  text("cambiar las propiedades de las particulas",50,125);
  
  text("presione las teclas 7, 8, 9, 0",50,170);
  text("cambiar la dirección de las particulas",50,185);
}


void cuerpo(){
  rect(a,b-90,40,60);
  quad(a-50,b-80,a+50,b-80,a+50,b+80,a-50,b+80);
  ellipse(a,b-160,90,110);
}



class hueso {
  float x1;
  float y1;
  float x2;
  float y2;
  float x3;
  float y3;
  float x4;
  float y4;

  hueso(float x1_, float y1_, float x2_, float y2_, float x3_, float y3_,float x4_, float y4_){
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    x3 = x3_;
    y3 = y3_;
    x4 = x4_;
    y4 = y4_;
  }
}