//to do
//add a siz PVector and use ti to make the size of the ellipse
//change the speed to a vel pvector
//change the PVector array to a PVector array list


int numCircles = 10;


PVector[] pos = new PVector[numCircles];
ArrayList<PVector> pList = new ArrayList<PVector>();
PVector[] siz = new PVector[numCircles];

float speed = -6;

void setup() {
  fullScreen();

  for (int i = 0; i < numCircles; i++) {
    pos[i] = new PVector(width + 150 + i*300, height*0.8);
    siz[i] = new PVector(50+random(0, 150), 50+random(0, 150));
  }
}

void draw() {
  background(0);

  for (int i = 0; i < numCircles; i++) {
    //update
    pos[i].x += speed;
    //check
    
   if(pos[i].x < -siz[i].x/2){
     pos[i].x = width + siz[i].x/2;//radius of the ellipse
   }

    //draw
    ellipse(pos[i].x, pos[i].y, siz[i].x, siz[i].y);
  }
}
