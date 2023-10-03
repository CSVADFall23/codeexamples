//truchet tiling 3
import controlP5.*;
ControlP5 cp5;

float rW = 40;
float rH = 40;
float v1 = 0.25;
float v2 = 0.25;
float v3 = 0.25;
float v4 = 0.25;

Controller v1Slider;
Controller v2Slider;
Controller v3Slider;
Controller v4Slider;

void setup() {
  size(800, 800);
  
  cp5 = new ControlP5(this);

  v1Slider =  cp5.addSlider("v1")
    .setPosition(25, 25)
    .setRange(0.25,1)
    .setNumberOfTickMarks(4)
    ;
    
   v2Slider =  cp5.addSlider("v2")
    .setPosition(25, 25*2)
    .setRange(0.25,1)
    .setNumberOfTickMarks(4)
    ;
    
    v3Slider =  cp5.addSlider("v3")
    .setPosition(25, 25*2)
    .setRange(0.25,1)
    .setNumberOfTickMarks(4)
    ;
    
    v3Slider =  cp5.addSlider("v3")
    .setPosition(25, 25*3)
    .setRange(0.25,1)
    .setNumberOfTickMarks(4)
    ;
    
    v4Slider =  cp5.addSlider("v4")
    .setPosition(25, 25*4)
    .setRange(0.25,1)
    .setNumberOfTickMarks(4)
    ;





}
  
void draw() {
background(0);
  noFill();
  stroke(255);

float[] patternA = {v1, v2, v3, v4};
float[] patternB = {v4, v1, v2, v3};
float[] patternC = {v3, v4, v1, v2};
float[] patternD = {v2, v3, v4, v1};

float [][] patternList = {patternA, patternB, patternC, patternD};

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



float toQuadrant(float v) {
  if (v <=0.25) {
    return 2*PI*0.25;
  } else if (v >0.25 && v<=0.5) {
    return  2*PI*0.5;
  } else if (v >0.5 && v<=0.75) {
    return  2*PI*0.75;
  } else {
    return 2*PI;
  }
}

void drawSeed(float x, float y, float r) {
  pushMatrix();
  translate(x+rW/2, y+rH/2);
  rotate(r);
  noFill();
  rectMode(CENTER);
  rect(0, 0, rW, rH); 
  fill(255);
  triangle(-rW/2, -rH/2, rW/2, -rH/2, -rW/2, rH/2);
  popMatrix();
}
