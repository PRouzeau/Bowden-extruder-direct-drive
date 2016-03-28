/* Bowden extruder, direct drive, simple or double, 3 types mount:
* Side of a panel, with bowden biased entry in panel
* Face of a panel
* On rod
An optional filament guide allow installation of a sponge and filament detector.
Level articulate directly in supports without any metallic part
Its design is not really original, but it minimize the fittings required.
This extruder is part of the Lily boxed delta printer design and was initially designed for the D-Box printer.
It could be used for any printer and so is released independantly
(c) Pierre ROUZEAU Jan-march 2016
files in : https://github.com/PRouzeau/DBox-Delta-Printer
* Part licence : CERN OHL V1.2
* Program license GPL2 & 3
* Documentation licence : CC BY-SA

It is for filament 1.75mm and guide filament as close as possible to the hobbed insert, allowing easy change of filament while printing.
This may help somewhat with flexible filament, taking into account the difficulties associated with bowden tube.

This extruder was designed to be installed on a panel.
The philosophy is to have the minimum parts and articulation is directly printed
After testing miscellaneous pushfit ends for the bowden tube, a simple M4 nut was chosen as the simplest and most effective way to lock the tube. There is no quick bowden disassembly however this is more needed on the hotend than on the extruder.

As with all direct drive extruders, you shall use a stepper with large torque, say 4.8~5 kg.cm. Low diameter MK8 hobbed insert allow reasonnable force for a direct extruder
The tensioner shall not be overtightened.  

The optional guide plate allow to install a cleaning sponge, and there are planes to screw filament presence switches. 

To modify display, modify 'qpart' number:

viewing different mounting types, not mirrored: 
Double extruder, reclined guide : 1
Simple extruder, reclined guide : 50 
Simple extruder, vertical guide : 52
simple extruder, face on panel  : 53
simple extruder, mounted on rod : 54

even reference: non-mirrored (left panel) odd reference: mirrored (right panel)
parts to print:
- 1 extruder base  double: 2,3, simple:8,9, face panel:16.17, on rod:18,19    
- 1 antivibration support double: 4,5 simple: 10,11 
- 1 filament guide double,reclined:6,7 simple,reclined:12,13, simple,vertical:14,15
- Alternatively to filament guide, if no need for filament detection, you  can print a sponge box : 20

By default, the bowden shall be screwed in a M4 nut. If you want to install a pushfit, you have to tap the lever. Prefer M5 thread as it is easier to tap than imperial thread, and on PETG, you could use an ordinary screw for tapping.  

for each extruder:
- 1 lever: M4 nut 22,23  Pushfit (drilled 3.8 mm): 24,25
- 1 tensioner: 30
- 1 thumbwheel: 32 (option)
- 1 spigot for each spool: see spigot.scad

Note that the thumbwheel tend to slip if there is no flat on stepper shaft. Also, the thumbwheel prevent easy disassembly of the lever.

Components :
- 4 Screw/bolts diam 4 for panel attach
- 2 countersunk head bolt M3x15 with washer M to attach filament guide to extruder base
- 2 countersunk head bolt M3x10 to attach extruder base to antivibration support

for each extruder :
- 1 hobbed insert MK8, stainless steel, SPECIFIC for 1.75 mm filament - don't use 'bi-compatible 3mm-1.75 mm'
- 1 bearing 695ZZ (13x5x4)
- 4 screws M3x8, countersunk head, for motor attach
- 1 bolt M4x30, hex head, with butterfly nut and washer M; for tensioner
- 1 bolt M4x20, countersunk head, with washer M; for bearing
- 1 nut M4 for bowden locking
- 1 spring dia 8 x wire 1mm
- bowden tube.

**********  RECOMMENDATIONS FOR PRINTING ***********************************
* Use a calibrated machine to have accurate dimensions
* Use material resistant to temperature, ABS or PETG
* Fill in: Honeycomb, 75% , layer 0.3mm  5 full layers on top and bottom, no support
  Note that printing in layer 0.3 gives stronger parts, so don't be tempted to print in thinner layer for precision, which will not be better, anyway.
  Note that fill in shall be 'full contact' between the layers, so, for some slicers, honeycomb may be replaced by 'triangle'. DON'T use rectilinear infill.
*/

