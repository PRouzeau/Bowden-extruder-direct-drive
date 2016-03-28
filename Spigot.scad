include <PRZutility.scad>
// license : OHL V1.2 - sept 2015
$fn=50;
holeplay=0.2;
diamNut3 = 6.1; // check ??
diamNut4 = 8.1; // check ??

splength = 95;

//projection(cut = true)
   tsl (0,0,0) rot (0,-90) spigot(splength);

module spigot (lg=95) {
  difference () { 
    union() { 
      difference () {
        union() {
          cylz (18, lg);
          cylz (23, 2);
          tsl (0,0,1.99)
            cylinder (d1=23, d2=18, h=1);
          
          tsl (0,0,16)
            cylinder (d1=18, d2=19, h=1);
          cylz (19, 1,  0,0,16.99);
          
          tsl (0,0,35)
            cylinder (d1=18, d2=19, h=1);
          cylz (19, 1,  0,0,35.99);
          
          if (lg > 90){
            tsl (0,0,58)
              cylinder (d1=18, d2=19, h=1);
            cylz (19, 1,  0,0,58.99);
          }
          
          tsl (0,0,lg-14.5)
            cylinder (d1=18, d2=18.5, h=1);
          cylz (18.5, 3,  0,0,lg-13.51);
          
          cylz (22, 2,  0,0,lg-2);
          tsl (0,0,lg-4.99)
            cylinder (d1=18, d2=22, h=3);
        }
        spigot_int(lg);
        rot (0,2)
          cubez (40,30,5,  0,0,lg-1);
        cubez (10,40,120,  -12.5,0,-1);
      }
      cubez (-2,11.8,lg-1,  -8.5,0,0);
      hull() {
        cubez (1,10.8,lg-1.5,  6.6,0,0);
        cubez (1,6.4,lg-1.5,  8,0,0);
      } 
    }
    rotate_extrude() tsl(9.5, lg-12) // groove for O-Ring
      circle(r = 0.65, $fn = 100);
  } 
}

module spigot_int(lg) {
  cylz (-4.3,12, 2,0,lg);
  hull() {
    cylz (15, lg-10+0.05, 0,0,-1);
    tsl (2)
      rotz(30) cylz (diamNut4,3,  0,0,lg-10, 6); 
  }  
  tsl (2)
    rotz(30) cylz (diamNut4,3.4, 0,0,lg-7.5, 6); 
}