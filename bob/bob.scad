pot_height=66;
pot_width=71;
d_q=10;
d_d=pot_width/d_q;
sides=4;

a_q=10;
a_d=pot_height/a_q;

//translate([0,0,pot_height/2])
//cube([pot_width,pot_width,pot_height], center=true);

union(){
    for (i = [0:d_q]) {
        translate([pot_width/2,pot_width/2 - i*d_d,0])
        cylinder(h=pot_height, d=d_d, $fn=sides);
    }

    for (i = [0:d_q]) {
        translate([pot_width/2 - i*d_d,pot_width/2,0])
        cylinder(h=pot_height, d=d_d, $fn=sides);
    }

    for (i = [0:d_q]) {
        translate([pot_width/2 - i*d_d,-pot_width/2,0])
        cylinder(h=pot_height, d=d_d, $fn=sides);
    }

    for (i = [0:d_q]) {
        translate([-pot_width/2,pot_width/2 - i*d_d,0])
        cylinder(h=pot_height, d=d_d, $fn=sides);
    }
}

for (i = [0:a_q-2]){
    
    translate([-1.5,0,0])
    translate([0,0,pot_height - i*a_d-a_d])
    translate([pot_width/2,0,0])
    
    rotate([0,45,0])
    cube([d_d, pot_width, d_d], center=true);   
}

for (i = [0:a_q-2]){
    
    translate([0,-1.5,0])
    translate([0,0,pot_height - i*a_d-a_d])
    translate([0,pot_width/2,0])
    
    rotate([45,0,0])
    cube([pot_width, d_d, d_d], center=true);   
}

for (i = [0:a_q-2]){
    
    translate([-1.5,0,0])
    translate([0,0,pot_height - i*a_d-a_d])
    translate([pot_width/2,0,0])
    
    rotate([0,45,0])
    cube([d_d, pot_width, d_d], center=true);   
}

