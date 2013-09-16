myrepetier
==========

This is a script to help me keep my firmware config changes intact while still being able to pull
the most up to date version from github

It's pretty simple
Basically it will pull the latest version of the firmware ```$RH```, then copy the new source files ```$RHS``` 
into a separate working folder ```$COMBINE```. It will then copy your modified files ```$files``` from this repository
```$EDITED``` to the same working folder, overwriting them.

It will then print a colorDiff comparing your edited files with the new version from latest firmware. Use this to
ensure there aren't any more changes than you originally made. 

Finally, it will ask if you want to make, then make upload. (For this you need arduino and arduino-MK)


Changes to update.sh simply change the variables at the top

$EDITED is the location where this git is cloned
$COMBINE can be anywhere you have permission to write to.
$RH is where the clone of Repetier host is stored
  This is used for git pull
$RHS is where the source code is kept. 

'''
##Location of this git clone
EDITED="/home/ubuntu/myrepetier"
#Folder where we are going to combine edited files with unedited
COMBINE="/home/ubuntu/.repetierworkingfolder"
#folder where RH source code is (unmodified)
RH="/home/ubuntu/Repetier-Firmware"
RHS="/home/ubuntu/Repetier-Firmware/src/ArduinoAVR/Repetier"
files=( "pins.h" "uiconfig.h" "Configuration.h")
'''
