/*
  
 Open Addressing:
 A Visualization
 
 programmed
 by
 M A S O O D
 
 Initiated: 1/15/2021
 Last Updated: 1/18/2021
 
 Note: This program is a visualization memory in the linear probing
 method of open addressing hash tables. The program exploits a quality
 of arrays of prime numbered lengths that allows complete coverage
 regardless of interval.
 
 The program populates cells at random. If a cell is occupied, it
 looks to the next cell at a specified interval modulus the prime
 length of the array.
 
 The color representation is a circular heat map from blue to orange.
 The more often a cell is accessed, the more its color shifts from
 blue to orange. The number of grades between blue and orange can
 be changed and alters the visual effect.
 
 */

import java.util.Arrays;
import java.util.Random;

// Constants for gradient function
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

// Grid
Grid grid;
int xDim = 165;
int yDim = 90;
float cellSq = 15;

// Color gradation of cells.
color startColor;
color midColor;
color endColor;
boolean debugColor = false;

void setup() {
  noCursor();
  fullScreen(P2D);

  //size(1000,1000,P2D);

  c1 = color(#00918a);
  c2 = color(#819139);

  if (debugColor) {
    startColor = color(255, 255, 255);
    endColor = color(#cbb356);
  } else {
    //startColor = color(#f99d1c);
    //midColor = 
    //endColor = color(#cbb356);
    startColor = color(#4a5094); // Version 1 Subdued Blue
    //startColor = color(#2d38b3); // Version 2 Slightly higher key blue
    midColor = color(#f8f2b3);
    endColor = color(#ea8f3e); // Version 1 Subdued Orange
    // endColor = color(#f99d1c); // Version 2 Slightly higher key orange.
    // endColor = color(#ff9500); // Version 3 Full on 100% orange.
  }

  PVector dim = new PVector(xDim, yDim);

  grid = new Grid(cellSq);
  
}

void draw() {
  setGradient(0, 0, width, height, c1, c2, X_AXIS);
  grid.displayGrid();
  grid.displayContents();
  
  // For creating still images.
  // saveFrame("probe6-2/probeInterval6-2-######.png");
}
