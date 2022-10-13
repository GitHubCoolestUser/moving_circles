//to do
//spawn in new PVectors
//Add score
//addhit detection


int numCircles = 10;

int dim = 15;


ArrayList<PVector> pList = new ArrayList<PVector>();

float speed = -6;

void setup() {
  fullScreen();
  frameRate(60);
  smooth();
  noCursor();
  for (int i = 0; i < numCircles; i++) {
    spawn_target(i);
  }
}

void mouseClicked() {
  PVector mouse = new PVector(mouseX, mouseY);
  for (int i = 0; i < pList.size(); i++) {
     println(mouse.dist(pList.get(i)) + ", " + pList.get(i).z/2.);
     float d = dist(mouse.x, mouse.y, pList.get(i).x, pList.get(i).y);
     if(d<pList.get(i).z/2.){
       pList.remove(i);
       println(mouse.dist(pList.get(i)));
     
    }
  }
}

void crossHairs(float x, float y) {
  noFill();
  stroke(0, 220, 0);
  strokeWeight(5);

  ellipse(x, y, 5, 5);
  ellipse(x, y, 50, 50);
  strokeWeight(1);

  line(x, y-10, x, y-25);
  line(x, y+10, x, y+25);
  line(x-10, y, x-25, y);
  line(x+10, y, x+25, y);
}

void targets(float x, float y, float z) {
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

void spawn_target(int i) {
  pList.add(new PVector(width + 150 + i*300, height*0.3, 50+random(0, 150)));
}

void draw() {
  background(80);

  if (frameCount % 60 == 0&&pList.size()<numCircles) {  // once every 60 frames or every second
    spawn_target((int)random(0, 5));
  }

  for (int i = 0; i < pList.size(); i++) {
    //update

    pList.get(i).x += speed;

    //check

    if (pList.get(i).x < -pList.get(i).z/2) {// if the x position < half the size
      pList.remove(i);
      i--;
      continue;
    }



    //draw
    //ellipse(pos[i].x, pos[i].y, siz[i].x, siz[i].y);
    targets(pList.get(i).x, pList.get(i).y, pList.get(i).z);
  }

  crossHairs(mouseX, mouseY);
}
