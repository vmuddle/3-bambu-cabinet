// A couple of brackets for Drawer Runners that I happen to have.
// Need to have screw holes to match the drawer runners.
// Needs to have Supports for screw to chipboard side of cabinet.
// Needs to have Supports for screw to chipboard base of drawer.
// Needs to have a lip to hold the AMS in place.
// It would be nice if the drawer runner can snugly fit into this bracket.

use <screwHeads.scad>


wallThickness = 2;

runnerLength = 246;
runnerHeight = 17;
runnerDepth = 8;
runnerScrewFront = 10+0;  // to be measured
runnerScrewBack = 32+1;  // to be measured
runnerScrewHeadDiameter = 8.25; // 7.75
runnerScrewHeadHeight = 3; // to be measured
runnerScrewHoleDiameter = 4+0.25; // to be adjusted to fit

amsLipHeight = 3; // to be measured
amsLength = 300; // to be measured

amsLipWidth = 20; // to be adjusted to fit

chipboardHeight = 16; // to be measured

sideBracketHeight = 15; // to adjusted to fit


module sideBracketScrewHoles() {
    screwSpacing=(runnerLength-30)/2;
    translate([1.5,0,0]) {
    rotate([0,0,180]) {
        translate([0,-screwSpacing,0]) {
            screw_8G(shaftLength=10);
        }
        
        screw_8G(shaftLength=10);
        translate([0,screwSpacing,0]) {
            screw_8G(shaftLength=10);
        }
    }
    }
}

module sideBracket() {
    #translate([3/2,0,-sideBracketHeight/2]) {
        difference() {
            cube([3, runnerLength, sideBracketHeight], true);
            sideBracketScrewHoles();
        }
    }
    translate([(runnerDepth+(runnerScrewHeadHeight))/2,0,(runnerHeight+(wallThickness*2))/2]) {
        drawerRailPocket();
    }
}

module drawerBracket() {

}

module runnerScrewHole() {
    rotate([0,90,0]) {
        cylinder(h=runnerScrewHeadHeight, d2=runnerScrewHoleDiameter, d1=runnerScrewHeadDiameter, $fn=360);
        cylinder(h=100, d=runnerScrewHoleDiameter, $fn=360);
    }
}

module drawerRailPocket() {
    length = runnerLength;
    difference() {
        cube([runnerDepth+(runnerScrewHeadHeight), length, runnerHeight + (wallThickness*2)], true);
        translate([runnerScrewHeadHeight, 0, 0])
            cube([runnerDepth, length, runnerHeight], true);
        translate([-(runnerDepth+(runnerScrewHeadHeight))/2,length/2-runnerScrewFront,0]) {
            runnerScrewHole();
        }
        translate([-(runnerDepth+(runnerScrewHeadHeight))/2,-(length/2-runnerScrewBack),0]) {
            runnerScrewHole();
        }
    }
    %translate([0,11.5,0]) {
        screwSpacing=204;
        cube([1,screwSpacing,1], true);
    }

}

module screwSpacerTemplate() {
//    screwSpacing=203.2;
    screwSpacing=204;
    translate([-screwSpacing/2, 0, 0]) {
        cylinder(h=5, d=3, $fn=360);
    }
    translate([screwSpacing/2, 0, 0]) {
        cylinder(h=5, d=3, $fn=360);
    }
    cube([screwSpacing+4,2, 2], true);
    cube([4,4, 2], true);
    //cube([screwSpacing,2, 4], true);
}

//drawerRailPocket();

sideBracket();

//screwSpacerTemplate();