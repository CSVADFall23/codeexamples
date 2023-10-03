// Create a repeating Wallpaper
//
// Mert Toka
// Media Arts and Technology
// merttoka@ucsb.edu
// 01/17/2021
//

float rW = 75;
float rH = rW;
float margin = rW;

int backgroundColor = color(240);
int foregroundColor = color(20);

int[] patternA = {0, 2, 3, 1};
int[] patternB = {2, 0, 1, 3};
int [][] patternList = {patternA, patternB};

void setup() {
  size(1000, 1000);
  background(backgroundColor);
  drawPattern();
  
  //save(int(width/rW) + "x" + int(height/rH) + "_grid.png");
}

void draw() {
}

float toQuadrant(int v) {
  switch(v) {
    case 0:
      return 2*PI;
    case 1:
      return 2*PI*0.25;
    case 2:
      return 2*PI*0.5;
    default:
      return 2*PI*0.75;
  }
}

void drawPattern() {
  int patternIndex = 0;
  for (int j=0; j<height/rH; j++) {
    
    int[] targetPattern = patternList[patternIndex];
    for (int i=0, t=0; i<width/rW; i++) {
      float r = toQuadrant(targetPattern[t++%targetPattern.length]);
      
      drawSeed(i*rW, j*rH, r);
    }
    patternIndex = ++patternIndex % patternList.length;
  }
}

void drawSeed(float x, float y, float r) {
  float x1 = -rW*0.5, x2 = rW*0.5;
  float y1 = -rH*0.5, y2 = rH*0.5;
  
  pushMatrix();
  translate(x+x2, y+y2);
  rotate(r);

  // emission point
  float centerX = (random(-0.1,0.1)+0.35) * rW;
  float centerY = (random(-.05,0.1)-0.45) * rH;
  
  // translucent background rect for vignette
  float fill = map(x, 0, width, -1, 1) * map(y, 0, height, -1, 1);
  noStroke();
  fill(foregroundColor, int(fill*150));
  rect(x1, y1, rW, rH);
  
  // radiating lines
  float n = rW * 0.3;
  stroke(foregroundColor, 100);
  for(int i=0; i<n; i++) {
    float s = map(i, 0, n, 0, rH);
    
    line(centerX, centerY, x1+s, y1);
    line(centerX, centerY, x1,   y2-s);
    line(centerX, centerY, x2,   y1+s);
    line(centerX, centerY, x2-s, y2);
  }
  
  popMatrix();
}
