Bowden extruder, direct drive, simple or double, 3 types mount:
* Side of a panel, with bowden biased entry in panel
* Face of a panel
* On rod
An optional filament guide allow installation of a sponge and filament detector.
Level articulate directly in supports without any metallic part
Its design is not really original, but it minimize the fittings required.
This extruder is part of the Lily boxed delta printer design and was initially designed for the D-Box printer.
It could be used for any printer and so is released independantly
(c) Pierre ROUZEAU Jan-march 2016
files in : https://github.com/PRouzeau/Bowden-extruder-direct-drive
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
  
