#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Start Pulseaudio
pulseaudio --start &

# Custom screen colors
/usr/bin/xrandr --output LVDS1 --gamma 0.715:0.785:0.760

# wal load settings
wal -t -R

exec i3