qpart=53;

// if = 4 -> this is in a nut
diamNut4 = 8.1; // check ??
thkNut4  = 3.2;
holeplay = 0.15;

// filament angle and length for ensemble views
filpos = [[7,-4.5,45],[12,-8,48]];

//-- extruder  -------------------------------------------------  
  if (qpart==1) set_extru();
  // double extruder   
  else if (qpart==2) mirrory() mirrorz() extruder_base();
  else if (qpart==3) mirrorz() extruder_base();  
  else if (qpart==4) rot(-90) antivib(); 
  else if (qpart==5) mirrory() rot(-90) antivib();     
  else if (qpart==6) rot (0,-15+180) extruder_guide(); 
  else if (qpart==7) mirrory() rot (0,-15+180) extruder_guide();     
  // simple extruder  
  else if (qpart==8) {$simple_extru=true; mirrory() mirrorz() extruder_base();}  
  else if (qpart==9) {$simple_extru=true; mirrorz() extruder_base();}
  else if (qpart==10) {$simple_extru=true;  rot(-90) antivib();}  
  else if (qpart==11) {$simple_extru=true; mirrory() rot(-90) antivib();}
  else if (qpart==12) {$simple_extru=true; rot(0,-15+180) extruder_guide();}  
  else if (qpart==13) {$simple_extru=true; mirrory()rot(0,-15+180) extruder_guide();}
  else if (qpart==14) { //simple extruder, guide for vertical filament inlet
    $simple_extru=true; rot (0,180) extruder_guide(0,5);   
  }
  else if (qpart==15) { //simple extruder, guide for vertical filament inlet
    $simple_extru=true; mirrory() rot (0,180) extruder_guide(0,5);   
  }
  else if (qpart==16) { //Base for Simple extruder installed face on a panel
    extruder_base2(dec=-4.5, diagear=9, angle=-10); 
  }
  else if (qpart==17) { //Base for Simple extruder installed face on a panel, mirrored
    mirrorz() extruder_base2(dec=-4.5, diagear=9, angle=-10); 
  }
  else if (qpart==18) { //Base for Simple extruder installed on a rod
    $simple_extru=true;    
    $rodExtruder=true;
    extruder_base2(dec=-4.5, diagear=9, angle=-10); 
  }
  else if (qpart==19) { //Base for Simple extruder installed on a rod, mirrored
    $simple_extru=true;    
    $rodExtruder=true;
    mirrorz() extruder_base2(dec=-4.5, diagear=9, angle=-10); 
  }
  else if (qpart==20) spongebox(); 
  else if (qpart==22) rot(-90, 2.8) ex_lever(); 
  else if (qpart==23) mirrory() rot(-90, 2.8) ex_lever();   
  else if (qpart==24) {rot(-90, 2.8) ex_lever(diamPushfit=3.8);}
  else if (qpart==25) {mirrory() rot(-90, 2.8) ex_lever(diamPushfit=3.8);}     
  else if (qpart==30) rot (0,8) rot(-90) ex_tens();  
  else if (qpart==32) {extThumbw();  tsl (20) cubez (10,8, 12);} 

  //== Ensemble views of extruder configurations, not mirrored =============
  else if (qpart==50) { // Simple extruder ensemble installed side on panel, reclined filament inlet guide
    $simple_extru=true;
    set_extru();
  }
  else if (qpart==51) { // Simple extruder ensemble installed side on panel, vertical filament inlet guide 
    $simple_extru=true;
    filpos = [[-10,-13,40],[10,-5,35]];
    set_extru(false,24,0,5, filpos);
  }
  else if (qpart==52) { // Simple extruder ensemble installed face on a panel
    $simple_extru=true;
    set_extru(true, -10, 15,8, filpos);
    filpos = [[0,0,40],[0,-5,35]];
  }
  else if (qpart==53) { // Simple extruder ensemble installed on a rod
    $simple_extru=true;
    $rodExtruder=true;
    rot(-12) set_extru(true, -10);
    gray() cylz (-5,200, 5,-17); // rod
  }  
  
