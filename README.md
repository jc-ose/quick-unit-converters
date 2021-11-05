# quick-unit-converters
Quick unit conversion utilities for matlab

## Description
This repository contains several utilities for flexible unit conversion in matlab. 

The current functions are:
 - cvlength - Length unit conversions (mm, in, m, etc.)
 - cvangle - Angle unit conversions (rad, deg, arcseconds, etc.)
 - cvdigital - Digital storage unit conversions (bytes, kilobytes, bits, etc.)

All functions have three inputs:

 1. `valIn` (double, any size) - The value(s) you want to convert
 2. `unitIn` (char) - The name of the unit the value(s) are currently in. This is flexible, as in 'mm', 'millimeter', and 'millimeters' will all work.
 3. `unitOut` (char) - The name of the unit the value(s) should be converted too. Like `unitIn`, this is also flexible. 

All functions have one output:

 1. `valOut` (double, same size as `valIn`) - The converted values.


### Special Cases: 

cvlength supports units in waves at any wavelength. To specify a unit in waves, the format is:
- `'wv' + value + units` (examples wv1.0um | wv632.8nm | wv0.55microns)
- Example: `valInNm = cvlength(valInWaves,'wv632.8nm','nm');`
