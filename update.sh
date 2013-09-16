#!/bin/bash


##Location of this git clone
EDITED="/home/ubuntu/myrepetier"
#Folder where we are going to combine edited files with unedited
COMBINE="/home/ubuntu/.repetierworkingfolder"
#folder where RH source code is (unmodified)
RH="/home/ubuntu/Repetier-Firmware"
RHS="/home/ubuntu/Repetier-Firmware/src/ArduinoAVR/Repetier"
files=( "pins.h" "uiconfig.h" "Configuration.h")

## Because I will forget, this is a quick way to add to array
#files+=("Configuration.h")
printf "\t%s\n" "${files[@]}"



echo "Removing old files"
rm -r  "$COMBINE"
mkdir "$COMBINE"

echo "Updating Repetier"
cd "$RH"
git pull

echo "Copying repetier files"
cp -r "$RHS/"* "$COMBINE/"

echo "Replacing modified files"
for i in "${files[@]}"
	do
      cp "$EDITED/$i" "$COMBINE"
	done

function diff(){
	for i in "${files[@]}"
	do
		echo "$i"
		colordiff "$EDITED/$i" "$RHS/$i"
		echo "$EDITED/$i" "$RHS/$i"
		read -n1 -r -p "Press any key to continue"
	done
}

while true; do
	read -p "Check differences? (y/n)" yn
	case $yn in 
		[Yy]* ) diff; break;;
		[Nn]* ) exit;;
		*) echo "Pease answer yes or no.";;
	esac
done
