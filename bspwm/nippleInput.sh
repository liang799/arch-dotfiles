#!/bin/sh

if [ $(xinput list-props 11 | grep 'Device Enabled' | gawk -F ': ' '{ print $2 }') -eq 0 ]; then
	xinput enable 11
	dunstify --icon=/usr/share/icons/mate/scalable/actions/touchpad-enabled.svg "Enabled" "Your computer's touchpad is enabled."
else
	xinput disable 11
	dunstify --icon=/usr/share/icons/mate/scalable/actions/touchpad-disabled.svg "Disabled" "Your computer's touchpad is disabled."
fi
