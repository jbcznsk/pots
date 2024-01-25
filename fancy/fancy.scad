
sides=16;
angle=(360/sides)/2;
diam=57;
heig=3;
dist=20;

difference(){
    union(){
        for(i = [0:6]){
            translate([0,0,heig*(i*3)])
            hull(){
                cylinder(h=heig,d=diam,$fn=sides);
                
                translate([0,0,heig])
                rotate([0,0,angle])
                cylinder(h=heig,d=diam,$fn=sides);
                
                translate([0,0,heig*2])
                rotate([0,0,0])
                cylinder(h=heig,d=diam,$fn=sides);
            }

        }
    }
    
//    translate([0,0,2])
//    cylinder(h=heig*7*3-1.9, d=55, $fn=360);
    
//    for (i = [0:7]){
//        translate([sin((360/8)*i)*dist, cos((360/8)*i)*dist, -1])
//        cylinder(h=4, d=3, $fn=360);
//    }
//    
//    translate([0, 0, -1])
//    cylinder(h=4, d=10, $fn=360);
    
    
}


//translate([0,0,heig*3])
//hull(){
//    cylinder(h=heig,d=diam,$fn=sides);
//    
//    translate([0,0,heig])
//    rotate([0,0,angle])
//    cylinder(h=heig,d=diam,$fn=sides);
//    
//    translate([0,0,heig*2])
//    rotate([0,0,0])
//    cylinder(h=heig,d=diam,$fn=sides);
//}