//extruder data
extru_space = -46; // translation between extruders
biextguide_tsl = [-30,9,0]; 
  
include <PRZutility.scad>
  
module extruder_base (dec=-4.5, diagear=9, angle=24, tens_angle=-87, tens_h=22) {
plthk = 2; // plate thickness
wdist = 11.5;  //axis distance from base
BBpos = -6.5-diagear/2-0.5; 
artpos  = -14;  
incline = 15; // cut face of guide pads
padthk  = 4;  // pad thickness
fixht   = 6+plthk;
guidext = 27; 
  exsp = $simple_extru ?0: extru_space; // translation between both extruders
  mirrorz()
  difference() {
    union() {  
      cubez (39-exsp,58,plthk,       exsp/2+1,3);
      cubez (41-exsp,2,plthk+10.5,   exsp/2,-25-0.95);
      cylz (10,3.6,  -15.5,15.5); // motor pad
      duplx (exsp){
        rotz(angle) {
          tsl (artpos,BBpos)  // lever 'articulation' slot
            hull() {
              cylz (8.5,wdist+6.5,  0,0); 
              cylz (12,6,           0,-8); 
            }  
          tsl (tens_h)
            rotz (tens_angle) 
              hull() {
                cubez (11,13,6,  -20); // tensioner support
                cubez (5, 13,1,  -17,0,16.5); // tensioner support
              }  
        }
        // motor pads
        hull() { //motor bottom pad
          cylz (10,padthk,  15.5,22);
          cylz (10,padthk,  15.5,-26);
        }
        hull() { // right pad
          cylz (10,padthk,  15.5,15.5);
          cylz (10,padthk,  12,23);
        }
        hull() { // top left pad
          cylz (10,padthk,  -15.5,-28);
          cylz (10,padthk,  -15.5,-15.5);
        }
        hull() { // top left pad
          cylz (10,padthk,  -10,-15.5);
          cylz (10,padthk,  -15.5,-15.5);
        }
        for (hx = [15.5,-15.5]) {
          hull()  {
            cyly (10,4,    hx,-27,fixht, 40);    // fixation on panel 
            cubey (10,4,2, hx, -27, 1);
          }
          tsl (hx-5,-23, padthk) 
            rot(45) cubex (10,3,3);
        }
      } // duplicate
      // pads for bottom extension attach
      hull() {
        cylz (11,padthk,31/2, 31/2);
        cylz (15,plthk,31/2, 31/2+1);
        cylz (12,padthk,  guidext, 24);
      }
      hull() {
        cylz (15,plthk,31/2, -31/2);
        cylz (11,padthk,31/2, -31/2);
        cylz (12,padthk,  guidext,-19); 
      } 
      cylz (12,7,  guidext, 24); // cut bias
      cylz (12,7,  guidext,-19); 
    } //::: then whats removed :::
    duplx (exsp) {
      dmirrorx() dmirrory() // motor fixation
        cylz (-3.1,66,  31/2,31/2,-1);
      cylz (-22.4,66, 0,0,0, 60); // motor center
      duplx (-31)  duply (-31)
        cconez (7,3, -1.6,-5, 31/2, 31/2,padthk); // right/left bottom sunk
      rotz (angle) { // lever related stuff
        tsl (artpos,BBpos, wdist)  // lever 'articulation' slot
          hull() {
            cylz (-6,11); 
            cylz (-3.5,12.5, 0,0,0.75); 
          }  
        tsl (tens_h, 0, wdist)  // tensioner bolt
          rotz(tens_angle) {
            hull() {
              rotz (2) cylx (-4.5,33, -18);   
              rotz (-2) cylx (-4.5,33, -18);   
            }  
            cylx (9.5,10,  -28.5); 
            cubez (51,20,50,  -51,0,-25); // cut end of tensioner nut support 
            rot (8,0,-5) // bowden passage
              cyly (-4.5,15,  -13.5,0,4);
          }  
        cubez (12,8,20,    -14,BBpos+3.5, wdist-5.5);  // cut articulation support face     
      } 
      duplx (-31) {
        cconey (7,3, -1.3,-6,  15.5, -23, fixht); // fixation on panel
        cyly (-3,33,           15.5, -25, fixht); 
      }   
    }
    rot(0, 1.5, angle) 
      cylx (4.5,-150, -10,dec,wdist); // Passage for the 4mm tube from other extruder
    // plate peripheral cut  
    cubez (150,12,plthk+20,  -25,-25-2.9-5,-1); // cut attach face
    // fixation holes 
    rotz (angle)
      tsl (tens_h, 0, wdist)  // tensioner bolt
        rotz(tens_angle)
          cubez (51,20,50,  -41.8,16.5,-25); // cut bottom right of plate
    
    rot (0,-incline)
      hull() {
        cubez (20,100,0.1, 31.4,0,-1.6);  
        cubez (20,100,1,   32.5,0,2);  
      }  
    tsl (exsp) hull() { //central cut of the top extruder
      cylz (-5,66, -50,-9); 
      cylz (-22.4,66);
      cylz (-5,66, -6,48);
    }
    hull() { //central cut of the bottom extruder
      cylz (-5,66, -33,43);   
      cylz (-5,66, -23,23); 
      cylz (-5,66,  0,23); 
      cylz (-5,66,  0,38.5);
    }
    cylz (-4,66,  guidext, 24);  // guide fixation holes
    cylz (-4,66,  guidext,-19); 
  }
}

