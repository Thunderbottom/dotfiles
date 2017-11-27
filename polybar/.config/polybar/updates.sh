#!/bin/bash
xbps=$(xbps-install -Suvn 2> /dev/null | wc -l)

if [ $xbps -eq "0" ]; then
	echo " "
else
	echo " $xbps"
fi
