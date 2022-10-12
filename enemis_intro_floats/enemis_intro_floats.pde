//to do
//add a siz PVector and use ti to make the size of the ellipse
//change the speed to a vel pvector
//change the PVector array to a PVector array list


int numCircles = 10;

int dim = 15;

PVector[] pos = new PVector[numCircles];
ArrayList<PVector> pList = new ArrayList<PVector>();

PVector[] siz = new PVector[numCircles];
ArrayList<PVector> sList = new ArrayList<PVector>();

float speed = -6;

void setup() {
  fullScreen();
  noCursor();
  for (int i = 0; i < numCircles; i++) {
    pos[i] = new PVector(width + 150 + i*300, height*0.8);
    siz[i] = new PVector(50+random(0, 150), 50+random(0, 150));
    
    pList.add(new PVector(width + 150 + i*300, height*0.3));
    sList.add(new PVector(50+random(0, 150), 50+random(0, 150)));
  }
}


void crossHairs(float x, float y) {
  noFill();
  stroke(200, 0, 0);
  strokeWeight(5);
  
  ellipse(x, y, 5, 5);
  ellipse(x, y, 50, 50);
  strokeWeight(1);
  
  line(x, y-10, x, y-25);
  line(x, y+10, x, y+25);
  line(x-10, y, x-25, y);
  line(x+10, y, x+25, y);
}

void targets(float x, float y, float z){
  noStroke();
  //set the fill to black
  fill(0);
  //draw the largest ellipse
  ellipse(x, y, z, z);
  //set the fill to white
  fill(255);
  //draw the middle ellipse
  ellipse(x, y, z*0.7, z*0.7);
  //set the fill to red
  fill(255, 0, 0);
  //draw the bullseye
  ellipse(x, y, z*0.3, z*0.3);
  
}



void draw() {
  background(30);
  
  for (int i = 0; i < numCircles; i++) {
    //update
    pos[i].x += speed;
    pList.get(i).x += speed;
    
    //check

    if (pos[i].x < -siz[i].x/2) {
      pos[i].x = width + siz[i].x/2;//radius of the ellipse
    }
    
    if (pList.get(i).x < -sList.get(i).x/2) {
      pList.get(i).x = width + sList.get(i).x/2;//radius of the ellipse
    }

    //draw
    //ellipse(pos[i].x, pos[i].y, siz[i].x, siz[i].y);
    targets(pList.get(i).x, pList.get(i).y, sList.get(i).x);
    
  }
  
  crossHairs(mouseX, mouseY);

}
