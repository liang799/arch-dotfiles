#!/bin/sh

keyboard=/usr/local/share/fonts/otf/fontawesome-pro-5.13.0-desktop/svgs/solid/keyboard.svg
mouse=/usr/local/share/fonts/otf/fontawesome-pro-5.13.0-desktop/svgs/solid/mouse.svg

if [ $(xinput list-props "TPPS/2 IBM TrackPoint" | grep 'Device Enabled' | gawk -F ':' '{ print $2 }') -eq 0 ]; then
	xinput enable "TPPS/2 IBM TrackPoint"
	dunstify --icon=$mouse "Nipple Enabled" "Your computer's trackpoint is enabled."
else
	xinput disable "TPPS/2 IBM TrackPoint"
	dunstify --icon=$keyboard "Nipple Disabled" "Your computer's trackpoint is disabled."
fi