module extruder_base2 (dec=-4.5, diagear=9, angle=-10, tens_angle=-87, tens_h=22) {
plthk = 0.8; // plate thickness
wdist = 11.5;  //axis distance from base
BBpos = -6.5-diagear/2-0.5; 
artpos  = -14;  
incline = 15; // cut face of guide pads
padthk  = 4;  // pad thickness
fixht   = 6+plthk;
guidext = 27; 
  exsp = $simple_extru ?0: extru_space; // translation between both extruders
  exsp=0; //yet is always simple
  mirrorz()
  difference() {
    union() {  
      duplx (exsp){
        hull()
          dmirrorx() dmirrory() // base plate
            cylz (6,plthk,  31/2,31/2);
        hull() { // motor fixation
          if (!$rodExtruder) 
            cylz (9,padthk,  31/2,31/2);
          cylz (9,padthk,  31/2,-31/2);
          rotz(angle) 
            tsl (tens_h)
              rotz (tens_angle) 
                cubez (11,13,padthk,  -14); // tensioner support base
        }
        cylz (9,padthk,  31/2,-31/2);
        if ($rodExtruder) {
          cylz (9,10,  -31/2,31/2); 
          rotz (-12)
            hull() {
              cylx (-10,50.5,  2.3,17,5); 
              cubez (50.5,8,1, 2.3,17); 
            } 
          rotz (-8)cubez (2.5,32,6, 14.5,2);  
        }  
        hull() { // motor fixation
          cylz (8,2.5,  -31/2,31/2); 
          rotz(angle) 
            tsl(artpos,BBpos) cylz (12,padthk+2,  0,-6); // 'articulation' support
        }
        dmirrory() 
          cubez (28,2,3, 0,17.5);
        rotz(angle) {
          tsl (artpos,BBpos)  // lever 'articulation' slot
            hull() {
              cylz (8.5,wdist+6.5,  0,0); 
              cylz (12,6,           0,-6); 
            }  
          tsl (tens_h)
            rotz (tens_angle) {
              hull() {
                cubez (10,13,6,  -17); // tensioner support
                cubez (5, 13,1,  -17,0,16.5); // tensioner support
              }
              hull() {
                cubez (10,13,3,  -14); // tensioner support
                cubez (5, 13,3,  -18,0,8); // tensioner support
              }  
            }  
        }
        if ($rodExtruder) {
          cylz (8,18,  -31/2,-31/2);
         * cylz (8,10,  31/2,-31/2);
        }  
        else  
          difference () {
            dmirrorx() dmirrory() // motor fixation pylons
              cylz (8,21,  31/2,31/2);
            cylz (10,25,  31/2,-31/2,-1); // remove one pylon
          }  
      } // duplicate
    } //::: then whats removed :::
    duplx (exsp) {
      if ($rodExtruder)
        rotz(-12)
          cylx (-5.2,66,  -1.5,17,5);  // rod attach
      cconez (7,3, -1.6,-5, 31/2, -31/2,padthk); // non pylon sunk 
      difference() {
        dmirrorx() dmirrory() // motor fixation
          cconez (3.5, 3.2, 22,1,  31/2,31/2,-0.5);
        if ($rodExtruder) // remove one hole
          cylz (12, 30, 31/2,31/2, -1);
      }   
      cylz (22.4,2.5, 0,0,-0.1, 60); // motor center
  
      rotz (angle) { // lever related stuff
        tsl (artpos,BBpos, wdist)  // lever 'articulation' slot
          hull() {
            cylz (-6,11); 
            cylz (-3.5,12.5, 0,0,0.75); 
          }  
        tsl (tens_h, 0, wdist)  // tensioner bolt
          rotz(tens_angle) {
            hull() {
              rotz (2) cylx (-4.5,33, -18);   
              rotz (-2) cylx (-4.5,33, -18);   
            }  
            cylx (9.5,10,  -28.5); 
        *    rot (8,0,-5) // bowden passage
              cyly (-4.5,15,  -13.5,0,4);
          }  
        cubez (12,8,20,    -14,BBpos+3.5, wdist-5.5);  // cut articulation support face     
      } 
    }
  }
}

