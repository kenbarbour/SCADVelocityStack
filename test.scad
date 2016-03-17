include <velocity_stack.scad>;
od = 50; // Outer diameter
id = 45; // Inner diameter
h  = 40; // Height
b  = 60; // Bell diameter
$fn = 15; // Number of fragments (mesh quality)

velocity_stack(od, id, h, b, $fn = $fn);
