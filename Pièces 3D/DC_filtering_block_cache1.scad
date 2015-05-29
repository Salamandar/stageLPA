boitier_int_largeur=30.9;
boitier_int_longueur=62; //?
boitier_int_hauteur=24;
boitier_int_angle_radius=4; //?

module boitier_int() {
    $fn=100;
    difference() {
        cube([boitier_int_largeur,boitier_int_longueur,boitier_int_hauteur]);
        translate([0,0])
            cube([boitier_int_angle_radius,boitier_int_angle_radius,boitier_int_hauteur]);
        translate([boitier_int_largeur-boitier_int_angle_radius,0])
            cube([boitier_int_angle_radius,boitier_int_angle_radius,boitier_int_hauteur]);
        translate([0,boitier_int_longueur-boitier_int_angle_radius])
            cube([boitier_int_angle_radius,boitier_int_angle_radius,boitier_int_hauteur]);
        translate([boitier_int_largeur-boitier_int_angle_radius,
            boitier_int_longueur-boitier_int_angle_radius])
            cube([boitier_int_angle_radius,boitier_int_angle_radius,boitier_int_hauteur]);
    }
    translate([boitier_int_angle_radius,boitier_int_angle_radius])
        cylinder(r=boitier_int_angle_radius,h=boitier_int_hauteur);
    translate([boitier_int_largeur-boitier_int_angle_radius,boitier_int_angle_radius])
        cylinder(r=boitier_int_angle_radius,h=boitier_int_hauteur);
    translate([boitier_int_angle_radius,boitier_int_longueur-boitier_int_angle_radius])
        cylinder(r=boitier_int_angle_radius,h=boitier_int_hauteur);
    translate([boitier_int_largeur-boitier_int_angle_radius,
        boitier_int_longueur-boitier_int_angle_radius])
        cylinder(r=boitier_int_angle_radius,h=boitier_int_hauteur);
}
module prises() {
    // Prises d'entrée
    translate([boitier_int_largeur/8,boitier_int_longueur-5,7])
        cube([3*boitier_int_largeur/4,5,13]);
    // Prises
    translate([boitier_int_largeur/8,0])
        cube([3*boitier_int_largeur/4,13,5]);
}


module cache1() {
    // Cache pour la prise d'entrée
    longueur_supports1  =10;
    hauteur_supports1   = 3;
    position_plaque1    = boitier_int_longueur-(boitier_int_angle_radius+longueur_supports1);
    epaisseur_plaque1   = 2;
    translate([0, position_plaque1])
        cube([boitier_int_largeur, epaisseur_plaque1, boitier_int_hauteur]);
    //translate([0 ,position_plaque1+epaisseur_plaque1])
    //    cube([1,longueur_supports1, hauteur_supports1]);
    //translate([boitier_int_largeur-1, position_plaque1+epaisseur_plaque1])
    //    cube([1,longueur_supports1, hauteur_supports1]);
    
    translate([boitier_int_largeur/2-5 ,position_plaque1+epaisseur_plaque1])
        cube([10,boitier_int_angle_radius+longueur_supports1-epaisseur_plaque1, 1.2]);
    translate([boitier_int_largeur/2-5 ,position_plaque1+epaisseur_plaque1, boitier_int_hauteur-1.2])
        cube([10,boitier_int_angle_radius+longueur_supports1-epaisseur_plaque1, 1.2]);
}

module cache2() {
    $fn=80;
    intersection() {
//        translate([0,-5,-1])rotate([0,90])difference() {
//            cylinder(d=40, h=boitier_int_largeur);
//            translate([0,0,1.2])cylinder(d=38, h=boitier_int_largeur-2*1.2);
//        }
        longueur2 = 17;
        hauteur2 = 15;
        difference() {
            cube([boitier_int_largeur, longueur2, hauteur2]);
            translate([1.2,0])
                cube([boitier_int_largeur-2*1.2, longueur2-1.2, hauteur2-1.2]);
        }
        boitier_int();
    }
    
}
module trous_fils() {
    $fn=100;
    espacement_fils = 1.5;
    for (i = [0 : 10]) {
        translate([-espacement_fils/2,(i-10/2)*espacement_fils])cylinder(d=0.5,h=10);
    }
    for (i = [0 : 11]) {
        translate([espacement_fils/2,(i-11/2)*espacement_fils])cylinder(d=0.5,h=10);
    }
}


%boitier_int();
//#prises();

difference() {
    cache1();
    translate([boitier_int_largeur/2,45,15])
        rotate([0,0,90]) rotate([0,90]) trous_fils();
}

difference() {
    cache2();
    translate([boitier_int_largeur/2,10, 10])
        rotate([0,0,90]) trous_fils();
}