module antivib () {
  dec=-4.5;
  wdist=11.5;
  angle=24;
  exsp = ($simple_extru)?0:extru_space;
  fixht = 8;
  padthk= 4; 
  face = -27;
  padsp = 24;
  padht=74;
  tsl (0,0,fixht)
    difference() {
      union() {
        cubez (50-exsp,2,12,  exsp/2,face-1,-7);
        duplx (exsp)
          for (hx = [15.5,-15.5]) 
            cyly (10,-3.5,     hx,face,0, 40);    // fixation on panel 
        tsl (exsp/2)  
          dmirrorx () {
            dmirrorz() {
              hull() {
                cyly (10,-1.5, -28+exsp/2,face,padsp);  
                cyly (15,-1.5, -19+exsp/2,face);  
              }  
              cyly (10,-5, -28+exsp/2,face,padsp);  
            }  
          }  
      }    
      tsl (exsp/2)  
        dmirrorx ()
          dmirrorz() {
            cyly (-4,66,         -28+exsp/2,face,padsp);  
            cconey (9,4,-1.3,-6, -28+exsp/2,face,padsp);
          }  
      duplx (exsp)
        duplx (-31) {
          cconey (7,3, 1.5,-6,  15.5, face-4); 
          cyly (-3,33,           15.5, -25); 
        }
      rot(0, 0.5, angle) 
         cylx (4.5,-150, -23,-4.5,-dec); // Passage for the 4mm tube from other extruder 
    }
}

