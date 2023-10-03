/* Prime Numbers
 https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
 
 To find all the prime numbers less than or equal to a given integer n by 
 Eratosthenes' method:
 
 1. Create a list of consecutive integers from 2 through n: (2, 3, 4, ..., n).
 2. Initially, let p equal 2, the smallest prime number.
 3. Enumerate the multiples of p by counting in increments of p from 2p to n, 
 and mark them in the list (these will be 2p, 3p, 4p, ...; the p itself should
 not be marked).
 4. Find the smallest number in the list greater than p that is not marked. If
 there was no such number, stop. Otherwise, let p now equal this new number 
 (which is the next prime), and repeat from step 3.
 5. When the algorithm terminates, the numbers remaining not marked in the list
 are all the primes below n.
 */

int sievePrime(int ceiling) {

  int[] keyspace = new int[ceiling-1];

  for (int i = 0; i < keyspace.length; i++) {
    keyspace[i]=i+2;
  }

  int p = 2;

  boolean repeat = true;

  while (repeat) {

    // Check to see if keyspace is all zeros
    int acum = 0;
    for (int i = 1; i < keyspace.length; i++) {
      acum += keyspace[i];
      if (acum > 0) {
        repeat = true;
      } else {
        repeat = false;
      }
    }

    // Go thorough and eliminate multiples of p (which starts at 2) 
    for (int i = 0; i < keyspace.length; i++) {
      if (keyspace[i] % p == 0 && keyspace[i] != 0) {
        keyspace[i] = 0;
      }
    }

    // Increment p so the search can start again.
    for (int i = 0; i < keyspace.length; i++) {
      if (keyspace[i] > p && keyspace[i] != 0) {
        p = keyspace[i];
        break;
      }
    }
  }

  return p;
}

// Gradient
// https://processing.org/examples/lineargradient.html

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

// Calculate X and Y of a grid based on an index number.

int calcX(int index) {
  int x = int(index % xDim);
  return x;
}

int calcY(int index) {
  int y = int(index / xDim);
  return y;
}
