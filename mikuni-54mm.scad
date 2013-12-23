include <basic.scad>;

carbOuterDiameter = 54; // Outer diameter of the carb lip
carbDepth = 10; // Depth of the lip around the carb

stackBellDiameter = 90; // Diameter of the bell
stackHeight = 40; // Height of the stack (not including carb)

fragments = 48; // Determines overall quality of mesh

difference() {
	cylinder(r1 = (carbOuterDiameter+4)/2, r2 = (carbOuterDiameter+2)/2, h = carbDepth, $fn=32);
	cylinder(r1 = (carbOuterDiameter+1)/2, r2 = (carbOuterDiameter)/2, h = carbDepth, $fn=32);
}

translate([0,0,carbDepth])
	basic_vstack(carbOuterDiameter+2, carbOuterDiameter, stackHeight, stackBellDiameter, $fn=32);