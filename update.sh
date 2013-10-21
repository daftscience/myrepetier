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

HOLD=true;

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

cp "$EDITED/Makefile" "$COMBINE"

function diff(){
	for i in "${files[@]}"
	do
		clear
		echo -e "\n$i\n"
		colordiff "$EDITED/$i" "$RHS/$i"
		read -n1 -r -p "Press any key to continue"
	done
}


#while true; do
#//	read -p "Get Diffs?(y/n)" yn
#//	case $yn in 
#//		[Yy]* ) diff; break;;
#//		[Nn]* ) exit;;
#//		*) echo -e "\nPease answer yes or no.";;
#//	esac
#//done


while $HOLD; do
	echo -e "\n"
   read -p "[M]ake? Make [U]pload? [E]xit: " yn
   case $yn in
      [Mm]* ) cd "$COMBINE"; make; break;;
      [Uu]* ) cd "$COMBINE"; make upload; break;;
      [Ee]* ) exit;;
      *) echo "Pease answer M, U, or E";;
   esac
done
