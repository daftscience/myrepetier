#!/bin/bash
rm ~/myrepetier/combine/*
ln -s ~/Repetier-Firmware/src/ArduinoAVR/Repetier/* ~/myrepetier/combine/

rm ~/myrepetier/combine/Configuration.h
rm ~/myrepetier/combine/uiconfig.h
rm ~/myrepetier/combine/pins.h

cp ~/myrepetier/Makefile ~/myrepetier/combine/


ln -s ~/myrepetier/Configuration.h ~/myrepetier/combine/
ln -s ~/myrepetier/uiconfig.h ~/myrepetier/combine/
ln -s ~/myrepetier/pins.h ~/myrepetier/combine/
