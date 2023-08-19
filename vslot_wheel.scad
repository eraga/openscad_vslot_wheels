include <NopSCADlib/utils/core/core.scad>
include <NopSCADlib/vitamins/ball_bearings.scad>


function vslot_wheel_dia(type) = type[1];
function vslot_wheel_rad(type) = type[1] / 2;
function vslot_wheel_dia2(type) = type[2];
function vslot_wheel_dia_inner(type) = type[3];
function vslot_wheel_thick(type) = type[4];
function vslot_wheel_thick_edge(type) = type[5];
function vslot_wheel_color(type) = type[6];


$fn = 60;
//
//module mini_vslot_wheel_tire(type) {
//    vitamin(type[0]);
//    color(vslot_wheel_color(type))
//    difference() {
//        hull() {
//            cylinder(d=12.21,h=8.8,center=true);
//            cylinder(d=15.23,h=5.78,center=true);
//        }
//        cylinder(d=8.63,h=9,center=true);
//        for(i=[0.5,-5.5]) translate([0,0,i]) cylinder(d=10,h=5);
//    }
//}

module vslot_wheel_tire(type) {
    vitamin(type[0]);

    color(vslot_wheel_color(type))
        render()
            difference() {
                fn = 180;
                hull() {
                    cylinder(d = vslot_wheel_dia2(type), h = vslot_wheel_thick(type), center = true);
                    cylinder(d = vslot_wheel_dia(type), h = 5.9, center = true);
                }
                cylinder(d = vslot_wheel_dia_inner(type) - 2, h = 11, center = true);
                for (i = [0.5, - 5.5]) translate([0, 0, i]) cylinder(d = vslot_wheel_dia_inner(type), h = 5);
            }
}

module double_vslot_wheel_tire(type) {
    vitamin(type[0]);
    color(vslot_wheel_color(type))
        render()
            difference() {
                union() {
                    for (i = [- 1, 1]) translate([0, 0, i * vslot_wheel_thick(type) / 4]) hull() {
                        cylinder(d = vslot_wheel_dia2(type), h = vslot_wheel_thick(type) / 2, center = true);
                        cylinder(d = vslot_wheel_dia(type), h = 0.2, center = true);
                    }
                    cylinder(d = 18.75, h = 4.84, center = true);
                }
                cylinder(d = vslot_wheel_dia_inner(type) - 2, h = 11, center = true);
                for (i = [0.5, - 5.5]) translate([0, 0, i]) cylinder(d = vslot_wheel_dia_inner(type), h = 5);
            }
}



module vslot_wheel(model) {

    name = model[0];
    shape = model[1];
    bearing = model[2];
    type = model[3];

    if (shape == "double") {double_vslot_wheel_tire(type);}
    else {vslot_wheel_tire(type);}

    if (bearing) {
        translate([0, 0, - bearing[3] / 2 - 0.5])
            ball_bearing(bearing);
        translate([0, 0, bearing[3] / 2 + 0.5])
            ball_bearing(bearing);
    }
}
