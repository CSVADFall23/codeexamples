/*
arduino_input

Demonstrates the reading of digital and analog pins of an Arduino board
running the StandardFirmata firmware.

To use:
* Using the Arduino software, upload the StandardFirmata example (located
  in Examples > Firmata > StandardFirmata) to your Arduino board.
* Run this sketch and look at the list of serial ports printed in the
  message area below. Note the index of the port corresponding to your
  Arduino board (the numbering starts at 0).  (Unless your Arduino board
  happens to be at index 0 in the list, the sketch probably won't work.
  Stop it and proceed with the instructions.)
* Modify the "arduino = new Arduino(...)" line below, changing the number
  in Arduino.list()[0] to the number corresponding to the serial port of
  your Arduino board.  Alternatively, you can replace Arduino.list()[0]
  with the name of the serial port, in double quotes, e.g. "COM5" on Windows
  or "/dev/tty.usbmodem621" on Mac.
  
* Run this sketch. The circle shows the values of the
  analog input at the specified pin index (default 0) (the bigger the circle, the higher the reading on the
  corresponding analog input pin). Note that the readings from unconnected pins will fluctuate randomly. 
  
For more information, see: http://playground.arduino.cc/Interfacing/Processing
*/

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

void setup() {
  size(470, 280);

  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  //arduino = new Arduino(this, Arduino.list()[2], 57600);
  
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  arduino = new Arduino(this, "/dev/tty.usbmodem21101", 57600);
  
  // Set the Arduino digital pin 13 as inputs.
  arduino.pinMode(13, Arduino.INPUT);
}

void draw() {
  background(255);
  stroke(0);
  
  // Draw a filled box if digital pin 13 reads HIGH (5 volts).
  if (arduino.digitalRead(13) == Arduino.HIGH)
      fill(0);
    else
      noFill();
      
    rect(width/2-50, height/2-50, 100, 100);
}
