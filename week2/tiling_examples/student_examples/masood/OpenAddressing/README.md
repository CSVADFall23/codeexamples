# Open Addressing

A hash table visualization of linear probing using a user determined rehash value AKA a probing interval. 

## Description

This program is a visualization memory in the linear probing method of open addressing hash tables. The program exploits a quality of arrays of prime numbered lengths that allows complete coverage regardless of interval.

The program populates cells at random. If a cell is occupied, it looks to the next cell at a specified interval modulus the prime length of the array.

The color representation is a circular heat map from blue to orange. The more often a cell is accessed, the more its color shifts from blue to orange. The number of grades between blue and orange can be changed and alters the visual effect. It starts over when it goes through each cycle.

**Note:** To make this beautiful I had to be bad. This would be considered a **bad** implementation of a hash table because the visualization fills up and what you're seeing are constant collisions, which is what the computer scientist is trained to minimize. 🤷🏽‍♂️

## Example Image

![Sample](Sample.gif)