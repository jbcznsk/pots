res = 500;
x   = 0.1;

h1  = 90;
d1  = 100;
h2  = 70;
d2  = 100;

wall_size  = 0.8;
wall_count = 20;
wall       = wall_size * wall_count;

bottom_size  = 0.8;
bottom_count = 1;
bottom       = bottom_size * bottom_count;

diff_x = d2 - wall/2 + 3;
diff_y = 0;
diff_z = 0;

center_hole_size = 20;
hole_size        =  5;
nr_of_holes      =  6;

base_h = 30;

hol = false;
////////////////////////////////////

translate([0,0, base_h+     10]){  
    cup(h1, d1, wall, bottom, center_hole_size, hole_size, nr_of_holes);

    translate([diff_x, diff_y, diff_z])
    cup(h2, d2, wall, bottom, center_hole_size, hole_size, nr_of_holes);
}
base();

//difference(){
//
//    translate([diff_x, diff_y, diff_z])
//    cup(h2, d2, wall, bottom, center_hole_size, hole_size, nr_of_holes);
//    
//        translate([0, 0, -x])
//
//            cup(h1, d1, wall, bottom, center_hole_size, hole_size, nr_of_holes);
//
//    }

////////////////////////////////////

module cup(hh, dd, ww, bb, chs, hs, nh){
    difference(){
        cylinder(h=hh, d=dd, $fn=res);
        translate([0,0,bb])
        cylinder(h=hh-bb+x,d=dd-ww, $fn=res);
        
       if (hol)
        holes(chs, hs, nh, dd);
    }
}

module holes(chs, hs, nh, dd){
    translate([0,0,-x])
    cylinder(h=bottom+x*2, d=chs, $fn=res);
    
    dist = chs/2 + ((dd/2-chs/2)/2);
    angl = 360 / nr_of_holes;
    
    for(i = [0:nh-1]){
        translate([sin(angl*i)*dist,cos(angl*i)*dist,-x])
        cylinder(h=bottom+x*2, d=hs, $fn=res);
    }
    
}

module base(){
    
    off=4;
    
    // Base
    difference(){
        hull(){
            translate([-off, 0, 0])
            cylinder(h = base_h, d = (d1>d2?d1:d2)+wall+off, $fn = res);
            translate([diff_x+off, diff_y, diff_z])
            cylinder(h = base_h, d = (d1>d2?d1:d2)+wall+off, $fn = res);
        }
        hull(){
            translate([-off, 0, bottom])
            cylinder(h = base_h, d = (d1>d2?d1:d2)+wall, $fn = res);
            translate([diff_x+off, diff_y, diff_z+bottom])
            cylinder(h = base_h, d = (d1>d2?d1:d2)+wall, $fn = res);
        }
    }
    
    // Suportes
    holes=6;
    a=360/holes;
    difference(){
        cylinder(h=base_h-10, d=d1, $fn = res);
        translate([0,0,-x])
        cylinder(h=base_h-10+x*2, d=d1-wall, $fn = res);
        for (i = [0:holes-1]){
            translate([sin(i*a)*(d1-wall/2)/2,cos(i*a)*(d1-wall/2)/2,0])
            sphere(d = wall, $fn=20);
        }
        
    }
    
    translate([diff_x, diff_y, diff_z])
    difference(){
        cylinder(h=base_h-10, d=d1, $fn = res);
        translate([0,0,-x])
        cylinder(h=base_h-10+x*2, d=d1-wall, $fn = res);
        for (i = [0:holes-1]){
            translate([sin(i*a)*(d1-wall/2)/2,cos(i*a)*(d1-wall/2)/2,0])
            sphere(d = wall, $fn=20);
        }
        
    }
    
    // Postezinhos
    pole();
    translate([diff_x, diff_y, diff_z])
    pole();
}

module pole(){
    pole_h=base_h-5;
    pole_w=center_hole_size-3;
    
    union(){
        cylinder(h=pole_h, d=pole_w, $fn=res);
        hull(){
            translate([0,0,base_h-10])
            cylinder(h=1, d=pole_w, $fn=res);
            cylinder(h=1, d=pole_w+20, $fn=res);
        }
    }
}