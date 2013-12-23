all: mikuni-54mm.stl 

mikuni: mikuni-54mm.stl

mikuni-54mm.stl: mikuni-54mm.scad
	openscad -o mikuni-54mm.stl mikuni-54mm.scad

test.stl: test.scad basic.scad
	openscad -o test.stl test.scad

zip: Makefile all 
	zip vstack.zip Makefile *.scad *.stl

clean:
	rm -rf *.stl
	rm -rf *.zip
