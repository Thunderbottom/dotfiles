#!/usr/bin/env bash

PATH=$PATH:$HOME/scripts

if [ -f $HOME/.Xresources ]; then
	xrdb -merge $HOME/.Xresources
fi

exec bspwm
