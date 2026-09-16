// some aluminium profiles with "holes" in them for screws.
use <screwHeads.scad>

module profile_l() {
    width=50;
    height=25;
    wallThickness=4;
    difference() {
        square([width, height], true);
        translate([-wallThickness/2, -wallThickness/2, 0]) {
            square([width-wallThickness, height-wallThickness], true);
        }
    }
}

module profile_flat() {
    width=50;
    wallThickness=4;
    square([width, wallThickness], true);
}


//profile_l();
//profile_flat();

module sample() {
    
    translate([0,50,0]) {
        difference() {
            linear_extrude(height=10) {
                profile_flat();
            }
            // screw for the drawer rail bracket.  To the side panel of the cabinet.
            translate([0,-2,5])
            #rotate([-10,0,90]) {
                screw_8G(shaftLength=10);
            }
            // screw for the drawer rail bracket.  To the drawer rail itself.
            translate([25-9,2,5])
            #rotate([0,0,270]) {
                screw_runner(shaftLength=10);
            }
        }
    }

    translate([0,0,0]) {
        difference() {
            linear_extrude(height=10) {
                profile_l();
            }
            // screw for the drawer rail bracket.  To the side panel of the cabinet.
            translate([0,12.5,5])
            #rotate([-10,0,270]) {
                screw_8G(shaftLength=10);
            }
            // screw for the drawer rail bracket.  To the drawer rail itself.
            translate([21,0,5])
            #rotate([0,0,0]) {
                screw_runner(shaftLength=10);
            }
        }
    }

    
}


module washer() {
    difference() {
        cube([0.5,10,10], true);
        #translate([-5,0,0]) {
            screw_runner(shaftLength=10);
        }
    }
}

sample();

//washer();
