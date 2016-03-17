# SCADVelocityStack
This project provides an OpenSCAD module for a parametric velocity stack.  I've included an example application 
for Mikuni 54mm carburetors for the Honda CB-750 Dual Cam.

## Included files
* **velocity_stack.scad** contains the velocity_stack module
* **test.scad** contains a sample velocity stack
* **mikuni-54mm.scad** is an example application that generates 2 similar models for the Honda CB750 DOHC mikuni carburetors

## Generating Example Models
Either open the example files (mikuni-54mm.scad or test.scad) in OpenSCAD to generate the models or use ``make`` within the project directory.

Make will create both variants of the mikuni-54mm model.  See the **Makefile** for how this is done.