module extruder_guide(incline=15, orient=8) {
  // if double extruder, minimum orient = 5 (hole clearance)
  txx = ($simple_extru)?[0,0,0]:biextguide_tsl; 
  pthk = 1;
  dcx =1;
  dcl = 1;
  htfix = (incline)?-3:2;
  fixx = (incline)?0:2.5;
  zdec = (incline)?0:4.5;
  tsl (dcl,0,-0.8+zdec) {
    difference() {
      rot (0,incline)
        difference() {
          union() {
            hull() {
              duply (-43)
                cylz (12,pthk,  27,24,dcx);  // extruder fixation holes 
              dupl (txx)
                tsl (50,14) rotz(orient) {
                  cylz (4, pthk,   16,9,dcx);
                  cylz (4, pthk,   51,9,dcx);
                  cylz (4, pthk,   51,-9,dcx);
                }  
            }
            rotz (32+orient/3)
              hull() {
                cubez (49,5,-4.3,  38.5,-30.5,dcx+0.1);
                cubez (41,5,-5,    43,-30.5,dcx+0.1);
              }  
            if ($simple_extru)   
              rotz (-1.8+orient/4.3)
                hull() {
                  cubez (37,5,-4.3,  48,23.6,dcx+0.1);
                  cubez (29,5,-5,    52.5,23.6,dcx+0.1);
                }
            else  
              tsl (27-dcl, 24)
                rotz(orient)  hull() {
                  cubez (10,11,-4.1,  5,0,dcx+0.1); 
                  cubez (1,20,-4.1,  11,-1+orient/10,dcx+0.1);
                }  
            dupl (txx)
              tsl (50,14,2)
                mirrorz()
                  rotz(orient) tsl(42) {
                    cubez (20,20,20);    
                   cubez (19,8,5+pthk,  -17,6);   // base for detection switch 
                    cubez (19,8,5+pthk,  -17,-6);   
                    hull() {
                      cubez (3,16,1,  -25,0);  // filament guide 
                      cylx (8,3,      -25-1.5,0,10);
                    }  
                  }  
          }  //::: then whats removed ::: 
          dupl (txx)
            tsl (50,14,0)
              mirrorz()
                rotz(orient) tsl (42){
                  cubez (17,17,25, 0,0,-1); 
                  rot (0,-3) {
                    cylx (2.2,-30, 0,0,10); // filament hole
                    cylx (8,20,    0,0,10);
                  }  
                }  
        } //::: next removal :::  (not inclined)
        duply (-43) {
          cconez (8,3, 1.5,-5,  27-dcl,24, -11); //extruder base fixation holes 
          cylz (-3,66, 27-dcl,24, -9.6); //extruder base fixation holes 
        }
        hull() { // cut for tensioner
          cylz (-15, 66, 11, 26);  
          cylz (-15, 66, 21, -3);  
          cylz (-15, 66, 13, -13); 
        }
    }
    difference() { // fixation on extruder
      duply (-43)
        cylz (12,-8+fixx,  27-dcl,24, htfix);  // extruder fixation holes 
      duply (-43) 
        cone3z (8,3, -10,-1.5,-7.5, 27-dcl,24, htfix+1);
      rot (0,incline)
        cubez (100,100,10, 0,0,2);
    }  
  }  
}

module spongebox() {
  difference() { union() {
      hull() 
        dmirrorx() dmirrory() 
          cylz (6, 20, 7, 7);
      hull()  {
        cylx (7,-20, 0,0,10); // bowden holder
        cubez (8,4,1,-10);
      }  
    }
    hull() 
      dmirrorx() dmirrory() {
        cylz (4, 1, 7, 7,1);
        cylz (3.5, 2, 7, 7,19);
      }
    cylx (2.2,-30, 0,0,10); // filament hole
    cylx (4, -12, -9.5,0,10); // filament hole
    cylx (8,20,  0,0,10); 
  }
}

