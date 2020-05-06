# ASH Power distribution board

This board manages power control and distribution for my Octapod.

The power board has the following responsibilites:
* Regulate servo voltage from 2 or 3S Li-ion battery packs.
* Measure voltage and current to servos.
* Supply the main board with power (not regulated).
* Provide soft-start functionality for servos.
* Control power on/off to servos.
* Protect batteries with UVLO and OVLO.
~~* Integrated charger using external USB-C supply.~~
* Provide an interface for both main board MCU(I2C) and NVM(serial-SCPI).

[Schematic](https://htmlpreview.github.io/?https://github.com/Atmelfan/pcb-ash-power/blob/master/schematic.PDF)

[Assembly diagram](https://htmlpreview.github.io/?https://github.com/Atmelfan/pcb-ash-power/blob/master/assembly.PDF)

[Bill of material](https://htmlpreview.github.io/?https://github.com/Atmelfan/pcb-ash-power/blob/master/bom.html)
