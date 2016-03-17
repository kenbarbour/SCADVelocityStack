include <velocity_stack.scad>;

carbOuterDiameter = 54; // Outer diameter of the carb lip
carbDepth = 10; // Depth of the lip around the carb
carbSpacing = 25.25; // Space between outer diameters of each carb

stackBellDiameter = 90; // Diameter of the bell
stackHeight = 40; // Height of the stack (not including carb)
stackThickness = 4; // Thickness of the walls of the mesh
stackNotches = 2; // Relieves edges of bell so stacks can be placed in a row (0, 1, or 2)

lipThickness = 0.5; // Thickness (or additional radius) of the lip around the base of the vstack
lipHeight = 1.5; // overall height of the lip added to base of the vstack

reliefCount = 8; // Number of relief cuts along base of mesh
reliefThickness = 1; // Thickness or width of relief cuts
reliefDepth = 8; // Depth or height of relief cuts

fragments = 16; // Determines overall quality of mesh

difference() {
	union() {

		// Bottom flange
		difference() {
			union() {

				// Outside base (flange)
				cylinder(
					r1 = (carbOuterDiameter+stackThickness)/2,	
					r2 = (carbOuterDiameter+stackThickness/2)/2,
						h = carbDepth,
						$fn=fragments
					);

				// Clamp retaining lip
				cylinder(
						r = (carbOuterDiameter+stackThickness)/2+lipThickness,
						h = lipHeight,
						$fn = fragments
					);
			}

			// Flange bore
			cylinder(
					r1 = (carbOuterDiameter+1.5)/2,
					r2 = (carbOuterDiameter)/2,
					h = carbDepth,
					$fn=fragments
				);
		}
		
		// Velocity stack bell
		translate([0,0,carbDepth])
			basic_vstack(
					carbOuterDiameter+stackThickness/2,
					carbOuterDiameter,
					stackHeight,
					stackBellDiameter, 
					$fn=fragments
				);
	}

	// cut a notch on a single side
	if (stackNotches >= 1)
	translate([carbSpacing/2 + carbOuterDiameter/2,-.5*stackBellDiameter,0]) {
		cube(
				size=[stackBellDiameter,stackBellDiameter,stackHeight+carbDepth],
				center=false
			);
	}

	// cut another notch on the opposite side
	if (stackNotches == 2)
	translate([0 - carbSpacing/2 - carbOuterDiameter/2 - stackBellDiameter, -.5*stackBellDiameter,0]) {
		cube(
				size=[stackBellDiameter,stackBellDiameter,stackHeight+carbDepth],
				center=false
			);
	}

	// relief cuts
	for (i = [0 : reliefCount]) {
		rotate([0,0,360/reliefCount*i])
		translate([reliefThickness/-2,carbOuterDiameter/3,0])
		cube(size=[reliefThickness, carbOuterDiameter/3, reliefDepth], center=false);
	}

}