module ex_lever (dec=-4.5, diagear=9, angle=24, tens_angle=-87, tens_h=22,diamPushfit=4) {
BBpos = -6.5-diagear/2-0.5-0.3; 
artpos =-14;  
dbwd = max (10.5, diamPushfit+5);  // diameter of pushfit cylinder
  //echo(diamPushfit =diamPushfit);
  mirrorz() {
    difference() {
      union() {
        cubez (50,5.2,7.5, 1.5,dec+4,-3.75); // cut biased (2.5°) later
        cylx (-8, 50,  1.5,dec);  // main cylinder
        scale ([1,1,1.15]) 
          cconex (dbwd-0.5,7, 6,9, -23.5,dec);  // bowden end space - sized for 9.5 maxi
        cconex (dbwd,dbwd-0.5, 9,0, -23.5,dec);  // bowden end space - sized for 9.5 maxi
      //  cylx (8, -8,  22.5,dec); 
        tsl (artpos,BBpos) { // lever 'articulation' 
          hull() {
            cylz (-6,11); 
            cylz (-3.5,12.5, 0,0,0.75); 
          }  
          hull() {
            cylz (-6,11); 
            cylz (-6,3, 0,9); 
          }
          hull() {
            cylz (-6,9.5, 1,4); 
            cylz (-6,9.5, 5,4); 
          }
          
        }  
        hull() { // bearing body
          cylz (-12.5,11,   0,BBpos); 
          cylz (-11,16,   0,BBpos); 
          cylz (-9,6,  -11,BBpos+9); 
          cylz (-9,6,  14,BBpos+10); 
        }  
      }  //::: then whats removed :::
      rotz(-2.8) cubez (60,4,20, 0,dec+3+4.1,-5); // cut below lever
      hull() {
        cylz (-diagear-1, 66, 0,-0.6);
        dmirrorx()   
          cylz (-1,66, 1.5,-diagear/2-0.5);
      }  
      dmirrorz()
        hull() {
          cylz (-13, 5, 0,0,-5.5, 50); // place for set screw and thumbwheel
          dmirrorx()   
            cylz (-1,5.8,  2.3,-diagear/2-1.5,-6);
        }  
      cylx (-2,55,    0,dec); // main hole
      cylx (diamPushfit,6.5,  -24,dec);  // bowden end space
      if  (diamPushfit==4) {
        cylx (4, 9, -24, dec); 
        tsl (-20.3,dec,0) 
        hull() 
          duply (-10)
            rot(30) cylx (diamNut4, 3.2, 0, 0,0, 6);  
      } 
      else 
        cconex (diamPushfit+0.25,diamPushfit-0.25, 6.5,0, -24,dec); //conical hole
      
      cylx (3.5,-5,  27,dec); // inlet tube opening
      cylz (-4,66,    0,BBpos);  // bearing axis
      cconez (7.8,4,1.7,-2, 0,BBpos,-8); // countersunk screw head hole
      hull() {   // opening for bearing
        cylz (-13.5,6.2, 0,BBpos); 
        cylz (-13.5,6.2, 0,BBpos-1); 
      }
      //echo (tens_h=tens_h);
      tsl (tens_h)
       rotz(tens_angle)  
         cylz (-6.2, 66, 10.5,0.2); // tensioner slot
    }
    difference() { //final addition of incorporated 'washers'
      dmirrorz() 
        cconez (8,6,0.6,-1, 0,BBpos,-3.1); 
      cylz (-4, 66, 0,BBpos);
    }  
  }
}

module ex_tens () { // for extruder 
  mirrorz()
    difference () {
      union() {
        cubez (6,10,9.2,  -1,0,-4.6);
        dmirrorz() 
          hull() {
            cubez (2.5,10,2.5,    0.75,0,-7);
            cubez (1,10,0.1, -3.5,0,-4.6);
            cylz  (6,2.5,    15.5,0,-7);
          }  
        cylz (-6,12,  15.5);
      } //then whats removed
      cylx (-4,22);
      cylx (diamNut4, 3.5 , -1.2,0,0, 6);
      rotz (-8) // cut base for printability
        cubez (50,10,30,  0,9.5,-15);
    }  
}

