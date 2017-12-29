#!/usr/bin/env bash

if [ -f $HOME/.Xresources ]; then
	xrdb -merge $HOME/.Xresources
fi

wal -r

nitrogen --reload

exec bspwm

