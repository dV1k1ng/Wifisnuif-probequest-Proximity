#!/bin/bash
#

int=`sudo airmon-ng | grep 8187 | cut -d $'\t' -f2`
monitor=${int}mon

if [ $monitor -eq '' ]; then
	sleep 30
	reboot
fi