module extThumbw () {
  tsl (0,0,13.5)  mirrorz() 
    difference() {
      union() {
        cylz (11.5,13.5);
        cconez (11.5,5, -5,-4.7, 0,2.3,5+3.8);
        for(i=[0:3]) rotz(i*90)  
          hull() { // index
            cylz (1,2.5,    0,12,11);
            dmirrorx() 
              cylz (1,6, 3.5,3.5,7.5);
          }     
        cylz (25,-0.5, 0,0,13.5);// base for adhesion   
      } // then whats removed
      cylz (-5.1,66);
      rot (-4) cconez (1.8,3,5,8.1, 0,4,1);
      difference() {
         cylz (9.2,12, 0,0,2);     
         cylz (7.9,12, 0,0,2); 
         rotz (45) cubez (50,50,50, 0,-25,0);    
         rotz (-45) cubez (50,50,50, 0,-25,0);    
      }
    } 
    cubez (4,1,13,0,2.7);
}

//== assembly =====================================================
module set_extru (onface=false, angle=24, incline=15, orient=8, filp=filpos) { // display extruder
plthk=2.5;   //extruder base plate thickness
diagear = 9;  // MK8 gear drive room in the lever (diam 8, filament diameter )
BBposx = 0;  
BBpos = -6.5-diagear/2-0.5-0.3;  // Position of the ball bearing / motor axis  
dec= -4.5;  // filament axis dist to motor axis
//angle = 24;  // filament angle / vertical - in set_extru parameter
tens_angle = -87; // bolt tensioner angle (relative to lever)  
tens_h = 22;  // one coordinate of tensioner rotation axis position
wdist= -11.5;  // distance between filament axis and motor plane
  // extruders are rotated and they are designed 'flat on table' 
dup = ($simple_extru)?0:1;  
  
//Filament parameters   
  fila1_y = filp[0][0];
  fila1_z = filp[0][1];
  fila1_l = filp[0][2];
  fila2_y = filp[1][0];
  fila2_z = filp[1][1];
  fila2_l = filp[1][2];
  
  rotz (-90)
    rot (0,90,-90) {
      color ("aqua")
        if (onface) 
          extruder_base2 (dec, diagear, angle, tens_angle, tens_h);
        else
          extruder_base (dec, diagear, angle, tens_angle, tens_h);
    // accessories 
      duplx (extru_space, dup) {
        gray()  rot(180) nema17(); // ??
        silver() cylz (8,-12, 0,0,-5); // ??
        rotz (angle) {
          color ("yellow") {// filament
            cylx (1.75,fila1_l,   -10,dec,wdist);
            tsl (-10+fila1_l,dec,wdist) 
              rot (0,fila1_y,fila1_z) {
                cylx (1.75,fila2_l);
                tsl (fila2_l) 
                  rot (0,fila2_y,fila2_z) 
                    cylx (1.75,50); 
              }  
          }  
          color ("white")
            cylx (4,-60, -10,dec,wdist);
          color ("orange") 
            tslz (wdist)
              ex_lever(dec, diagear, angle, tens_angle, tens_h) ;
          color ("grey") {
            cylz (-13,5,  BBposx,BBpos,wdist); // bearing
            cylz (-4,15, BBposx,BBpos,wdist); // bearing shaft
            tsl (tens_h, 5, wdist)  // tensioner bolt
              rotz(tens_angle) 
                cylx (4,-45,  2); 
          }
          color ("blue") 
          tsl (tens_h, 5, wdist)  // tensioner arti
            rotz(tens_angle)
              ex_tens(); 
        }  
      }
      if (!onface) {
        color ("lime") mirrorz() antivib();
        color ("red") extruder_guide(incline, orient); 
      }
    }
}


//== utilities =====================================================

module nema17(lg=40) { // NEMA 17 stepper motor. - replace by STL ??
  color("grey")
    difference() {
      union() {
        intersection() {
          cubez(42.2, 42.2, lg,0,0,-lg);
          cylz(50.1,lg+1,0,0,-lg-0.5,60);
        }
        cylz(22,2,0,0,0,32);
        cylz(5,24,0,0,0,24);
      }
      for (a = [0:90:359]) 
        rotz(a) cylz(-3,10, 15.5,15.5);
    }
}

module dupl(v) {children();  translate (v)children();}