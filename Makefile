all: mikuni-54mm test

mikuni: mikuni-54mm

test: test.stl

mikuni-54mm: mikuni-54mm-a.stl mikuni-54mm-b.stl

mikuni-54mm-a.stl: mikuni-54mm.scad
	openscad -o mikuni-54mm-a.stl -D 'stackNotches=2;fragments=36;' mikuni-54mm.scad

mikuni-54mm-b.stl: mikuni-54mm.scad
	openscad -o mikuni-54mm-b.stl -D 'stackNotches=1;fragments=36;' mikuni-54mm.scad

test.stl: test.scad basic.scad
	openscad -o test.stl test.scad

zip: Makefile all 
	zip vstack.zip Makefile *.scad *.stl

clean:
	rm -rf *.stl
	rm -rf *.zip
