// a set of countersunk screw heads.
module screwHead(diameter, height, shaftDiameter, shaftLength=0) {
    rotate([0,90,0]) {
        cylinder(h=height, d1=diameter, d2=shaftDiameter, $fn=360);
        cylinder(h=height+shaftLength, d=shaftDiameter, $fn=360);
    }
}

module screwHead_8G() {
    screwHead(8.25, 3, 4.25);
}

module screw_8G(shaftLength=10) {
    screwHead(8.25, 3, 4.25, shaftLength);
}

module screwHead_runner() {
    screwHead_8G(); // same as 8G, but named for clarity in the drawer rail bracket context.
}

module screw_runner(shaftLength=10) {
    screw_8G(shaftLength); // same as 8G, but named for clarity in the drawer rail bracket context.
}