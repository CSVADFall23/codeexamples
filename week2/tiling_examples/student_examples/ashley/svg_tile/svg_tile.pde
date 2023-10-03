//pshape tiling
PShape tile;
float rW = 150;                //rw=width and rH of the internal grids
float rH = 150;
float[] patternA = {.75, .75, .75, .75};


float [][] patternList = {patternA};

void setup() {
  tile = loadShape("tile2.svg");      //name of the svg image
  
  
  size(800, 800);                      //size of canvas
  background(0);                      // color of the background
  noFill();
  stroke(255);


  int patternIndex = 0;
  for (int j=0; j<height/rH; j++) {
    int t = 0;
    float[] targetPattern = patternList[patternIndex];
    patternIndex ++;
    if (patternIndex > patternList.length-1) {
      patternIndex = 0;
    }

    for (int i=0; i<width/rW; i++) {
      float v = targetPattern[t];
      float r = toQuadrant(v);
      drawSeed(i*rW, j*rH, r);
      t++;
      if (t>targetPattern.length-1) {
        t = 0;
      }
    }
  }
}
void draw() {
}

float toQuadrant(float v) {
  if (v <=.25) {
    return 2*PI;      // horizontal lines
  } else 
  {
    return  (PI/4);    // diagonal lines
  }
}

void drawSeed(float x, float y, float r) {
  pushMatrix();
  translate(x+rW/2, y+rH/2);
  rotate(r);
  noFill();
  shape(tile,0,0,rW,rH);

  popMatrix();
}
