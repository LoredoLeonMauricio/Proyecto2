int particula = 0;

class Box{
  Body body;
  float w;
  float h;

  Box(float x, float y){
    w = random(1, 5);
    h = random(1, 5);
  
    makeBody(new Vec2(x, y), w, h);
  }

  void killBody() {
    box2d.destroyBody(body);
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }



void display() {
  Vec2 pos = box2d.getBodyPixelCoord(body);
  float a = body.getAngle();

if (keyPressed) {
    if (key == '1') {
      particula = 1;
    }
  }

if (keyPressed) {
    if (key == '2') {
      particula = 2;
    }
  }
  
if (keyPressed) {
    if (key == '3') {
      particula = 3;
    }
  }

if (particula == 1){
    pushMatrix();
    translate(pos.x, pos.y);
    fill(175);
    stroke(0);
    fill(175,0,0);
    rect(0, 0, w, h);
    popMatrix();
  }
    
  if (particula == 2){
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    fill(0,random(50,200),random(50,200));
    ellipse(0, 0, w+random(5), h+random(5));
    popMatrix();
  }
  
  if (particula == 3){
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a*3);
    fill(175);
    stroke(0);
    fill(random(50,200),0,random(50,200));
    rect(0, 0, w+random(5), h+random(6,10));
    popMatrix();
  }
}

void makeBody(Vec2 center, float w_, float h_) {
  PolygonShape sd = new PolygonShape();
  float box2dW = box2d.scalarPixelsToWorld(w_/2);
  float box2dH = box2d.scalarPixelsToWorld(h_/2);
  sd.setAsBox(box2dW, box2dH);
  FixtureDef fd = new FixtureDef();
  fd.shape = sd;
  fd.density = 10;
  fd.friction = 0.3;
  fd.restitution = 0.7;
  BodyDef bd = new BodyDef();
  bd.type = BodyType.DYNAMIC;
  bd.position.set(box2d.coordPixelsToWorld(center));
  body = box2d.createBody(bd);
  body.createFixture(fd);
  body.setLinearVelocity(new Vec2(0, 0));
  body.setAngularVelocity(10);
  }
}