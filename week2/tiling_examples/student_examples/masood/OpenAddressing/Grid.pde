int probeInterval = 15;

class Grid {

  float cellSq;

  int largestP;

  GridCell[] cellArray;

  float seed = 0.0; // A number from 0 to 1 that describes the percentage of points to be filled initially.

  color lineColor;
  // float borderW = .25;
  float borderW = 1;
  
  boolean animationComplete;

  PVector currentLoc;
  PVector destination;

  Grid(float _cellSq) {
    cellSq = _cellSq;

    lineColor = color(255, 50);

    largestP = sievePrime(xDim*yDim);

    cellArray = new GridCell[largestP];

    for (int i = 0; i < cellArray.length; i++) {
      int x = calcX(i);
      int y = calcY(i);
      cellArray[i] = new GridCell(x, y);
    }

    seedGrid(seed);

    currentLoc = new PVector(0, 0);
    destination = new PVector(2, 1);
  }

  void seedGrid(float l) {
    for (int i = 0; i < cellArray.length; i++) {
      if (random(1) < l) {
        cellArray[i].isOn = true;
      }
    }
  }

  void displayGrid() {
    push();
    stroke(lineColor);
    strokeWeight(borderW);
    translate((width-xDim*cellSq)/2, (height-yDim*cellSq)/2);
    for (int i=0; i <= xDim; i++) {
      line(i*cellSq, 0, i*cellSq, yDim*cellSq);
    }
    for (int i=0; i <= yDim; i++) {
      line(0, i*cellSq, xDim*cellSq, i*cellSq);
    }
    pop();
  }

  void displayContents() {
    for (int i = 0; i < cellArray.length; i++) {
      if (cellArray[i].isOn) {
        cellArray[i].display();
      }
    }
    // Truncate array down to a prime number. Fill unused spaces with X
    stroke(lineColor);
    strokeWeight(borderW);
    for (int i = 0; i < xDim*yDim; i++) {
      try {
        // This will throw an exception if it's index is out of bounds, which is what we want.
        boolean test = cellArray[i].isOn;
      } 
      catch(Exception e) {
        push();
        float trX = 0.5 + (width-xDim*cellSq)/2 + calcX(i)*cellSq + cellSq*fillProp/2;
        float trY = 0.5 + (height-yDim*cellSq)/2 + + calcY(i)*cellSq + cellSq*fillProp/2;
        translate(trX, trY);
        line(0, 0, cellSq*fillProp, cellSq*fillProp);
        line(cellSq*fillProp, 0, 0, cellSq*fillProp);
        pop();
      }
    }
    int randomHashX = new Random().nextInt(xDim);
    int randomHashY = new Random().nextInt(yDim);
    place(randomHashX, randomHashY);
  }

  void place(int startX, int startY) {
    int placementIndex = startX * startY;

    // algorithm
    // 1. if the cell is full,
    // 2. look to the next cell (at the probe interval)
    // 3. repeat step 2 until either until you find one that is empty OR
    // 4. if you've looked through all cells then break

    for (int i = 0; i < xDim*yDim; i++) {
      int adjustedIndex = (placementIndex + i) % cellArray.length;
      if (cellArray[adjustedIndex].isOn) {
        cellArray[adjustedIndex].step = (cellArray[adjustedIndex].step + 1) % GridCell_numSteps;
        placementIndex = (placementIndex + probeInterval) % cellArray.length;
      } else {
        cellArray[adjustedIndex].isOn = true;
        break;
      }
    }
    
  }
}
