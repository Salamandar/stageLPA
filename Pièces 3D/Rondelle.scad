$fn=50;

longueur = 10;

diametre_int = 20;
diametre_ext = 33;
ecartement_vis = 16;

epaisseur_double_plaque = 6;

vis_diam_tete = 6;
vis_diam_corps= 3;
module main() {
    difference() {
        union() {
            cylinder(d=diametre_ext, h=longueur, center=true);
            cube([epaisseur_double_plaque,38,longueur], center=true);
        }
        cube([1,50,longueur+0.1], center=true);
        cylinder(d=diametre_int, h=longueur+0.1, center=true);
        translate([0, ecartement_vis,0])vis();
        translate([0,-ecartement_vis,0])vis();
    }
}

module vis() {
    rotate([0,90,0])cylinder(d=vis_diam_corps, center=true, h=30);
    difference() {
        rotate([0,90,0])cylinder(d=vis_diam_tete,     center=true, h=30);
        rotate([0,90,0])cylinder(d=vis_diam_tete+0.1, center=true, h=epaisseur_double_plaque);
    }
}

intersection() {
    main();
    translate([100,0,0])cube([200,200,200], center=true);
}