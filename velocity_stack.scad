/**
 * A basic Velocity stack module
 * @param od Outer diameter 
 * @param id Inner diameter (bore)
 * @param h Overall height of the stack
 * @param bell Diameter of bell
 * @param f flare factor (positive integer) defines the harshness of the curve
 */
module velocity_stack(od, id, h, bell, f=3, $fn=32)
{

	heightDivisions = $fn / 4;
	deltaHeight = h / heightDivisions;
	deltaR = (bell - od)/2;
	radius = od/2;
	innerRadius = id/2;

	for ( i = [0 : (heightDivisions - 1)]) {
		translate([0,0,i*deltaHeight]) difference() {
			cylinder(
					r1 = vstack_radius(i/heightDivisions,f)*deltaR+radius, 
					r2=vstack_radius((i+1)/heightDivisions,f)*deltaR+radius,
					h = deltaHeight,
					$fn = $fn
				);
			cylinder(
					r1 = vstack_radius(i/heightDivisions,f)*deltaR+innerRadius,
					r2 = vstack_radius((i+1)/heightDivisions,f)*deltaR+innerRadius,
					h = deltaHeight,
					$fn = $fn
				);
		}
	}
}

/**
 * Poorly named alias of the velocity_stack module
 * @alias velocity_stack
 * @param od Outer diameter 
 * @param id Inner diameter (bore)
 * @param h Overall height of the stack
 * @param bell Diameter of bell
 * @param f flare factor (positive integer) defines the harshness of the curve
 * @deprecated
 */
module basic_vstack(od, id, h, bell, f=3, $fn=32) {
	echo("basic_vstack module is deprecated. Use velocity_stack instead");
	velocity_stack(od, id, h, bell, f, $fn);
}

/**
 * produces the profile radius (from 0 to 1) for some given height (also from 0 to 1)
 * @param x distance along profile (height)
 */
function vstack_radius(x,f) = (pow(x,f));
