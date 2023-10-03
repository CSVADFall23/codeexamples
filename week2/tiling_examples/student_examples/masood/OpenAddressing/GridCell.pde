// Making up for Processing/Java's lack of statics by using globals.
// Not good, but a compromise.

// Number of steps in gradation from start to end color.
int GridCell_numSteps = 1000; // must be even

float fillProp = 0.5;

class GridCell {

  int step = 0;

  color c;

  int xLoc;
  int yLoc;

  boolean isOn = false;
  boolean borderOn = false;

  GridCell(int _xLoc, int _yLoc) {
    xLoc = _xLoc;
    yLoc = _yLoc;

    c = startColor;
  }

  void display() {
    push();
    float trX = 0.5 + (width-xDim*cellSq)/2 + xLoc*cellSq + cellSq*fillProp/2;
    float trY = 0.5 + (height-yDim*cellSq)/2 + + yLoc*cellSq + cellSq*fillProp/2;
    translate(trX, trY);
    noStroke();
    if (step < GridCell_numSteps/2) {
      c = lerpColor(startColor, midColor, map(step, 0, GridCell_numSteps, 0, 1.0));
    } else {
      c = lerpColor(midColor, endColor, map(step, 0, GridCell_numSteps, 0, 1.0));
    }
    fill(c);
    rect(0, 0, cellSq*fillProp, cellSq*fillProp);
    pop();
  }
}
