Object obj1;
Object obj2;
Player plyr;
Collisions col;
float[] moveVect;

void setup() {
  size(800, 600);
  
  obj1 = new Object(20, 20, 40, 40);
  obj2 = new Object(80, 20, 40, 40);
  plyr = new Player(20, 120, 20, 40);
  
  col = new Collisions();
  col.addCollider(obj1.getCollider());
  col.addCollider(obj2.getCollider());
  col.addCollider(plyr.getCollider());
  
  moveVect = new float[2];
  moveVect[0] = 0;
  moveVect[1] = 0;
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    moveVect[0] = -1;
  } else if (key == 'd' || key == 'D') {
    moveVect[0] = 1;
  }
  
  if (key == 'w' || key == 'W') {
    moveVect[1] = -1;
  } else if (key == 's' || key == 'S') {
    moveVect[1] = 1;
  }
}

void keyReleased() {
  if ((key == 'a' || key == 'A') && moveVect[0] < 0) {
    moveVect[0] = 0;
  } else if ((key == 'd' || key == 'D') && moveVect[0] > 0) {
    moveVect[0] = 0;
  }
  
  if ((key == 'w' || key == 'W') && moveVect[1] < 0) {
    moveVect[1] = 0;
  } else if ((key == 's' || key == 'S') && moveVect[1] > 0) {
    moveVect[1] = 0;
  }
}

void draw() {
  background(0);
  obj1.show();
  obj2.show();
  plyr.move(moveVect);
  plyr.show();
  if (col.hasCollisions()) println("Collision detected!");
}
