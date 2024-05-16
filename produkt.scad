// all values are in mm
width=24;
length=35;
height=30;

filletRadius=9;
wallWidth=5;

$fn=128; // number of fragments in an arc

module baseShape(w,h,l,r) {
    hull() {
        for ( i = [0 : 1] ) {
            rotate([0,0,i*180]) translate([+w/2-r,+l/2-r,0]) cylinder(h,r,r,true);
            rotate([0,0,i*180]) translate([-w/2+r,+l/2-r,0]) cylinder(h,r,r,true);
        }
    }
}

module topFillet(r) {
    scale([1,length/width,1]) sphere(r);
}

module waterDrain(r) {
    cylinder(height+wallWidth*4,r,r,true);
}

translate([0,0,(height+2*wallWidth)/2])
difference() {
    baseShape(width+2*wallWidth,height+2*wallWidth,length+2*wallWidth,filletRadius-5);
    translate([0,0,1*wallWidth]) baseShape(width,height,length,filletRadius);
    translate([0,0,(2*(width+wallWidth)+height/2)]) topFillet(2*(width+wallWidth));
    waterDrain(wallWidth/2);
}
