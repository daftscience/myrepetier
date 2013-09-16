#!/bin/bash


echo "Removing old files"
rm -r  ~/myrepetier/combine
mkdir ~/myrepetier/combine

echo "Updating Repetier"
cd ~/Repetier-Firmware
git pull
cd ~/

echo "Copying repetier files"
cp -r ~/Repetier-Firmware/src/ArduinoAVR/Repetier/* ~/myrepetier/combine/

echo "Replacing modified files"

files=( "pins.h" "uiconfig.h")
files+=("Configuration.h")

printf "\t%s\n" "${files[@]}"

for i in "${files[@]}"
	do
		rm ~/myrepetier/combine/$i
		ln -s ~/myrepetier/$i ~/myrepetier/combine/
	done


function diff(){
	for i in "${files[@]}"
	do
		echo $i
		colordiff ~/myrepetier/$i ~/Repetier-Firmware/src/ArduinoAVR/Repetier/$i
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
