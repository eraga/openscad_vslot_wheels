include <vslot_wheels.scad>
include <NopSCADlib/utils/core/core.scad>
include <NopSCADlib/vitamins/nuts.scad>
include <NopSCADlib/vitamins/screws.scad>
use <utils.scad>

function vslot_wheel_assembly_screw_overhang(type)  = type[6] == undef ? 0 : type[6];


module spacer(h = 6) {
    hstr = str_replace(str(h), ".", "_");
    vitamin(str(
    "spacer(", str(h), "): OpenBuilds Spacer (h=", h, "mm)"
    ));
    color("silver")
        render()
            translate([0,0,h])
                rotate([0,180,0])
                    difference() {
                        cylinder(h, d = 10);
                        translate([0,0,-0.1])
                            cylinder(h+0.2, d = 5);
                    }
}


module eccentric_spacer(h = 6) {
    vitamin(str(
    "eccentric_spacer(", h ,"): OpenBuilds Eccentric Spacer (h=", h, "mm)"
    ));

    difference() {
        union() {
            color("red")
                cylinder(h, d = 10, $fn=6);
            cylinder(h+2.5, d = 7.12);
        }
        translate([0,1,-0.1])
            cylinder(h+3, d = 5);
    }
}

module vslot_wheel_excentric_spacer_assembly(type) {
    assembly("vslot_wheel_excentric_spacer") {
        h = type[1];
        eccentric_spacer(h);
        vslot_wheel_all_but_spacer(type);
    }
}

module vslot_wheel_spacer_assembly(type) {
    assembly("vslot_wheel_spacer") {
        h = type[1];
        spacer(h);
        vslot_wheel_all_but_spacer(type);
    }
}

module vslot_wheel_all_but_spacer(type) {
    h = type[1];
    eccentric = type[2];
    wheelType = type[3];
    screwType = type[4];
    double = type[5];

    if(wheelType != undef) {
        shift = eccentric ? [0.25, 1, h + vslot_wheel_thick(wheelType[3]) / 2] : [0, 0, h + vslot_wheel_thick(wheelType[3]) / 2];

        screw_base_length = h + vslot_wheel_thick(wheelType[3]) + vslot_wheel_assembly_screw_overhang(type) + 6;
        screwLength = double ? screw_base_length + h + vslot_wheel_thick(wheelType[3]) : screw_base_length;


        translate(shift) {
            vslot_wheel(wheelType);
            rotate([0, 180, 0])
                translate([0, 0, h+vslot_wheel_thick(wheelType[3])/2+vslot_wheel_assembly_screw_overhang(type)])
                    screw(screwType, screwLength);

            translate([0, 0, vslot_wheel_thick(wheelType[3])/2])
                spring_washer(screw_washer(screwType));
            translate([0, 0, vslot_wheel_thick(wheelType[3])/2+1])
                nut(screw_nut(screwType));
        }

        if (double) {
            if (eccentric) {
                translate([0, 0, 21.8]) rotate([0, 180, 0]) eccentric_spacer(h);
            } else {
                translate([0, 0, 21.8]) rotate([0, 180, 0]) spacer(h);
            }
        }
    }
}

module vslot_wheel_assembly(type) {
    eccentric = type[2];

    if(eccentric) {
        vslot_wheel_excentric_spacer_assembly(type);
    } else {
        vslot_wheel_spacer_assembly(type);
    }
}
