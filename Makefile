all: mikuni-54mm.stl 

mikuni: mikuni-54mm.stl

mikuni-54mm.stl: mikuni-54mm.scad
	openscad -o mikuni-54mm.stl mikuni-54mm.scad

test.stl: test.scad basic.scad
	openscad -o test.stl test.scad

clean:
	rm -rf *.stl
