// bearings
BB625_2RS =  ["625",  5,  16, 5, "orange", 1, 1];
BB625_ZZ =  ["625",  5,  16, 5, "silver", 1, 1];

//                                              name,            outer_dia,   outer_dia2, inner_dia,  thick, thick_edge, color
WHEEL_DERLIN        = ["v_wheel(derlin): Derlin V Wheel",             24.2,         20.2,        16,  10.25,        6.2, "#303030"];
WHEEL_PC            = ["v_wheel(pc): Polycarbonate V Wheel",          24.2,         20.2,        16,  10.25,        6.2, "white"];
WHEEL_STEEL_V       = ["v_wheel(steel): Steel V Wheel",               24.35,        20.2,        16,  10.25,        5.4, "silver"];
// TODO MINI WHEEL
WHEEL_DERLIN_MINI   = ["v_wheel(derlin_mini): Derlin V Wheel Mini",   15.23,         12.21,    8.63,  10.25,        6.2, "#303030"];


// wheels        name           model,  bearings,   type
//MINI_DERLIN = [   "",         "mini", BB625_2RS, "black"]
//MINI_DERLIN = [   "", "mini", BB625_2RS, "black"]
//MINI_DERLIN = [   "", "mini", BB625_2RS, "black"]
S_DERLIN_2RS_MINI = [    "", "standard", BB625_2RS, WHEEL_DERLIN_MINI];
S_DERLIN_2RS = [    "", "standard", BB625_2RS, WHEEL_DERLIN];
S_XTREME_2RS = [    "", "standard", BB625_2RS, WHEEL_PC];
S_STEEL_2RS = ["", "standard", BB625_2RS, WHEEL_STEEL_V];
S_STEEL_ZZ = [ "", "standard", BB625_ZZ, WHEEL_STEEL_V];

D_DERLIN_2RS = [    "", "double",   BB625_2RS, WHEEL_DERLIN];
D_XTREME_2RS = [    "", "double",   BB625_2RS, WHEEL_PC];
D_STEEL_2RS = ["", "double",   BB625_2RS, WHEEL_STEEL_V];
D_STEEL_ZZ = [ "", "double",   BB625_ZZ, WHEEL_STEEL_V];


use <vslot_wheel.scad>

//vslot_wheel_assembly(D_XTREME_2RS);
